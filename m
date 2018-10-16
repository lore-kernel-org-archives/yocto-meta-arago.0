Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 31C4D52092
	for <meta-arago@arago-project.org>;
	Tue, 16 Oct 2018 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0AEE20D24;
	Tue, 16 Oct 2018 20:39:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KIISK7edgK4N; Tue, 16 Oct 2018 20:39:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CADDC20D23;
	Tue, 16 Oct 2018 20:39:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3D87E164879;
	Tue, 16 Oct 2018 16:39:24 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 16 Oct 2018 16:39:23 -0400
Message-Id: <1539722363-44469-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-llvm3.6: fix for gcc8
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
X-List-Received-Date: Tue, 16 Oct 2018 20:39:36 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ueMap.h-unique_ptr-conversion-to-bool-ope.patch | 29 ++++++++++++++++++++++
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch
new file mode 100644
index 0000000..b5d3d46
--- /dev/null
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch
@@ -0,0 +1,29 @@
+From b5e503109f95f25828d0398be66474502239489d Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 16 Oct 2018 16:13:52 -0400
+Subject: [PATCH] llvm/IR/ValueMap.h: unique_ptr conversion to bool operator is
+ declared explicit
+
+Fixes build with gcc8.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ include/llvm/IR/ValueMap.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/llvm/IR/ValueMap.h b/include/llvm/IR/ValueMap.h
+index f2ea405..f9a1a62 100644
+--- a/include/llvm/IR/ValueMap.h
++++ b/include/llvm/IR/ValueMap.h
+@@ -101,7 +101,7 @@ public:
+ 
+   ~ValueMap() {}
+ 
+-  bool hasMD() const { return MDMap; }
++  bool hasMD() const { return static_cast<bool>(MDMap); }
+   MDMapT &MD() {
+     if (!MDMap)
+       MDMap.reset(new MDMapT);
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 91d3cea..7d1e317 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
   ${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME} \
   ${CLANG_GIT_URI};protocol=${CLANG_GIT_PROTOCOL};branch=${CLANG_GIT_BRANCH};destsuffix=${CLANG_GIT_DESTSUFFIX};name=${CLANG_GIT_NAME} \
   file://0001-configure-Do-not-check-build-executable-extension.patch \
+  file://0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch \
 "
 
 SRCREV_${LLVM_GIT_NAME} = "${LLVM_GIT_SRCREV}"
-- 
2.7.4


