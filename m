Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 404BA52007
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 18:20:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TIKVJK027031
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 12:20:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TIKVj2016528
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 12:20:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 12:20:31 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TIKVws000587;
	Fri, 29 Jan 2016 12:20:31 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPDeo-000857-O9; Fri, 29 Jan 2016 13:20:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 13:20:29 -0500
Message-ID: <1454091629-31031-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: ti43x: Limit resolution to prevent HDMI display underrun
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
X-List-Received-Date: Fri, 29 Jan 2016 18:20:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-graphics/wayland/weston/ti43x/weston.ini        | 13 +++++++++++++
 .../recipes-graphics/wayland/weston_1.9.0.bbappend          |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini
new file mode 100644
index 0000000..b2b7927
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/ti43x/weston.ini
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
+name=HDMI1
+mode=1024x768
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
index 4aff58d..1a85eca 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -21,3 +21,5 @@ PACKAGES += "${PN}-conf"
 
 FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
 RDEPENDS_${PN} += "${PN}-conf"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


