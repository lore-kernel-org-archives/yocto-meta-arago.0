Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id D6BB952A32
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 01:51:24 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00LH5IHO6870@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 20:51:24 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 003E7204AB; Wed,
	23 Apr 2014 21:51:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 21:51:15 -0400
Message-id: <1398304280-15426-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398304280-15426-1-git-send-email-denis@denix.org>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/8] qtbase: move setting PACKAGECONFIG flags to arago.conf
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
X-List-Received-Date: Thu, 24 Apr 2014 01:51:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf               | 5 +++++
 meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend | 4 +---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1c8c572..7bd1de2 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -26,6 +26,11 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
 DISTRO_FEATURES += "opengl"
 PACKAGECONFIG_pn-weston = "kms fbdev"
 
+# Configure Qt5 flags (GLES is disabled for now)
+#PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
+PACKAGECONFIG_GL_pn-qtbase = "linuxfb"
+PACKAGECONFIG_DISTRO_pn-qtbase = "icu"
+
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
 TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
index d35a948..2c0a52d 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
@@ -1,10 +1,8 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PACKAGECONFIG_GL = "icu linuxfb"
-
 SRC_URI += " \
 	file://0001-qeglfswindow.cpp.patch \
 	file://0002-qeglfswindow.cpp.patch \
 "
 
-PR_append = "-arago0"
+PR_append = "-arago1"
-- 
1.9.2


