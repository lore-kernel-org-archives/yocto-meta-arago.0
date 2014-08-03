Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 277F252972
	for <meta-arago@arago-project.org>;
	Sun,  3 Aug 2014 20:45:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R0047E0ACVW10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 03 Aug 2014 15:44:47 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3991A21E8A; Sat,
	02 Aug 2014 21:10:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Aug 2014 21:10:21 -0400
Message-id: <1407028221-9762-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
In-reply-to: <1407028221-9762-1-git-send-email-denis@denix.org>
References: <1407028221-9762-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/5] arago.conf: drop removal of "sgx" feature, update version
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
X-List-Received-Date: Sun, 03 Aug 2014 20:45:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ff99ef2..4927fe9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,8 +1,6 @@
-QT_PROVIDER = "qt5"
-
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2014.06"
+DISTRO_VERSION = "2014.08"
 
 # SDK paths and names
 SDK_NAME_PREFIX = "arago"
@@ -29,6 +27,9 @@ PACKAGECONFIG_pn-weston = "fbdev launch"
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu"
 
+# Set preferred Qt version
+QT_PROVIDER = "qt5"
+
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
 TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
@@ -48,9 +49,6 @@ TARGET_CPPFLAGS += "-fstack-protector"
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
 
-# Hack out sgx flag for now, as breaking on kernels >= 3.14
-MACHINE_FEATURES_remove = "sgx"
-
 # Remove the ASSUME_PROVIDED setting for git-native so that we can
 # use the latest version for the sourceipk which leads to a smaller
 # git history.
-- 
2.0.2


