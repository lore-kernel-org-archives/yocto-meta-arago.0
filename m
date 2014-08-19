Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2D5E652AB6
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:46:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGk5AA016546
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:05 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGk512030004
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:46:04 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGk3DU000803;	Tue, 19 Aug 2014 11:46:04 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqM017239;	Tue, 19 Aug 2014 22:16:02 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:51 -0500
Message-ID: <1408466752-4458-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408466752-4458-1-git-send-email-fcooper@ti.com>
References: <1408466752-4458-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 7/8] weston: Update commit used for weston 1.5.0
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
X-List-Received-Date: Tue, 19 Aug 2014 16:46:06 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Update the version of Weston to pull in libinput dependency and several
  features and bug fixes.
* Update configure to use libinput instead of using built in input handling
* Copy changes from Weston 1.4.0 append.
* Use ini file to disable unwanted features.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/wayland/weston/weston.ini     |   10 ++++++++++
 ...weston_1.4.0.bbappend => weston_1.5.0.bbappend} |   17 +++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
 copy meta-arago-distro/recipes-graphics/wayland/{weston_1.4.0.bbappend => weston_1.5.0.bbappend} (58%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
new file mode 100644
index 0000000..8caa891
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
@@ -0,0 +1,10 @@
+[shell]
+locking=false
+animation=zoom
+panel-location=none
+startup-animation=fade
+
+[screensaver]
+# Uncomment path to disable screensaver
+#path=@libexecdir@/weston-screensaver
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
similarity index 58%
copy from meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
copy to meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
index e62cfa3..4a1e313 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.5.0.bbappend
@@ -1,19 +1,28 @@
-PR_append = "-arago2"
-
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
+PR_append = "-arago0"
+
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += "file://wayland_env.sh"
+DEPENDS += "libinput"
+
+SRC_URI += "file://wayland_env.sh \
+            file://weston.ini \
+"
+
+SRCREV = "e67118c80ad411ac46b7096aae2635510c80ea6d"
+
+EXTRA_OECONF += "--enable-libinput-backend"
 
 # Add custom Arago Wayland Environment script file
 do_install_append () {
     install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
 }
 
 PACKAGES += "${PN}-conf"
 
-FILES_${PN}-conf += "${sysconfdir}/profile.d/*"
+FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
 RDEPENDS_${PN} += "${PN}-conf"
-- 
1.7.9.5


