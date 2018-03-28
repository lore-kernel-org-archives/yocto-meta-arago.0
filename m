Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6F71652970
	for <meta-arago@arago-project.org>;
	Wed, 28 Mar 2018 21:59:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2SLxm6r020038
	for <meta-arago@arago-project.org>; Wed, 28 Mar 2018 16:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522274389;
	bh=mj4btqYpX7gGwvakd8/79FzwMcWMb+7qp+9BvR5uamk=;
	h=From:To:Subject:Date;
	b=AT0jOr+h5NiCQXh4EA9rn6nScU2EZgs59cbYluHkRD5nvZsEUBfQyM767+TEGK27G
	SMpVNE6LcfU3YLbLjW8OVORhuH81EhLOeGfVGZEPYOroXhKs4h9CZETy33ehgaaS9q
	0fdFV8XguZ03TLPPjAE5qrKVBPU6aZ75Bqf/Ddho=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2SLxmpN024039
	for <meta-arago@arago-project.org>; Wed, 28 Mar 2018 16:59:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 28 Mar 2018 16:59:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 28 Mar 2018 16:59:48 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2SLxmxe004751
	for <meta-arago@arago-project.org>; Wed, 28 Mar 2018 16:59:48 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Mar 2018 17:59:44 -0400
Message-ID: <1522274384-35142-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH] qtwayland: fix the display issue of qwindow-compositor for AM3/4
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
X-List-Received-Date: Wed, 28 Mar 2018 21:59:55 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...positor-compositor.cpp-fix-display-issue-.patch | 42 ++++++++++++++++++++++
 .../recipes-qt/qt5/qtwayland_git.bbappend          |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-qwindow-compositor-compositor.cpp-fix-display-issue-.patch

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-qwindow-compositor-compositor.cpp-fix-display-issue-.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-qwindow-compositor-compositor.cpp-fix-display-issue-.patch
new file mode 100644
index 0000000..b5337c0
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-qwindow-compositor-compositor.cpp-fix-display-issue-.patch
@@ -0,0 +1,42 @@
+From b63395a9ff48b1a60fdb7efb7c439f42f1d8c459 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 28 Mar 2018 17:36:44 -0400
+Subject: [PATCH] qwindow-compositor: compositor.cpp: fix display issue for
+ AM3/4
+
+On OpenGL ES 2 core implementation, only GL_CLAMP_TO_EDGE parameter is
+supported as wrap mode for NPOT (non power of two dimension) textures.
+However, the default parameter is GL_REPEAT.
+An extension OES_texture_npot adds the support of other GL_REPEAT
+and GL_MIRRORED_REPEAT to the wrap. However, many openGLES2 cores do
+not support this extension. Therefore, it is much safer to specify the
+wrap mode as GL_CLAMP_TO_EDGE.
+
+Note: This patch is for QT5.7.1 (morty) only because the qtwayland has been
+re-implemented at QT5.9.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ examples/wayland/qwindow-compositor/compositor.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/examples/wayland/qwindow-compositor/compositor.cpp b/examples/wayland/qwindow-compositor/compositor.cpp
+index c60ecc6..ced0014 100644
+--- a/examples/wayland/qwindow-compositor/compositor.cpp
++++ b/examples/wayland/qwindow-compositor/compositor.cpp
+@@ -81,8 +81,11 @@ GLuint View::getTexture(GLenum *target)
+             glGenTextures(1, &m_texture);
+ 
+         glBindTexture(m_textureTarget, m_texture);
+-        if (buf.isShm())
++        if (buf.isShm()) {
+             glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
++            glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
++            glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
++	}
+         buf.bindToTexture();
+     }
+ 
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
index 82d98e5..2bb7974 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
@@ -1,6 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 SRC_URI += " \
     file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
+    file://0001-qwindow-compositor-compositor.cpp-fix-display-issue-.patch \
 "
-- 
1.9.1


