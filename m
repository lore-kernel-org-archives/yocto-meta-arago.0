Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 4921B52981
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 02:47:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGC0016GIFGT000@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 09 Dec 2014 20:47:41 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=GpX1IfxH c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8	a=MUyJFTbz8wMvUs60QdoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CDA7820015;	Tue,
	9 Dec 2014 21:47:40 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 09 Dec 2014 21:47:39 -0500
Message-id: <1418179659-13972-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] qtwebkit: mark as machine-specific due to MMIP being such
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
X-List-Received-Date: Wed, 10 Dec 2014 02:47:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
index 1085f20..9f75d92 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_git.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 	file://GraphicsSurfaceToken.h.patch \
@@ -7,4 +9,4 @@ SRC_URI += " \
 	file://WebCore.pri.patch \
 "
 
-PR_append = "-arago2"
+PR_append = "-arago3"
-- 
2.1.2


