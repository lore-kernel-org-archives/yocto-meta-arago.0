Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 27E31529A9
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 12:51:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ACp7Wp030788
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 07:51:07 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ACp6LD016243
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 07:51:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 07:51:05 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ACp4cq021182;
	Fri, 10 Apr 2015 07:51:05 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Apr 2015 18:21:02 +0530
Message-ID: <1428670262-8416-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-arago PATCH v3] weston: Add custom profile into targetfs
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
X-List-Received-Date: Fri, 10 Apr 2015 12:51:08 -0000
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
 .../recipes-graphics/wayland/weston/wayland_env.sh |    7 ++++++-
 .../recipes-graphics/wayland/weston_1.6.0.bbappend |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
index a0e3b90..b885337 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/wayland_env.sh
@@ -3,6 +3,11 @@
 ### Wayland Environment Variables ###
 
 export XDG_CONFIG_HOME=/etc/
-export XDG_RUNTIME_DIR=/run/user/root
+export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
 export WAYLAND_DISPLAY=wayland-0
 export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
+
+if ! test -d "${XDG_RUNTIME_DIR}"; then
+       mkdir -p "${XDG_RUNTIME_DIR}"
+       chmod 0700 "${XDG_RUNTIME_DIR}"
+fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index b0e8985..af504b4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.7.9.5


