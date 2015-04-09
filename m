Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EA903529A9
	for <meta-arago@arago-project.org>;
	Thu,  9 Apr 2015 12:34:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t39CYcaN008244
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 07:34:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39CYbaT015192
	for <meta-arago@arago-project.org>; Thu, 9 Apr 2015 07:34:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Apr 2015 07:34:36 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t39CYZ4M005499;
	Thu, 9 Apr 2015 07:34:36 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Apr 2015 18:04:33 +0530
Message-ID: <1428582873-438-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: weston: Add custom profile into targetfs
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
X-List-Received-Date: Thu, 09 Apr 2015 12:34:39 -0000
Content-Type: text/plain

There are different set of requirements on the bootup behavior
across different platforms. To name a few:
 * J6, the required behavior is console/command prompt
 * AM57xx, it will be the matrix-gui (QT5 on Wayland)

weston-init recipe addresses the needs of AM57xx.
This patch is needed for J6/J6-Eco etc.

Note that if there are customers on AM57xx who need the default behavior
to be console/command prompt, this patch will address those needs.
It does not conflict with weston-init.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/wayland/weston/profile        |    8 ++++++++
 .../recipes-graphics/wayland/weston/wayland_env.sh |    2 +-
 .../recipes-graphics/wayland/weston_1.6.0.bbappend |    4 +++-
 3 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/profile

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/profile b/meta-arago-distro/recipes-graphics/wayland/weston/profile
new file mode 100644
index 0000000..0848c18
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/profile
@@ -0,0 +1,8 @@
+if test -z "${XDG_RUNTIME_DIR}"; then
+       export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
+fi
+
+if ! test -d "${XDG_RUNTIME_DIR}"; then
+       mkdir -p "${XDG_RUNTIME_DIR}"
+       chmod 0700 "${XDG_RUNTIME_DIR}"
+fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
index a0e3b90..70a7d17 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
@@ -3,6 +3,6 @@
 ### Wayland Environment Variables ###
 
 export XDG_CONFIG_HOME=/etc/
-export XDG_RUNTIME_DIR=/run/user/root
+export XDG_RUNTIME_DIR=/tmp
 export WAYLAND_DISPLAY=wayland-0
 export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index b0e8985..e3a9089 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,13 +2,14 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
             file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
+            file://profile \
 "
 
 # Add custom Arago Wayland Environment script file
@@ -16,6 +17,7 @@ do_install_append () {
     install -d ${D}${sysconfdir}/profile.d
     install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile.d/weston_profile
 }
 
 PACKAGES += "${PN}-conf"
-- 
1.7.9.5


