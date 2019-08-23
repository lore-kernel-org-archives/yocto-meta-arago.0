Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0F9E8529FD
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 14:00:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NDwxck077113
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566568739;
	bh=kB9y9F2S4u0XNHNF21BL4G0rSJR1/Gv1f8EpmaQJb00=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LCnC68kuhgyufov/qZUb6qJTYrD6fSCQUJNiEl8ru8nEDUww6fl0IgB6Hia7TtDjp
	yvV0bu0eC0RiLrcJtHSkQNf0qS/y+x9whyhx9i3BA7hBsazMY1jXSyZ2kNinQnMQ4t
	YQvsdf8zp+tHwcwgVt0+I0eW+yk2+O2P0/XSLZ7A=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NDwxv9097965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 08:58:59 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 08:58:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 23 Aug 2019 08:58:59 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NDwwUY118791;
	Fri, 23 Aug 2019 08:58:59 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Aug 2019 09:58:53 -0400
Message-ID: <20190823135856.8053-3-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823135856.8053-1-x0157990@ti.com>
References: <20190823135856.8053-1-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCHv2 2/5] clang8-native: llvm and clang used only for compilation of native tools for glow compiler
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
X-List-Received-Date: Fri, 23 Aug 2019 14:00:01 -0000
Content-Type: text/plain

- Both clang and llvm from branch 8.0 are used only for pytoch glow package.
  This is to compile several native tools (source inside glow project) that are needed for nativesdk
  glow package, and demo-glow (one of these native tools is used to compile a model into armv7 object file).

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-devtools/glow/clang8-native_git.bb    | 28 +++++++++++++++++++
 ...ryInfo-Undefine-libc-functions-if-th.patch |  0
 ...-llvm-allow-env-override-of-exe-path.patch |  0
 .../glow/{llvm-glow_git.bb => llvm8_git.bb}   |  0
 4 files changed, 28 insertions(+)
 create mode 100644 recipes-devtools/glow/clang8-native_git.bb
 rename recipes-devtools/glow/{llvm-glow => llvm8}/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch (100%)
 rename recipes-devtools/glow/{llvm-glow => llvm8}/0007-llvm-allow-env-override-of-exe-path.patch (100%)
 rename recipes-devtools/glow/{llvm-glow_git.bb => llvm8_git.bb} (100%)

diff --git a/recipes-devtools/glow/clang8-native_git.bb b/recipes-devtools/glow/clang8-native_git.bb
new file mode 100644
index 0000000..fadf35c
--- /dev/null
+++ b/recipes-devtools/glow/clang8-native_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "CLANG/LLVM compiler used only for native tools of pytorch glow neural network compiler "
+HOMEPAGE = "https://github.com/llvm-mirror/llvm"
+SECTION = "devel"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
+PV = "8.0"
+PR = "r0"
+
+DEPENDS = "ninja protobuf libpng protobuf protobuf-c gflags glog "
+
+SOLIBVER = "1"
+
+BRANCH="release_80"
+
+SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=${BRANCH};destsuffix=git/llvm;name=llvm \
+           git://github.com/llvm-mirror/clang.git;protocol=https;branch=${BRANCH};destsuffix=git/clang;name=clang \
+           "
+
+SRCREV_llvm  = "5563a6a769b48912b9c8052124520610966eda28"
+SRCREV_clang = "ccfe04576c13497b9c422ceef0b6efe99077a392"
+
+
+S = "${WORKDIR}/git/llvm"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DLLVM_INSTALL_UTILS=ON -DLLVM_ENABLE_PROJECTS=clang"
+
+inherit native pkgconfig cmake
+
diff --git a/recipes-devtools/glow/llvm-glow/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/recipes-devtools/glow/llvm8/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
similarity index 100%
rename from recipes-devtools/glow/llvm-glow/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
rename to recipes-devtools/glow/llvm8/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
diff --git a/recipes-devtools/glow/llvm-glow/0007-llvm-allow-env-override-of-exe-path.patch b/recipes-devtools/glow/llvm8/0007-llvm-allow-env-override-of-exe-path.patch
similarity index 100%
rename from recipes-devtools/glow/llvm-glow/0007-llvm-allow-env-override-of-exe-path.patch
rename to recipes-devtools/glow/llvm8/0007-llvm-allow-env-override-of-exe-path.patch
diff --git a/recipes-devtools/glow/llvm-glow_git.bb b/recipes-devtools/glow/llvm8_git.bb
similarity index 100%
rename from recipes-devtools/glow/llvm-glow_git.bb
rename to recipes-devtools/glow/llvm8_git.bb
-- 
2.17.1


