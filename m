Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id B237C52A62
	for <meta-arago@arago-project.org>;
	Tue,  4 Nov 2014 01:43:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH00LD6RFP6X40@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 19:43:03 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ao9ZB15K c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=9Z0iB09Yk661lIAGk6AA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4C29C202F0;	Mon,
	3 Nov 2014 20:43:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 20:42:48 -0500
Message-id: <1415065371-27167-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415065371-27167-1-git-send-email-denis@denix.org>
References: <1415065371-27167-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/6] qtwayland: remove bbappends to checkout the right version
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Patches fixing touchscreen issues were moved to distro location and need to
be re-validated if something is still needed with 5.4, but they don't apply
as is any more.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/qtwayland-native_git.bbappend              |  3 ---
 meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend       | 11 -----------
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
 delete mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend

diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
deleted file mode 100644
index 64de589..0000000
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland-native_git.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago1"
-
-QT_MODULE_BRANCH = "5.4"
diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
deleted file mode 100644
index 1911a9e..0000000
--- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-PR_append = "-arago3"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-Fix-touch-with-Weston.patch \
-            file://0001-Wayland-correct-touch-location.patch \
-            file://0001-Wayland-can-drag-a-window-by-its-titlebar-using-the-.patch \
-"
-
-
-QT_MODULE_BRANCH = "5.4"
-- 
2.1.2


