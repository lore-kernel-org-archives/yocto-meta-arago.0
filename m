Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 18530529D2
	for <meta-arago@arago-project.org>;
	Thu, 26 Mar 2015 13:15:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2QDFFKa021990
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 08:15:15 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QDFEVw027587
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 08:15:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Mar 2015 08:15:13 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QDFC0x007279;
	Thu, 26 Mar 2015 08:15:13 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 Mar 2015 18:45:10 +0530
Message-ID: <1427375710-19479-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: weston: Add .profile into the targetfs
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
X-List-Received-Date: Thu, 26 Mar 2015 13:15:16 -0000
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
 .../recipes-graphics/wayland/weston_1.6.0.bbappend |    7 +++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index 4e9901d..7826c65 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -5,23 +5,26 @@ PACKAGECONFIG[wayland] = "--enable-wayland-compositor WESTON_NATIVE_BACKEND="drm
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
             file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
+            file://profile \
 "
 
 # Add custom Arago Wayland Environment script file
 do_install_append () {
     install -d ${D}${sysconfdir}/profile.d
+    install -d ${D}/home/root
     install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${WORKDIR}/profile ${D}/home/root/.profile
 }
 
 PACKAGES += "${PN}-conf"
 
-FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
+FILES_${PN}-conf += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini  /home/root/.profile"
 RDEPENDS_${PN} += "${PN}-conf"
-- 
1.7.9.5


