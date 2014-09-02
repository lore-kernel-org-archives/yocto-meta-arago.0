Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 279AA52A26
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 15:31:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBA0095L5RA6U00@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 02 Sep 2014 10:30:57 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 98FC12011D; Tue,
	02 Sep 2014 11:30:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 02 Sep 2014 11:30:45 -0400
Message-id: <1409671845-31432-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] packagegroup-arago-test: add perf package for performance analysis
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
X-List-Received-Date: Tue, 02 Sep 2014 15:31:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                               | 3 +++
 .../recipes-core/packagegroups/packagegroup-arago-test.bb              | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c86b255..2841790 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -33,6 +33,9 @@ PACKAGECONFIG_pn-weston = "fbdev launch"
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples tslib"
 
+# Enable UI and scripting for perf
+PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
+
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
 TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 0f3d01e..9077c96 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r20"
+PR = "r21"
 
 inherit packagegroup
 
@@ -21,6 +21,7 @@ ARAGO_TEST = "\
     stress \
     yavta \
     rng-tools \
+    perf \
     "
 
 ARAGO_TI_TEST_am57xx-evm = ""
-- 
2.0.4


