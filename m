Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id E2EDB529E8
	for <meta-arago@arago-project.org>;
	Tue, 22 Mar 2016 17:53:13 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4G003CZCB7NM10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 22 Mar 2016 12:52:25 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=lysd0JPjbPGsYdvbEz4A:9
Received: by 100.15.86.14 with SMTP id 5b346923; Tue, 22 Mar 2016 17:52:25 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9E28B161F42;	Tue,
	22 Mar 2016 13:52:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Mar 2016 13:52:19 -0400
Message-id: <1458669139-29129-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: apply enumeration restriction to card0 patch to version 1.6
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
X-List-Received-Date: Tue, 22 Mar 2016 17:53:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-udev-seat-restrict-udev-enumeration-to-card0.patch            | 0
 meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend       | 3 ++-
 2 files changed, 2 insertions(+), 1 deletion(-)
 copy meta-arago-distro/recipes-graphics/wayland/{weston => weston-1.6.0}/0001-udev-seat-restrict-udev-enumeration-to-card0.patch (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch b/meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
similarity index 100%
copy from meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
copy to meta-arago-distro/recipes-graphics/wayland/weston-1.6.0/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index 45e7024..03b1b93 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -2,13 +2,14 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago7"
+PR_append = "-arago8"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:${THISDIR}/${PN}:"
 
 SRC_URI += "file://wayland_env.sh \
             file://weston.ini \
             file://0001-weston-Enabling-DRM-backend-with-multiple-displays.patch \
+            file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 "
 
 # Add custom Arago Wayland Environment script file
-- 
2.2.0


