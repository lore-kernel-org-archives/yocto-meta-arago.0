Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2B33A52A28
	for <meta-arago@arago-project.org>;
	Tue,  2 Jun 2015 11:50:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t52BoonQ028186
	for <meta-arago@arago-project.org>; Tue, 2 Jun 2015 06:50:50 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t52BooDT020236
	for <meta-arago@arago-project.org>; Tue, 2 Jun 2015 06:50:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 06:50:49 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t52BooDB019204;	Tue, 2 Jun 2015 06:50:50 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YzkiX-0007dL-Ml;
	Tue, 02 Jun 2015 07:50:49 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jun 2015 07:50:48 -0400
Message-ID: <1433245848-29299-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] img-pvr-sdk: IMG PowerVR SDK based demos
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
X-List-Received-Date: Tue, 02 Jun 2015 11:50:52 -0000
Content-Type: text/plain

* This is a package with pre-built demos
* These demos will work on DRM
* Also contains utilities for SGX performance measurement

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v3 changes:
* Modified installation so that pre-built demos as installed to the
  same location as a previous package which provided the SGX demos.
  - Installation for the previous package was specified in the meta-ti
    layer in the file: recipes-graphics/libgles/libgles-omap3-no-x.inc

 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
new file mode 100644
index 0000000..6e7cb6e
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Imagination PowerVR SDK binaries for Jacinto6 SoC"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://Jacinto6-IMG-PowerVR-SDK-Manifest.pdf;md5=46bcbfc69f8837c339e15fd4a5044a8c"
+
+SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git"
+SRCREV = "c2456ec3f03da022fb7489d6b381a4ac26a68203"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "dra7xx"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}/opt/img-powervr-sdk
+    cp -ar ${S}/targetfs/PVRHub ${D}/opt/img-powervr-sdk
+    cp -ar ${S}/targetfs/PVRScopeDeveloper ${D}/opt/img-powervr-sdk
+
+    install -d ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ChameleonMan ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Coverflow ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2ExampleUI ${D}${bindir}/SGX/demos/Raw/
+    install -m 755 ${S}/targetfs/Examples/Advanced/OGLES2Navigation ${D}${bindir}/SGX/demos/Raw/
+}
+
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+INSANE_SKIP_${PN} += "dev-so staticdev"
+
+FILES_${PN} += " \
+    /opt/img-powervr-sdk/PVRHub/* \
+    /opt/img-powervr-sdk/PVRScopeDeveloper/* \
+"
-- 
1.7.9.5


