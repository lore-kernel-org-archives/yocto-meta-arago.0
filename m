Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 17303529D9
	for <meta-arago@arago-project.org>;
	Mon, 15 Dec 2014 23:39:39 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGN001LRDP50510@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 15 Dec 2014 17:39:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=B94OC1pJ c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=_WErdvyh7ubz-QREFywA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 451D120088;	Mon,
	15 Dec 2014 18:39:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 15 Dec 2014 18:39:03 -0500
Message-id: <1418686744-10569-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/4] qt5: update bbappends for 5.4.0 version
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
X-List-Received-Date: Mon, 15 Dec 2014 23:39:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend      | 6 ------
 .../recipes-qt/qt5/{qtbase_git.bbappend => qtbase_5.4.0.bbappend}   | 0
 .../qt5/{qtwebkit_git.bbappend => qtwebkit_5.4.0.bbappend}          | 0
 3 files changed, 6 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_git.bbappend => qtbase_5.4.0.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_git.bbappend => qtwebkit_5.4.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
deleted file mode 100644
index 99f35c2..0000000
--- a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR_append = "-arago0"
-
-# CMake's toolchain configuration of nativesdk-qtbase
-SRC_URI += " \
-    file://OEQt5Toolchain.cmake \
-"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_git.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_5.4.0.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_5.4.0.bbappend
-- 
2.2.0


