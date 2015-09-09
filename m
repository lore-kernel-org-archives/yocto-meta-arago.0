Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 66DF7529AC
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 16:58:52 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF004Q55TOJ7B0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Sep 2015 11:58:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=sbJ0hzf4moB_IR_OYwwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EB895161BCB;	Wed,
	9 Sep 2015 12:58:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Sep 2015 12:58:35 -0400
Message-id: <1441817915-21263-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] qtwebkit: update bbappend to be version agnostic
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
X-List-Received-Date: Wed, 09 Sep 2015 16:58:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend     | 10 ++++++++++
 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
new file mode 100644
index 0000000..26bda41
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+	file://GraphicsSurfaceGL_NoX.cpp.patch \
+	file://GraphicsSurfaceToken.h.patch \
+	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch \
+	file://WebCore.pri.patch \
+"
+
+PR_append = "-arago4"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend
deleted file mode 100644
index 26bda41..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.1.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += " \
-	file://GraphicsSurfaceGL_NoX.cpp.patch \
-	file://GraphicsSurfaceToken.h.patch \
-	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch \
-	file://WebCore.pri.patch \
-"
-
-PR_append = "-arago4"
-- 
2.2.0


