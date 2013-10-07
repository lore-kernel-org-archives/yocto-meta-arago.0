Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id F23B6529AF
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2013 19:01:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB00CCKBH2I6J0@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Oct 2013 14:00:40 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CA5B1201BB; Mon,
	07 Oct 2013 15:00:39 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Oct 2013 15:00:22 -0400
Message-id: <1381172427-18302-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381172427-18302-1-git-send-email-denis@denix.org>
References: <1381172427-18302-1-git-send-email-denis@denix.org>
Subject: [PATCH 07/12] webkit-examples: enable building and packaging of examples
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
X-List-Received-Date: Mon, 07 Oct 2013 19:01:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/qtwebkit-examples/examples-build.patch        | 9 +++++++++
 .../recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend              | 5 +++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
new file mode 100644
index 0000000..d7dc6ae
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.patch
@@ -0,0 +1,9 @@
+diff -uNr qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.pro qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
+--- qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.pro	2013-07-02 03:10:27.000000000 -0400
++++ qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro	2013-09-29 21:31:10.761137146 -0400
+@@ -2,4 +2,4 @@
+ 
+ load(qt_parts)
+ 
+-SUBDIRS += doc
++SUBDIRS += doc examples
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
new file mode 100644
index 0000000..7e41331
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://examples-build.patch"
+
+PR_append = "-arago0"
-- 
1.8.3.2


