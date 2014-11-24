Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7C4FB520EA
	for <meta-arago@arago-project.org>;
	Mon, 24 Nov 2014 12:56:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sAOCuA7o003117
	for <meta-arago@arago-project.org>; Mon, 24 Nov 2014 06:56:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sAOCuAbB025415
	for <meta-arago@arago-project.org>; Mon, 24 Nov 2014 06:56:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Nov 2014 06:56:10 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sAOCu7PN025316;	Mon, 24 Nov 2014 06:56:09 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Nov 2014 18:21:04 +0530
Message-ID: <1416833465-19027-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416833465-19027-1-git-send-email-a0393906@ti.com>
References: <1416833465-19027-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master, v2 2/3] bt-firmware: Add support for dra7xx-evm target
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
X-List-Received-Date: Mon, 24 Nov 2014 12:56:11 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 4400215..3c40441 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -11,9 +11,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RREPLACES_${PN}  = "linux-firmware-wl12xx"
 
-PR = "r5+gitr${SRCPV}"
+PR = "r6+gitr${SRCPV}"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|dra7xx-evm"
 
 SRCREV = "fbcab22449ce930a4192ffeb470c168f4e85e0c6"
 BRANCH = "master"
-- 
1.7.9.5


