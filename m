Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DF8D052A70
	for <meta-arago@arago-project.org>;
	Fri, 11 Mar 2016 22:02:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2BM2JVX006608
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2BM2J8q016102
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Mar 2016 16:02:19 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2BM2I6H011570;	Fri, 11 Mar 2016 16:02:18 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Mar 2016 17:02:10 -0500
Message-ID: <1457733732-18531-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457733732-18531-1-git-send-email-h-gou@ti.com>
References: <1457733732-18531-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] hevc-arm-decoder: add support for keystone platforms
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
X-List-Received-Date: Fri, 11 Mar 2016 22:02:20 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
index c871177..d5f438f 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "ARM HEVC Decoder with Unit Test Application"
 HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM := "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "dra7xx"
+COMPATIBLE_MACHINE = "dra7xx|keystone"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL.HEVC.D.ARM.OBJ.${PV}.tar.gz;name=hevc-arm-decoder"
 
-- 
1.9.1


