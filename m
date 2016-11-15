Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B9EA552AA9
	for <meta-arago@arago-project.org>;
	Tue, 15 Nov 2016 17:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE3EB2099C;
	Tue, 15 Nov 2016 17:38:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id maEuLuNZXp-3; Tue, 15 Nov 2016 17:38:51 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C0D52091B;
	Tue, 15 Nov 2016 17:38:50 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id EBE5D162199;
	Tue, 15 Nov 2016 12:38:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 15 Nov 2016 12:38:49 -0500
Message-Id: <1479231529-15794-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] hevc-arm-decoder: update to compile with gcc-6 and/or internal toolchain
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
X-List-Received-Date: Tue, 15 Nov 2016 17:38:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
index 0e79921..b5f6ead 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
@@ -1,23 +1,27 @@
-DESCRIPTION = "ARM HEVC Decoder with Unit Test Application"
+SUMMARY = "ARM HEVC Decoder with Unit Test Application"
 HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM := "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
-PR = "r2"
+LIC_FILES_CHKSUM = "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL.HEVC.D.ARM.OBJ.${PV}.tar.gz;name=hevc-arm-decoder"
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL.HEVC.D.ARM.OBJ.${PV}.tar.gz \
+           file://Testparams.cfg \
+"
 
-SRC_URI[hevc-arm-decoder.md5sum] = "bb7620e34175f53a1ed989f7ce8f6d29"
-SRC_URI[hevc-arm-decoder.sha256sum] = "e5743478e94bcfcee2e59e2e0056ece648c11bcbac91a6a8b8e492e3b42738d4"
+SRC_URI[md5sum] = "bb7620e34175f53a1ed989f7ce8f6d29"
+SRC_URI[sha256sum] = "e5743478e94bcfcee2e59e2e0056ece648c11bcbac91a6a8b8e492e3b42738d4"
 
 S = "${WORKDIR}/HEVC.D.ARM.${PV}/ARM_001"
 
-SRC_URI_append = " file://Testparams.cfg"
+do_configure() {
+    sed "s/-lpthread/-pthread/g" -i ${S}/Client/Build/ARM/makefile
+}
 
 do_compile() {
     cd ${S}/Client/Build/ARM
-    make
+    oe_runmake CC="${CC}" LINKER="${CC}"
 }
 
 do_install() {
-- 
2.7.4


