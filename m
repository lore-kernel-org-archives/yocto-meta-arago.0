Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 725715207C
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 16:17:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u78GH37M011450
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:17:03 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u78GH24E014107
	for <meta-arago@arago-project.org>; Mon, 8 Aug 2016 11:17:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 Aug 2016 11:17:02 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u78GH2bO013826;	Mon, 8 Aug 2016 11:17:02 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Aug 2016 12:16:48 -0400
Message-ID: <1470673008-28768-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [PATCH] glfw3: add version 3.1.2
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
X-List-Received-Date: Mon, 08 Aug 2016 16:17:04 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../glfw3/files/0001_xkb_unicode.patch             | 52 ++++++++++++++++++++++
 .../recipes-graphics/glfw3/glfw3_git.bb            | 24 ++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.patch
 create mode 100644 meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb

diff --git a/meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.patch b/meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.patch
new file mode 100644
index 0000000..7c9b9d3
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.patch
@@ -0,0 +1,52 @@
+--- a/src/xkb_unicode.c	2015-10-12 15:09:07.000000000 -0400
++++ b/src/xkb_unicode.c	2016-04-08 08:20:23.229370629 -0400
+@@ -1,5 +1,5 @@
+ //========================================================================
+-// GLFW 3.1 X11 - www.glfw.org
++// GLFW 3.1patched X11 - www.glfw.org
+ //------------------------------------------------------------------------
+ // Copyright (c) 2002-2006 Marcus Geelnard
+ // Copyright (c) 2006-2010 Camilla Berglund <elmindreda@elmindreda.org>
+@@ -827,24 +827,24 @@
+   { 0x13be, 0x0178 },
+   { 0x20ac, 0x20ac },
+   // Numeric keypad with numlock on
+-  { XK_KP_Space, ' ' },
+-  { XK_KP_Equal, '=' },
+-  { XK_KP_Multiply, '*' },
+-  { XK_KP_Add, '+' },
+-  { XK_KP_Separator, ',' },
+-  { XK_KP_Subtract, '-' },
+-  { XK_KP_Decimal, '.' },
+-  { XK_KP_Divide, '/' },
+-  { XK_KP_0, 0x0030 },
+-  { XK_KP_1, 0x0031 },
+-  { XK_KP_2, 0x0032 },
+-  { XK_KP_3, 0x0033 },
+-  { XK_KP_4, 0x0034 },
+-  { XK_KP_5, 0x0035 },
+-  { XK_KP_6, 0x0036 },
+-  { XK_KP_7, 0x0037 },
+-  { XK_KP_8, 0x0038 },
+-  { XK_KP_9, 0x0039 }
++  { 0xff80 /*XKB_KEY_KP_Space*/,     ' ' },
++  { 0xffbd /*XKB_KEY_KP_Equal*/,     '=' },
++  { 0xffaa /*XKB_KEY_KP_Multiply*/,  '*' },
++  { 0xffab /*XKB_KEY_KP_Add*/,       '+' },
++  { 0xffac /*XKB_KEY_KP_Separator*/, ',' },
++  { 0xffad /*XKB_KEY_KP_Subtract*/,  '-' },
++  { 0xffae /*XKB_KEY_KP_Decimal*/,   '.' },
++  { 0xffaf /*XKB_KEY_KP_Divide*/,    '/' },
++  { 0xffb0 /*XKB_KEY_KP_0*/, 0x0030 },
++  { 0xffb1 /*XKB_KEY_KP_1*/, 0x0031 },
++  { 0xffb2 /*XKB_KEY_KP_2*/, 0x0032 },
++  { 0xffb3 /*XKB_KEY_KP_3*/, 0x0033 },
++  { 0xffb4 /*XKB_KEY_KP_4*/, 0x0034 },
++  { 0xffb5 /*XKB_KEY_KP_5*/, 0x0035 },
++  { 0xffb6 /*XKB_KEY_KP_6*/, 0x0036 },
++  { 0xffb7 /*XKB_KEY_KP_7*/, 0x0037 },
++  { 0xffb8 /*XKB_KEY_KP_8*/, 0x0038 },
++  { 0xffb9 /*XKB_KEY_KP_9*/, 0x0039 }
+ };
+ 
+ 
diff --git a/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb b/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
new file mode 100644
index 0000000..aa1abe9
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "GLFW cross platform graphics framework"
+DESCRIPTION = "A multi-platform library for OpenGL and OpenGLES, window and input"
+HOMEPAGE = "http://glfw.org/"
+LICENSE = "Zlib & Libpng"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f543d41f3829a608a406b713e4e72731"
+
+PV = "3.1.2"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glfw/glfw.git;branch=${BRANCH}"
+SRCREV = "30306e54705c3adae9fe082c816a3be71963485c"
+
+SRC_URI += "file://0001_xkb_unicode.patch"
+
+DEPENDS = "glib-2.0 virtual/libgles2 virtual/egl weston wayland wayland-native"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += "-DGLFW_USE_WAYLAND=ON -DGLFW_CLIENT_LIBRARY=glesv2 -DGLFW_BUILD_EXAMPLES=ON -DGFLW_BUILD_TESTS=ON"
+
+FILES_${PN} += "/usr/lib/cmake/*"
-- 
1.9.1


