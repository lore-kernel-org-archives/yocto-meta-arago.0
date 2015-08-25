Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id A389E5297D
	for <meta-arago@arago-project.org>;
	Tue, 25 Aug 2015 16:22:57 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTN003C4C5BZK80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 25 Aug 2015 11:22:28 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=-N8asvoHo5zwWriW2bUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 78982161BB0;	Tue,
	25 Aug 2015 12:22:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 25 Aug 2015 12:22:23 -0400
Message-id: <1440519743-30430-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] nativesdk-qtbase: locally apply path length increase patch for now
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
X-List-Received-Date: Tue, 25 Aug 2015 16:23:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Submitted upstream, need to remove once accepted.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...xpand-path-increase-change-to-2-more-path.patch | 28 ++++++++++++++++++++++
 .../recipes-qt/qt5/nativesdk-qtbase_%.bbappend     |  5 ++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
new file mode 100644
index 0000000..fc54c64
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase/0001-configure-expand-path-increase-change-to-2-more-path.patch
@@ -0,0 +1,28 @@
+From cfa358e04b9e7c66d59db3000b2a2ab2ebf543c8 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 25 Aug 2015 11:26:48 -0400
+Subject: [PATCH] configure: expand path increase change to 2 more paths
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index bea14af..fe18487 100755
+--- a/configure
++++ b/configure
+@@ -3853,8 +3853,8 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+ /* Installation Info */
+ static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
+ #ifdef QT_BUILD_QMAKE
+-static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
+-static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
++static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
++static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
+ #endif
+ 
+ static const short qt_configure_str_offsets[] = {
+-- 
+2.2.0
+
diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
new file mode 100644
index 0000000..39f739a
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-configure-expand-path-increase-change-to-2-more-path.patch"
+
+PR_append = "-arago0"
-- 
2.2.0


