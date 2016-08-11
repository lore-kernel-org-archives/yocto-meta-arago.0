Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 0A298529AA
	for <meta-arago@arago-project.org>;
	Thu, 11 Aug 2016 23:09:25 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBR0000MPNOGZ60@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 11 Aug 2016 18:09:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=ZjrMvQNILFuM7USNcIUA:9
Received: by 100.15.86.14 with SMTP id 11c26434; Thu, 11 Aug 2016 23:09:24 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 852321620C3;	Thu, 11 Aug 2016 19:09:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 11 Aug 2016 19:09:22 -0400
Message-id: <1470956962-1146-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup-arago-test*: move omapdrmtest from main test group to addons
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
X-List-Received-Date: Thu, 11 Aug 2016 23:09:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since main test group will be included in initramfs, omapdrmtest is not
essesntial and it pulls in SGX/GLES and Wayland dependencies.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb    | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-test.bb           | 3 +--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
index 5d5ee6e..c4f50ea 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test-addons.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional utilities/demos for test image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,6 +18,10 @@ TEST_ADDONS_TI = " \
     cmem-test \
     "
 
+TEST_ADDONS_TI_append_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
+    "
+
 TEST_ADDONS_TI_append_keystone = " \
     mpm-transport-test \
     multiprocmgr-test \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 8ff0399..d01ba36 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r43"
+PR = "r44"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -50,7 +50,6 @@ ARAGO_TI_TEST_append_ti43x = " \
 
 ARAGO_TI_TEST_append_omap-a15 = " \
     omapconf \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
     ti-ipc-test \
     "
 
-- 
2.7.4


