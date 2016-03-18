Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id EEE1952A27
	for <meta-arago@arago-project.org>;
	Fri, 18 Mar 2016 17:17:02 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4800242VZZ3A60@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Mar 2016 12:16:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=EGU_KJDdnLjsBuGhkGQA:9
Received: by 100.15.86.14 with SMTP id 4bba41c9; Fri, 18 Mar 2016 17:16:47 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 35228161EE8;	Fri,
	18 Mar 2016 13:16:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Mar 2016 13:16:46 -0400
Message-id: <1458321406-21615-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] hevc-arm-decoder: don't make it machine-specific
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
X-List-Received-Date: Fri, 18 Mar 2016 17:17:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb                   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
index d5f438f..0e79921 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
@@ -2,9 +2,8 @@ DESCRIPTION = "ARM HEVC Decoder with Unit Test Application"
 HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM := "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
-PR = "r1"
+PR = "r2"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL.HEVC.D.ARM.OBJ.${PV}.tar.gz;name=hevc-arm-decoder"
-- 
2.2.0


