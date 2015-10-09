Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 693E45299C
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 13:30:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99DUsef030424
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 08:30:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99DUs98028882
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 08:30:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 08:30:54 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99DUsqa009928;
	Fri, 9 Oct 2015 08:30:54 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZkXl7-0005Bp-QQ; Fri, 09 Oct 2015 09:30:53 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 09:30:51 -0400
Message-ID: <1444397451-19915-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston: Update weston.ini to show top panel
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
X-List-Received-Date: Fri, 09 Oct 2015 13:30:58 -0000
Content-Type: text/plain

* This provides a clock along with a shortcut to the weston-terminal

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston/weston.ini     | 2 +-
 meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
index 8caa891..615a604 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/weston.ini
@@ -1,7 +1,7 @@
 [shell]
 locking=false
 animation=zoom
-panel-location=none
+panel-location=top
 startup-animation=fade
 
 [screensaver]
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index af504b4..fb7cda0 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago6"
+PR_append = "-arago7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


