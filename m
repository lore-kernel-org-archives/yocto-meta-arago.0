Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 56CBC52972
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 06:12:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUN00HJWAK8U0B0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 14 Oct 2013 01:12:08 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 34CF620087; Mon,
	14 Oct 2013 02:12:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Oct 2013 02:12:05 -0400
Message-id: <1381731127-17880-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/3] qtwebkit-examples: fix pushed upstream, remove locally
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
X-List-Received-Date: Mon, 14 Oct 2013 06:12:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/qtwebkit-examples/examples-build.patch        | 9 ---------
 .../recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend              | 5 -----
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
deleted file mode 100644
index d7dc6ae..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
+++ /dev/null
@@ -1,9 +0,0 @@
-diff -uNr qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.pro qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
---- qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.pro	2013-07-02 03:10:27.000000000 -0400
-+++ qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro	2013-09-29 21:31:10.761137146 -0400
-@@ -2,4 +2,4 @@
- 
- load(qt_parts)
- 
--SUBDIRS += doc
-+SUBDIRS += doc examples
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
deleted file mode 100644
index 7e41331..0000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://examples-build.patch"
-
-PR_append = "-arago0"
-- 
1.8.3.2


