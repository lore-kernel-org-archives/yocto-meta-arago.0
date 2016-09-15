Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5EB9C52AB0
	for <meta-arago@arago-project.org>;
	Thu, 15 Sep 2016 18:35:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8FIZot2004061
	for <meta-arago@arago-project.org>; Thu, 15 Sep 2016 13:35:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8FIZnlh022373
	for <meta-arago@arago-project.org>; Thu, 15 Sep 2016 13:35:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 13:35:48 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u8FIZm2j021260;	Thu, 15 Sep 2016 13:35:49 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Sep 2016 14:35:07 -0400
Message-ID: <1473964509-21429-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] ti-llvm3.6: bump SRCREV for updates
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
X-List-Received-Date: Thu, 15 Sep 2016 18:35:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 76e5754..e1db5ec 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LLVM 3.6 with support for TI C66x intrinsics"
 HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
 
-PR = "r4"
+PR = "r5"
 
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
@@ -27,14 +27,14 @@ LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
 LLVM_GIT_PROTOCOL = "git"
 LLVM_GIT_BRANCH = "release_36_ti"
 LLVM_GIT_DESTSUFFIX = "git"
-LLVM_GIT_SRCREV = "0076d468809dd17d72fa8cb45cb17e91c2ae525f"
+LLVM_GIT_SRCREV = "798386e2513c812ab4b01df5b57c88b225e756bb"
 
 CLANG_GIT_NAME = "clang"
 CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
 CLANG_GIT_PROTOCOL = "git"
 CLANG_GIT_BRANCH = "release_36_ti"
 CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
-CLANG_GIT_SRCREV = "588b1961bfa2c1722db13fd4b68a2477d1cf0e5d"
+CLANG_GIT_SRCREV = "5d6b4dfcaf29619cffbb2013a1e0a02e70e0154e"
 
 SRC_URI = " \
   ${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME} \
-- 
2.7.4


