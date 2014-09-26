Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 5865252A76
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI005PHM833060@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:41:04 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 78C492018E; Fri,
	26 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:34 -0400
Message-id: <1411746038-21612-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411746038-21612-1-git-send-email-denis@denix.org>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/7] weston: update to version 1.6.0
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
X-List-Received-Date: Fri, 26 Sep 2014 15:41:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{weston_1.5.0.bb => weston_1.6.0.bb}              | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-arago-extras/recipes-graphics/wayland/{weston_1.5.0.bb => weston_1.6.0.bb} (91%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
similarity index 91%
rename from meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
rename to meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
index e1ff61b..efbbbe0 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.6.0.bb
@@ -5,18 +5,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
                     file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
 
-BRANCH = "master"
-SRCREV = "880193622024d7dc2b36421251d97b08da324570"
-
-SRC_URI = "git://anongit.freedesktop.org/wayland/weston;protocol=git;branch=${BRANCH} \
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://disable-wayland-scanner-pkg-check.patch \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
 "
-
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "c60ce9dde99a089db0539d8f6b557827"
+SRC_URI[sha256sum] = "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b8c4d1d4acaaa614d"
 
 inherit autotools pkgconfig useradd
 
@@ -63,6 +60,8 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 # Weston with webp support
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
+# Weston with libinput backend
+PACKAGECONFIG[libinput] = "--enable-libinput-backend,--disable-libinput-backend,libinput"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.0.4


