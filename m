Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6024A52A00
	for <meta-arago@arago-project.org>;
	Tue,  7 Jul 2015 11:57:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67BvKvq006355
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 06:57:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67BvKK2017706
	for <meta-arago@arago-project.org>; Tue, 7 Jul 2015 06:57:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 06:57:07 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67BvKLQ019002;	Tue, 7 Jul 2015 06:57:20 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1ZCRV2-0001eG-0x;
	Tue, 07 Jul 2015 07:57:20 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Jul 2015 07:57:16 -0400
Message-ID: <1436270237-6306-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] hevc-arm-decoder: Add HEVC (H.265) decoder library and unit test.
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
X-List-Received-Date: Tue, 07 Jul 2015 11:57:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../hevc-arm-decoder/Testparams.cfg                |   23 ++++++++++
 .../hevc-arm-decoder_01.00.00.01.bb                |   45 ++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
 create mode 100644 meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
new file mode 100644
index 0000000..5f01863
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
@@ -0,0 +1,23 @@
+# New Input File Format is as follows
+# <ParameterName> = <ParameterValue> # Comment
+################################################################################
+# Parameters
+################################################################################
+#################################### No. of threads ############################
+NumThreads = 2
+################################### Files ######################################
+InputFile   		= /usr/share/ti/video/TearOfSteel-Short-1280x720.265
+OutputFile   		= /usr/share/ti/examples/h265vdec/TearOfSteel-Short-1280x720.yuv
+ReferenceFile   	= /usr/share/ti/video/dummy
+ImageWidth          = 1280  # Image width in Pels
+ImageHeight         = 720   # Image height in Pels
+FramesToDecode      = 50   # Number of frames to be coded
+InputLowDelayMode   = 0     # 0->Entire frame, 1 -> Slice mode (Data sync mode)
+OutputLowDelayMode  = 0     # 0->Entire frame, 1 -> Number of CTU rows (Data sync mode)
+NumCTURows          = 0     # 0->Non-DataSync mode, Non-Zero positive when OutputLowDelayMode is set to Data sync mode
+MetadataType        = 0     # 0->No Metadata, 1-SEI, 2-VUI 3-SEI and VUI
+###################################################################
+# Dynamic Parameters
+###################################################################
+DecodeHeader         = 0    # 0 -> Disable decode Header mode, 1 -> Enable decode Header mode
+
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
new file mode 100644
index 0000000..c871177
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "ARM HEVC Decoder with Unit Test Application"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM := "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "dra7xx"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL.HEVC.D.ARM.OBJ.${PV}.tar.gz;name=hevc-arm-decoder"
+
+SRC_URI[hevc-arm-decoder.md5sum] = "bb7620e34175f53a1ed989f7ce8f6d29"
+SRC_URI[hevc-arm-decoder.sha256sum] = "e5743478e94bcfcee2e59e2e0056ece648c11bcbac91a6a8b8e492e3b42738d4"
+
+S = "${WORKDIR}/HEVC.D.ARM.${PV}/ARM_001"
+
+SRC_URI_append = " file://Testparams.cfg"
+
+do_compile() {
+    cd ${S}/Client/Build/ARM
+    make
+}
+
+do_install() {
+    install -d ${D}${libdir}
+    install -m 755 ${S}/Lib/h265vdec_pp_lib.a ${D}${libdir}
+
+    install -d ${D}${includedir}
+    install -m 644 ${S}/Inc/exp_pp_h265decoder.h ${D}${includedir}
+
+    install -d ${D}${bindir}
+    install -m 755 ${S}/Client/Build/ARM/Out/h265vdec_pp ${D}${bindir}
+
+    install -d ${D}${datadir}/ti/examples/h265vdec
+    install -m 644 ${WORKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
+
+    install -d ${D}${docdir}/${PN}
+    for doc in ${S}/Docs/*; do
+        install -m 664 ${doc} ${D}${docdir}/${PN}
+    done
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/*  \
+"
-- 
1.7.9.5


