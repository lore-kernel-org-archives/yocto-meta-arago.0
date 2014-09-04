Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 38A2352992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 20:07:15 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBE00LLU7VF9P40@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 04 Sep 2014 15:06:51 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D98012008C; Thu,
	04 Sep 2014 16:06:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 04 Sep 2014 16:06:50 -0400
Message-id: <1409861210-28560-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] recipes: HACK: disable parallel make for out-of-tree modules due to fixdep race
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
X-List-Received-Date: Thu, 04 Sep 2014 20:07:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

* The fixdep race happens in the kernel tree when building out-of-tree modules
* It is intermittent and doesn't happen allways, but depend on high # of threads
* Need to investigate it further, but currently it's blocking release builds
* There's a previous report on LKML:
https://groups.google.com/forum/#!msg/linux.kernel/j4DdW77nM60/QhgPF1jhKe4J

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend              | 4 +++-
 .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend       | 4 +++-
 .../ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb     | 9 +++++----
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
index 8915917..8acb67a 100644
--- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
+++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
@@ -1,4 +1,6 @@
-PR_append = "-arago4+gitr${SRCPV}"
+PR_append = "-arago5+gitr${SRCPV}"
+
+PARALLEL_MAKE = ""
 
 RDEPENDS_${PN} += "linaro-pm-qa-utils"
 
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
index 7be7536..52bb6db 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend
@@ -1,4 +1,6 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
+
+PARALLEL_MAKE = ""
 
 module_autoload_cryptodev = "cryptodev-module"
 
diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
index dca2edb..fe75284 100644
--- a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
+++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
@@ -12,7 +12,9 @@ RDEPENDS_${PN} = "wireless-tools"
 PV = "r8.a9.14"
 inherit module
 
-PR = "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}+b+gitr${SRCPV}"
+
+PARALLEL_MAKE = ""
 
 # Tags: ol_r8.a9.14
 SRCREV_wl18xx = "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
@@ -26,7 +28,7 @@ S = "${WORKDIR}/compat-wireless"
 
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx.git;branch=${BRANCH_wl18xx};destsuffix=wl18xx;name=wl18xx \
            git://git.ti.com/wilink8-wlan/backports.git;branch=${BRANCH_backports};destsuffix=backports;name=backports \
- "
+"
 
 export KLIB_BUILD="${STAGING_KERNEL_DIR}"
 export KLIB="${D}"
@@ -41,11 +43,10 @@ do_configure() {
     make defconfig-wl18xx
 
     # Now generate the sourceipk with the properly configured sources
-	sourceipk_do_create_srcipk
+    sourceipk_do_create_srcipk
 }
 
 do_install() {
     # Install modules
     oe_runmake modules_install
 }
-
-- 
2.0.4


