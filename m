Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id EFBE152A51
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 22:54:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9W006F6Q9R4L90@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 06 Aug 2014 17:53:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3F23B2032C; Wed,
	06 Aug 2014 18:53:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 06 Aug 2014 18:53:45 -0400
Message-id: <1407365627-29059-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1407365627-29059-1-git-send-email-denis@denix.org>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/4] qtbase: add additional dependencies for GLES check on omap-a15 platforms
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
X-List-Received-Date: Wed, 06 Aug 2014 22:54:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

GLES libraries for omap-a15 platforms come in binary form and are pre-built
against libdrm and libwayland libraries. When qtbase tries to do a check
for GLES support, it fails to link the test app, when libdrm and libwayland
are not yet available in sysroots:

| OpenGL ES 2.x auto-detection... ()
| ...-g++ ... -o opengles2.o .../qtbase-opensource-src-5.2.1/config.tests/unix/opengles2/opengles2.cpp
| ...-g++ ... -o opengles2 opengles2.o -lsrv_um -lGLESv2
| .../bin/ld: warning: libdrm.so.2, needed by .../usr/lib/libsrv_um.so, not found (try using -rpath or -rpath-link)
| .../bin/ld: warning: libwayland-server.so.0, needed by .../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath-link)
| .../bin/ld: warning: libdrm_omap.so.1, needed by .../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath-link)
| ...
| collect2: error: ld returned 1 exit status
| Makefile:103: recipe for target 'opengles2' failed
| make: *** [opengles2] Error 1
| OpenGL ES 2.x disabled.
| The OpenGL ES 2.0 functionality test failed!

Add libdrm and wayland as extra dependencies for qtbase when building on
omap-a15 with gles flag enabled.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
new file mode 100644
index 0000000..c879313
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
@@ -0,0 +1,6 @@
+GLES_EXTRA_DEPS = ""
+GLES_EXTRA_DEPS_omap-a15 = "libdrm wayland"
+
+PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
+
+PR_append = "-arago0"
-- 
2.0.4


