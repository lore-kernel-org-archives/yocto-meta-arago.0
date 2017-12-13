Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EE7DE52986
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 17:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6B257208CC;
	Wed, 13 Dec 2017 17:19:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YJb7BjdH5NPW; Wed, 13 Dec 2017 17:19:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4258420433;
	Wed, 13 Dec 2017 17:19:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D86FA162752;
	Wed, 13 Dec 2017 12:19:41 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 13 Dec 2017 12:19:40 -0500
Message-Id: <1513185580-26249-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] opencl: update to 1.1.14.8, fix ICD gcc7 conformance, RDEPENDS on bash
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
X-List-Received-Date: Wed, 13 Dec 2017 17:19:45 -0000

From: Gaurav Mitra <gaurav@ti.com>

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc       | 4 ++--
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 9a3fb70..ffa3cbe 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.14.7"
+PV = "1.1.14.8"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "2be51882b5c1f0f8a97fddcc7e8db2b09db41dfe"
+OCL_SRCREV = "caf4a0e55831ea34e3659e81877aaffde29ccfd1"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 4daef6b..fdc822d 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -35,6 +35,7 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
 DEPENDS_remove_k2g = " libulm"
 
+RDEPENDS_${PN} += " bash"
 RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
 RDEPENDS_${PN}-runtime += " ${PN} opencl-monitor clocl ti-cgt6x"
 
-- 
2.7.4


