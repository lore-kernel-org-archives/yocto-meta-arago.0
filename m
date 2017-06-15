Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8F71E529AA
	for <meta-arago@arago-project.org>;
	Thu, 15 Jun 2017 16:01:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5FG1wj9015223
	for <meta-arago@arago-project.org>; Thu, 15 Jun 2017 11:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497542518;
	bh=fZSRTuKRtiK2YGJB+x/CC36RWLk6xUR9XMCWRfXDF00=;
	h=From:To:CC:Subject:Date;
	b=mDupXe1So4ekBD0hWDhgQdIjv35KF+MXnk1Xd+bpWDDREekuVXEGv7UzqjqURZMcg
	7MRrBL9S5cLTrg6PmDD9Sr3VdPa0LqYpOXyRkGJRRuprQ8PTK4VyMk2fbG0nNaaXZZ
	KqcHPit2JvMyvJ8LtONq7UY8J2JO5G2IxHsVaNUw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5FG1w9H030482
	for <meta-arago@arago-project.org>; Thu, 15 Jun 2017 11:01:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 11:01:58 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5FG1w6B020163;	Thu, 15 Jun 2017 11:01:58 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Jun 2017 11:56:25 -0400
Message-ID: <1497542187-1311-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] ti-llvm3.6: bump SRCREV for new c6x intrinsics
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
X-List-Received-Date: Thu, 15 Jun 2017 16:01:59 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index a279e8d..4f36310 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "LLVM 3.6 with support for TI C66x intrinsics"
 HOMEPAGE = "https://gitorious.design.ti.com/ocl/llvm33-src"
 
-PR = "r5"
+PR = "r6"
 
 do_configure_prepend_class-native() {
     # Fix paths in llvm-config
@@ -27,14 +27,14 @@ LLVM_GIT_URI = "git://git.ti.com/opencl/llvm.git"
 LLVM_GIT_PROTOCOL = "git"
 LLVM_GIT_BRANCH = "release_36_ti"
 LLVM_GIT_DESTSUFFIX = "git"
-LLVM_GIT_SRCREV = "798386e2513c812ab4b01df5b57c88b225e756bb"
+LLVM_GIT_SRCREV = "8ff2a35c586a3d3f624712e0943777613a017bc5"
 
 CLANG_GIT_NAME = "clang"
 CLANG_GIT_URI = "git://git.ti.com/opencl/clang.git"
 CLANG_GIT_PROTOCOL = "git"
 CLANG_GIT_BRANCH = "release_36_ti"
 CLANG_GIT_DESTSUFFIX = "${LLVM_GIT_DESTSUFFIX}/tools/clang"
-CLANG_GIT_SRCREV = "5d6b4dfcaf29619cffbb2013a1e0a02e70e0154e"
+CLANG_GIT_SRCREV = "1bffed84d31aa9271ef4c91301f833d103e94010"
 
 SRC_URI = " \
   ${LLVM_GIT_URI};protocol=${LLVM_GIT_PROTOCOL};branch=${LLVM_GIT_BRANCH};destsuffix=${LLVM_GIT_DESTSUFFIX};name=${LLVM_GIT_NAME} \
-- 
2.7.4


