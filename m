Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 5039E52A8F
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2015 21:35:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTA00IUQRYSOT90@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 18 Aug 2015 16:35:17 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=50o7BiKYPaE7JBuskb4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D68F7161B76;	Tue,
	18 Aug 2015 17:35:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 18 Aug 2015 17:35:16 -0400
Message-id: <1439933716-9676-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] pm-qa: bbappend to bump rev and apply local patches useful for testing
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
X-List-Received-Date: Tue, 18 Aug 2015 21:35:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...001-Return-non-zero-value-on-test-failure.patch | 26 ++++++++++
 .../pm-qa/0002-cpuidle-Avoid-relative-paths.patch  | 56 ++++++++++++++++++++++
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend        | 10 ++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
 create mode 100644 meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch
 create mode 100644 meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
new file mode 100644
index 0000000..a5b5b8c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0001-Return-non-zero-value-on-test-failure.patch
@@ -0,0 +1,26 @@
+From: Carlos Hernandez <ceh@ti.com>
+Subject: [meta-arago][linaro pm-qa PATCH 1/2] Return non-zero value on test failure
+Date: Thu, 13 Aug 2015 15:03:00 -0400
+
+By convention Linux tools return non-zero value on error/failure.
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ include/functions.sh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/functions.sh b/include/functions.sh
+index 518f555bbe3d..0b054776b763 100644
+--- a/include/functions.sh
++++ b/include/functions.sh
+@@ -54,6 +54,7 @@ test_status_show() {
+     echo " "
+     if [ "$test_script_status" = "fail" ]; then
+         echo "$TEST_NAME: fail"
++        exit 1
+     elif [ "$test_script_status" = "skip" ]; then
+         echo "$TEST_NAME: skip"
+     else
+-- 
+2.4.4
+
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch
new file mode 100644
index 0000000..5252e3b
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa/0002-cpuidle-Avoid-relative-paths.patch
@@ -0,0 +1,56 @@
+From: Carlos Hernandez <ceh@ti.com>
+Subject: [meta-arago][linaro pm-qa PATCH 2/2] cpuidle: Avoid relative paths
+Date: Thu, 13 Aug 2015 15:03:01 -0400
+
+Instead of assuming location of files in the filesystem by using
+relative paths, call binary and let $PATH find binary location.
+
+Signed-off-by: Carlos Hernandez <ceh@ti.com>
+---
+ cpuidle/cpuidle_02.sh | 2 +-
+ cpuidle/cpuidle_03.sh | 2 +-
+ include/functions.sh  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cpuidle/cpuidle_02.sh b/cpuidle/cpuidle_02.sh
+index 4242e241926e..111fa67ff110 100755
+--- a/cpuidle/cpuidle_02.sh
++++ b/cpuidle/cpuidle_02.sh
+@@ -27,7 +27,7 @@
+ 
+ . ../include/functions.sh
+ 
+-CPUIDLE_KILLER=./cpuidle_killer
++CPUIDLE_KILLER=cpuidle_killer
+ 
+ check "cpuidle program runs successfully (120 secs)" "$CPUIDLE_KILLER"
+ test_status_show
+diff --git a/cpuidle/cpuidle_03.sh b/cpuidle/cpuidle_03.sh
+index d82e5e348c90..f79cf894eade 100755
+--- a/cpuidle/cpuidle_03.sh
++++ b/cpuidle/cpuidle_03.sh
+@@ -27,7 +27,7 @@
+ 
+ . ../include/functions.sh
+ 
+-CPUIDLE_KILLER=./cpuidle_killer
++CPUIDLE_KILLER=cpuidle_killer
+ 
+ is_root
+ if [ $? -ne 0 ]; then
+diff --git a/include/functions.sh b/include/functions.sh
+index 0b054776b763..62747481fe5c 100644
+--- a/include/functions.sh
++++ b/include/functions.sh
+@@ -23,7 +23,7 @@
+ #       - initial API and implementation
+ #
+ 
+-. ../Switches/Switches.sh
++#. ../Switches/Switches.sh
+ 
+ CPU_PATH="/sys/devices/system/cpu"
+ TEST_NAME=$(basename ${0%.sh})
+-- 
+2.4.4
+
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
new file mode 100644
index 0000000..c2d6b49
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+# Bump to 0.5.0+
+SRCREV = "e66966ef6a08cd3b491ee1df5c6c5d33baaf1f1c"
+
+SRC_URI += " \
+	file://0001-Return-non-zero-value-on-test-failure.patch \
+	file://0002-cpuidle-Avoid-relative-paths.patch"
+
+PR_append = "-arago0"
-- 
2.2.0


