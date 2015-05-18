Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 904FA52987
	for <meta-arago@arago-project.org>;
	Mon, 18 May 2015 17:27:25 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NOK00BX03592X00@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 18 May 2015 12:27:20 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=JbALdvP9 c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=gKTMcvvTzjsZA_D8IREA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0F5FE20143;	Mon,
	18 May 2015 13:27:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 18 May 2015 13:27:08 -0400
Message-id: <1431970028-25239-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1431970028-25239-1-git-send-email-denis@denix.org>
References: <1431970028-25239-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] packagegroup-arago-cross-canadian: sync up with oe-core
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
X-List-Received-Date: Mon, 18 May 2015 17:27:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb  |  2 +-
 .../packagegroups/packagegroup-arago-cross-canadian.bb       | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 9359e92..5e88c86 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,5 +1,5 @@
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-sdk-host"
-TOOLCHAIN_HOST_TASK += "packagegroup-arago-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK += "packagegroup-arago-cross-canadian-${MACHINE}"
 TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-standalone-sdk-target"
 TOOLCHAIN_SUFFIX ?= "-sdk"
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}${TOOLCHAIN_SUFFIX}"
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
index b7989f9..e68e2a8 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Host Arago SDK package for cross canadian toolchain"
-PN = "packagegroup-arago-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PR = "r5"
+PN = "packagegroup-arago-cross-canadian-${MACHINE}"
+PR = "r6"
 LICENSE = "MIT"
 
 # Save TRANSLATED_TARGET_ARCH before allarch tramples it
@@ -11,9 +11,9 @@ inherit cross-canadian packagegroup
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RDEPENDS_${PN} = "\
-    binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
+    binutils-cross-canadian-${@' binutils-cross-canadian-'.join(all_multilib_tune_values(d,'TRANSLATED_TARGET_ARCH').split())} \
+    gdb-cross-canadian-${@' gdb-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())} \
+    gcc-cross-canadian-${@' gcc-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())} \
     "
 
-#    meta-environment-${TRANSLATED_TARGET_ARCH}
+#    meta-environment-${MACHINE}
-- 
2.2.0


