Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0B66C5297E
	for <meta-arago@arago-project.org>;
	Mon, 19 Jun 2017 19:50:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5JJo8qe026655
	for <meta-arago@arago-project.org>; Mon, 19 Jun 2017 14:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497901808;
	bh=NHyOsmvKg8VKA9JeMFjGKydOUbZgMjyYPkq15aLmMgw=;
	h=From:To:CC:Subject:Date;
	b=V+pHPXhCy0ReFtHNyBximGmYdGHOpEsXNf9nrWAZ788G66xWl+mq/RXPZAM1Vng5L
	RaPzewyAgpH1OAmnjZTa3n+BTIuoO9yipWnYUIg3h2fCbG2Aoeh0MOB6rJ4+tYry0+
	k3+Mg3fma/hit5+wxYpeu/Eci7CGMxD4O+t/IDJI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5JJo8Fh017221
	for <meta-arago@arago-project.org>; Mon, 19 Jun 2017 14:50:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Jun 2017 14:50:08 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5JJo8hg021000;	Mon, 19 Jun 2017 14:50:08 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Jun 2017 15:43:57 -0400
Message-ID: <1497901439-31567-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] packagegroup-arago-tisdk-matrix: add "extra" packagegroup
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jun 2017 19:50:10 -0000
Content-Type: text/plain

* Create an "extra" variant of this packagegroup for packages which
  may cause a base filesystem to exceed a physical size limitation.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index acfdeea..7402427 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,11 +1,13 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r65"
+PR = "r66"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
+PACKAGES =+ "${PN}-extra"
+
 MATRIX_ESSENTIALS = "        \
     matrix-gui               \
     matrix-lighttpd-config   \
@@ -147,5 +149,8 @@ RDEPENDS_${PN} = "        \
     ${MATRIX_APPS}        \
     ${@bb.utils.contains('MACHINE_FEATURES','sgx',"${MATRIX_SGX_DEMOS}",'',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp',"${MATRIX_OPENCL_APPS}",'',d)} \
+"
+
+RDEPENDS_${PN}-extra = " \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp',"${MATRIX_OPENCV_OPENCL_APPS}",'',d)} \
 "
-- 
2.7.4


