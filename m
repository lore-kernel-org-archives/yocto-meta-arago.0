Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1A46E5299B
	for <meta-arago@arago-project.org>;
	Mon, 21 Mar 2016 15:02:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LF2OMT011766
	for <meta-arago@arago-project.org>; Mon, 21 Mar 2016 10:02:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LF2OoP013559
	for <meta-arago@arago-project.org>; Mon, 21 Mar 2016 10:02:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 10:02:24 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LF2OJ4023468;
	Mon, 21 Mar 2016 10:02:24 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ai1Lb-0005kz-J0; Mon, 21 Mar 2016 11:02:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 21 Mar 2016 11:02:20 -0400
Message-ID: <1458572540-22095-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openmpacc: Upgrade to version 1.3.1.1
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
X-List-Received-Date: Mon, 21 Mar 2016 15:02:25 -0000
Content-Type: text/plain

* Adds K2G support
* Implements workaround for locale issue in the examples

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
index 4f55d0d..4a00578 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP Accelerator Model"
 HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
 LICENSE = "BSD"
 
-PV = "1.3.0.1"
+PV = "1.3.1.1"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
@@ -13,7 +13,7 @@ OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
 OMPACC_GIT_PROTOCOL = "git"
 OMPACC_GIT_BRANCH = "master"
 
-OMPACC_SRCREV = "814accdbb441a3b258a548c6fbaa087b314ee18b"
+OMPACC_SRCREV = "a2b22adc8759bf1f5f1f999dcda0fdfa88ba9eba"
 
 BRANCH = "${OMPACC_GIT_BRANCH}"
 SRC_URI = "${OMPACC_GIT_URI};protocol=${OMPACC_GIT_PROTOCOL};branch=${BRANCH}"
-- 
1.9.1


