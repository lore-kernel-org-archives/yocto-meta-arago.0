Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id CB87452A80
	for <meta-arago@arago-project.org>;
	Tue, 22 Mar 2016 23:43:31 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4G00IMHSJYRZ40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 22 Mar 2016 18:43:11 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=lysd0JPjbPGsYdvbEz4A:9
Received: by 100.15.86.14 with SMTP id 3b7a5578; Tue, 22 Mar 2016 23:43:11 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9F113161F4C;	Tue,
	22 Mar 2016 19:42:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Mar 2016 19:42:58 -0400
Message-id: <1458690178-10388-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: backport output/HDMI .ini config for AM4 from version 1.9 to 1.6
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
X-List-Received-Date: Tue, 22 Mar 2016 23:43:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini  | 13 +++++++++++++
 .../recipes-graphics/wayland/weston_1.6.0.bbappend          |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
new file mode 100644
index 0000000..b863ba8
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/ti43x/weston.ini
@@ -0,0 +1,13 @@
+[shell]
+locking=false
+animation=zoom
+panel-location=top
+startup-animation=fade
+
+[screensaver]
+# Uncomment path to disable screensaver
+#path=@libexecdir@/weston-screensaver
+
+[output]
+name=HDMI-A-1
+mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index 03b1b93..a52c8e0 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago8"
+PR_append = "-arago9"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:${THISDIR}/${PN}:"
 
-- 
2.2.0


