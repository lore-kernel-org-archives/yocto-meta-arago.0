Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id D876D5296D
	for <meta-arago@arago-project.org>;
	Thu, 21 Jan 2016 21:11:53 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1B004ADMUSCNA0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 21 Jan 2016 15:11:17 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=lysd0JPjbPGsYdvbEz4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 44039161E05;	Thu,
	21 Jan 2016 16:11:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 21 Jan 2016 16:11:15 -0500
Message-id: <1453410675-17913-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: update bbappend for new version
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
X-List-Received-Date: Thu, 21 Jan 2016 21:11:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Drop 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch - may need updating

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{weston_1.6.0.bbappend => weston_1.9.0.bbappend}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_1.6.0.bbappend => weston_1.9.0.bbappend} (88%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
similarity index 88%
rename from meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index fb7cda0..4aff58d 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,13 +2,12 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago7"
+PR_append = "-arago0"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
-            file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
 "
 
 # Add custom Arago Wayland Environment script file
-- 
2.2.0


