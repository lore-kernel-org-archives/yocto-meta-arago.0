Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 84061529CF
	for <meta-arago@arago-project.org>;
	Tue,  4 Nov 2014 01:43:39 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH009F4RFQY260@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 19:43:20 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=HrPBwPXX c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=r9DEmYe3lt4WIxuBboMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4F2D42032C;	Mon,
	3 Nov 2014 20:43:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 20:42:49 -0500
Message-id: <1415065371-27167-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415065371-27167-1-git-send-email-denis@denix.org>
References: <1415065371-27167-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/6] qtbase, qtwebkit: update bbappends for version 5.4
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Drop some patches that no longer apply to qtwebkit

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/{qtbase_5.2.1.bbappend => qtbase_git.bbappend}       | 0
 .../recipes-qt/qt5/{qtwebkit_5.2.1.bbappend => qtwebkit_git.bbappend}   | 2 --
 2 files changed, 2 deletions(-)
 rename meta-arago-distro/recipes-qt/qt5/{qtbase_5.2.1.bbappend => qtbase_git.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt5/{qtwebkit_5.2.1.bbappend => qtwebkit_git.bbappend} (78%)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_git.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtbase_git.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
similarity index 78%
rename from meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
rename to meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
index 63461f5..1085f20 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
@@ -1,10 +1,8 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
-	file://GraphicsContext3DQt.cpp.patch \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 	file://GraphicsSurfaceToken.h.patch \
-	file://qttestbrowser.cpp.patch \
 	file://0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch \
 	file://WebCore.pri.patch \
 "
-- 
2.1.2


