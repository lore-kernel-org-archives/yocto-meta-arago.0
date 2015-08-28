Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1BEA052A97
	for <meta-arago@arago-project.org>;
	Fri, 28 Aug 2015 04:01:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S41wAN024558
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S41wgh030755
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 23:01:58 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S41vid027352;	Thu, 27 Aug 2015 23:01:58 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Aug 2015 00:01:51 -0400
Message-ID: <1440734514-16165-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440734514-16165-1-git-send-email-h-gou@ti.com>
References: <1440734514-16165-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] img-pvr-sdk: update source of Imagination demo binaries for AM3 and AM4
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
X-List-Received-Date: Fri, 28 Aug 2015 04:01:59 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               | 28 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 6e7cb6e..8943501 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -2,12 +2,18 @@ DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
 
-SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git"
-SRCREV = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
+BRANCH_omap-a15 = "master"
+BRANCH_ti33x = "am4/k4.1"
+BRANCH_ti43x = "am4/k4.1"
 
-PR = "r0"
+SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
+SRCREV_omap-a15 = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
+SRCREV_ti33x = "f753b6c00168f9dd534c2b34206845d3cdddabe6"
+SRCREV_ti43x = "f753b6c00168f9dd534c2b34206845d3cdddabe6"
 
-COMPATIBLE_MACHINE = "dra7xx"
+PR = "r1"
+
+COMPATIBLE_MACHINE = "dra7xx|ti43x|ti33x"
 
 S = "${WORKDIR}/git"
 
@@ -18,11 +24,25 @@ do_install () {
 
     install -d ${D}${bindir}/SGX/demos/Raw/
     install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
+}
+
+do_install_append_omap-a15 () {
     install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
     install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
     install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
 }
 
+do_install_append_ti33x () {
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESEvilSkull ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESFilmTV ${D}${bindir}/SGX/demos/Raw/
+}
+
+do_install_append_ti43x () {
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2MagicLantern ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESEvilSkull ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLESFilmTV ${D}${bindir}/SGX/demos/Raw/
+}
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-- 
1.9.1


