Return-Path: <yuanzhao@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 467985299F
	for <meta-arago@arago-project.org>;
	Mon, 14 Jan 2019 22:43:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0EMgnUr065644
	for <meta-arago@arago-project.org>; Mon, 14 Jan 2019 16:42:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1547505769;
	bh=6NKx06NE+vqcSUw1L/MgC3sxOUmIiwQEMVKx3Wd75rk=;
	h=From:To:CC:Subject:Date;
	b=rtjEsqcoVjBUwWS8jAYlQkTolFDwFFty/Ur2UfFltB2+RgRX6OYh/IUYVZmNoqM9b
	AGdMoF2euwbPRipq3Ngbvu5gpuTfoOfmnDzQPD+31I7TGgtLlaII/R3z4YnOy0dMYo
	dcOehU5ySPGcVPZoIP+5Z9ShBPf2JGja088HHTUc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0EMgnAA075276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 14 Jan 2019 16:42:49 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 14 Jan 2019 16:42:48 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 14 Jan 2019 16:42:48 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0EMgm3T000416;
	Mon, 14 Jan 2019 16:42:48 -0600
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Jan 2019 16:42:28 -0600
Message-ID: <20190114224228.125418-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-llvm3.6: update srcrev, fix for gcc8
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
X-List-Received-Date: Mon, 14 Jan 2019 22:43:02 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 ...ueMap.h-unique_ptr-conversion-to-bool-ope.patch | 29 ----------------------
 .../recipes-core/llvm/ti-llvm3.6_3.6.bb            |  9 +++----
 2 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch
deleted file mode 100644
index b5d3d468..00000000
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6/0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b5e503109f95f25828d0398be66474502239489d Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 16 Oct 2018 16:13:52 -0400
-Subject: [PATCH] llvm/IR/ValueMap.h: unique_ptr conversion to bool operator is
- declared explicit
-
-Fixes build with gcc8.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- include/llvm/IR/ValueMap.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/llvm/IR/ValueMap.h b/include/llvm/IR/ValueMap.h
-index f2ea405..f9a1a62 100644
---- a/include/llvm/IR/ValueMap.h
-+++ b/include/llvm/IR/ValueMap.h
-@@ -101,7 +101,7 @@ public:
- 
-   ~ValueMap() {}
- 
--  bool hasMD() const { return MDMap; }
-+  bool hasMD() const { return static_cast<bool>(MDMap); }
-   MDMapT &MD() {
-     if (!MDMap)
-       MDMap.reset(new MDMapT);
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 7d1e3175..16a3269b 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LLVM 3.6 with support for TI C66x intrinsics"
-HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
+HOMEPAGE = "https://git.ti.com/opencl/llvm"
 
-PR = "r6"
+PR = "r7"
 
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
@@ -27,20 +27,19 @@ LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
 LLVM_GIT_PROTOCOL = "git"
 LLVM_GIT_BRANCH = "release_36_ti"
 LLVM_GIT_DESTSUFFIX = "git"
-LLVM_GIT_SRCREV = "8ff2a35c586a3d3f624712e0943777613a017bc5"
+LLVM_GIT_SRCREV = "09780c6750b30da81e4a0a805aedf1699fbc37c7"
 
 CLANG_GIT_NAME = "clang"
 CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
 CLANG_GIT_PROTOCOL = "git"
 CLANG_GIT_BRANCH = "release_36_ti"
 CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
-CLANG_GIT_SRCREV = "1bffed84d31aa9271ef4c91301f833d103e94010"
+CLANG_GIT_SRCREV = "5b006f07bdc22b5ae6917eecdfe243908dd7b029"
 
 SRC_URI = " \
   ${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME} \
   ${CLANG_GIT_URI};protocol=${CLANG_GIT_PROTOCOL};branch=${CLANG_GIT_BRANCH};destsuffix=${CLANG_GIT_DESTSUFFIX};name=${CLANG_GIT_NAME} \
   file://0001-configure-Do-not-check-build-executable-extension.patch \
-  file://0001-llvm-IR-ValueMap.h-unique_ptr-conversion-to-bool-ope.patch \
 "
 
 SRCREV_${LLVM_GIT_NAME} = "${LLVM_GIT_SRCREV}"
-- 
2.14.1


