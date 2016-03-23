Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id AE49C529E3
	for <meta-arago@arago-project.org>;
	Wed, 23 Mar 2016 15:16:55 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4H00EAOZRKY280@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Mar 2016 10:16:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=lysd0JPjbPGsYdvbEz4A:9
Received: by 100.15.86.14 with SMTP id 6e41b249; Wed, 23 Mar 2016 15:16:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 990A0161F45;	Wed,
	23 Mar 2016 11:16:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Mar 2016 11:16:31 -0400
Message-id: <1458746191-30454-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: fix HDMI config entry name that differs slightly in 1.6
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
X-List-Received-Date: Wed, 23 Mar 2016 15:16:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini              | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
index b863ba8..b2b7927 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
@@ -9,5 +9,5 @@ startup-animation=fade
 #path=@libexecdir@/weston-screensaver
 
 [output]
-name=HDMI-A-1
+name=HDMI1
 mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index a52c8e0..916ab88 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago9"
+PR_append = "-arago10"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:${THISDIR}/${PN}:"
 
-- 
2.2.0


