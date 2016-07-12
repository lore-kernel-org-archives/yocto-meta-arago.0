Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 434D752A35
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 18:56:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6CIuC90001929
	for <meta-arago@arago-project.org>; Tue, 12 Jul 2016 13:56:12 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6CIuC3m009245
	for <meta-arago@arago-project.org>; Tue, 12 Jul 2016 13:56:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 12 Jul 2016 13:56:11 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u6CIuB7W032420;	Tue, 12 Jul 2016 13:56:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Jul 2016 14:55:32 -0400
Message-ID: <1468349733-14480-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1468349733-14480-1-git-send-email-j-stiffler@ti.com>
References: <1468349733-14480-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] matrix-gui-apps-git: bump SRCREV for fixes and enhancements
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
X-List-Received-Date: Tue, 12 Jul 2016 18:56:12 -0000
Content-Type: text/plain

* mc_demo_ipc: add k2g
* utility_flash: update parsing of mtd size to make it usable for nanddump
* utility_flash: remove nandwrite portion from the demo
* multimedia_apps: runIvahdH264Dec: use alsasink for audio on AM572x IDK
* multimedia_apps: runAACDec: define audio sink for AM5
* multimedia_apps: add dsp66_multimedia_imgproc demo
* multimedia_apps: dsp66_multimedia_imgproc: update path of the description html page
* dsp66_multimedia_imgproc: update description html page
* multimedia_apps: add dsp66_multimedia_imgproc_f2f demo
* mc_demo_ipc: udpate location of dsp_image in scripts
* multimedia_apps: update audiosink for AACDec and IvahdH264Dec demos
* 3d_apps: add printf for the 3D demos to indicate the test completion
* multimedia_apps: update audiosink for AACDec and IvahdH264Dec demos
* usbbonnie: print error if mounted partition not found
* multimedia_apps: update amixer settings for AM5 demos with audio
* arm_multimedia_audiocapture: add support for AM4 and AM5
* machinevision: add submenu and dlp_3d_scanner application
* machinevision_dlp_3d_scanner: update demo description page
* arm_apps: add posix_smp demo
* machinevision_dlp_3d_scanner: update demo description

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 8edcb2b..3641a50 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "497b2c6c9b748a3b3c5911bff200e027be45e0db"
+SRCREV = "a51c0d791e5b15452196f6903ef077401738e631"
 BRANCH = "master"
-INC_PR = "r40"
+INC_PR = "r41"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.7.4


