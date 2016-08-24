Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 526CA529C2
	for <meta-arago@arago-project.org>;
	Wed, 24 Aug 2016 17:11:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7OHBRq1030028
	for <meta-arago@arago-project.org>; Wed, 24 Aug 2016 12:11:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7OHBQ98018247
	for <meta-arago@arago-project.org>; Wed, 24 Aug 2016 12:11:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 24 Aug 2016 12:11:26 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7OHBPkk014701;	Wed, 24 Aug 2016 12:11:25 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Aug 2016 13:10:46 -0400
Message-ID: <1472058646-29103-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-llvm3.6: bump SRCREV for additional C66 intrinsics
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
X-List-Received-Date: Wed, 24 Aug 2016 17:11:29 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 037256c..76e5754 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LLVM 3.6 with support for TI C66x intrinsics"
 HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
 
-PR = "r3"
+PR = "r4"
 
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
@@ -27,14 +27,14 @@ LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
 LLVM_GIT_PROTOCOL = "git"
 LLVM_GIT_BRANCH = "release_36_ti"
 LLVM_GIT_DESTSUFFIX = "git"
-LLVM_GIT_SRCREV = "2ff2f1fe65645f9323372e382d0fd9647462abcb"
+LLVM_GIT_SRCREV = "0076d468809dd17d72fa8cb45cb17e91c2ae525f"
 
 CLANG_GIT_NAME = "clang"
 CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
 CLANG_GIT_PROTOCOL = "git"
 CLANG_GIT_BRANCH = "release_36_ti"
 CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
-CLANG_GIT_SRCREV = "7b43bc10396ecdd141cec40acacbc240ac76a84f"
+CLANG_GIT_SRCREV = "588b1961bfa2c1722db13fd4b68a2477d1cf0e5d"
 
 SRC_URI = " \
   ${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME} \
-- 
2.7.4


