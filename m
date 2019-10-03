Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B774E52980
	for <meta-arago@arago-project.org>;
	Thu,  3 Oct 2019 16:47:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93GkYcK018966
	for <meta-arago@arago-project.org>; Thu, 3 Oct 2019 11:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570121194;
	bh=6C1lp+mHrJumo5Qj0xC1afHt3LrZR9Y7zGUqlF/xi8Y=;
	h=From:To:CC:Subject:Date;
	b=oKHuG4m7Ic9i5liPYhUSkS0CEXRn+S2QnSgiltGNbdgh+YM9QnTwyCJfKDE7NtYVN
	HTDbYVcUgSkRogjf14GnvQMOgxHL1TnGYpehHKbhmxrVJ3a8vLT6rz+CJvqgof7bJt
	4r07RZoC7jlYi1CgqJBLeQ+sOu0cifLrBPGoLARg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93GkY72111225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 3 Oct 2019 11:46:34 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 3 Oct 2019 11:46:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 3 Oct 2019 11:46:34 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93GkXcY126557;
	Thu, 3 Oct 2019 11:46:34 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 3 Oct 2019 12:45:52 -0400
Message-ID: <20191003164555.3338-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCHv4 1/4] clang8: llvm and clang used only for compilation of native tools for glow compiler
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
X-List-Received-Date: Thu, 03 Oct 2019 16:47:47 -0000
Content-Type: text/plain

- Both clang and llvm from branch 8.0 are used only for pytoch glow package.
  This is to compile several native tools (source inside glow project) that are needed for nativesdk
  glow package, and demo-glow (one of these native tools is used to compile a model into armv7 object file).

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-devtools/glow/clang8_git.bb    | 29 ++++++++++++++++++++++++++
 recipes-devtools/glow/llvm-glow_git.bb | 24 ---------------------
 2 files changed, 29 insertions(+), 24 deletions(-)
 create mode 100644 recipes-devtools/glow/clang8_git.bb
 delete mode 100644 recipes-devtools/glow/llvm-glow_git.bb

diff --git a/recipes-devtools/glow/clang8_git.bb b/recipes-devtools/glow/clang8_git.bb
new file mode 100644
index 0000000..4d097a3
--- /dev/null
+++ b/recipes-devtools/glow/clang8_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "CLANG/LLVM compiler used only for native tools of pytorch glow neural network compiler "
+HOMEPAGE = "https://github.com/llvm-mirror/llvm"
+SECTION = "devel"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
+PV = "8.0"
+PR = "r0"
+
+DEPENDS = "python-native ninja protobuf libpng protobuf protobuf-c gflags glog "
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
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DLLVM_INSTALL_UTILS=ON -DLLVM_ENABLE_PROJECTS=clang  -DPYTHON_EXECUTABLE=${STAGING_DIR_NATIVE}/usr/bin/python-native/python "
+
+inherit pkgconfig cmake
+BBCLASSEXTEND = "native "
+
diff --git a/recipes-devtools/glow/llvm-glow_git.bb b/recipes-devtools/glow/llvm-glow_git.bb
deleted file mode 100644
index 58d392b..0000000
--- a/recipes-devtools/glow/llvm-glow_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "LLVM release suggested for pytorch glow neural network compiler"
-HOMEPAGE = "https://github.com/llvm-mirror/llvm"
-SECTION = "devel"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
-PV = "8.0"
-PR = "r0"
-
-DEPENDS = "ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
-
-SOLIBVER = "1"
-
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=release_80;rev=5563a6a769b48912b9c8052124520610966eda28;destsuffix=git/llvm \
-           git://github.com/llvm-mirror/clang.git;protocol=https;branch=release_80;rev=ccfe04576c13497b9c422ceef0b6efe99077a392;destsuffix=git/clang \
-           "
-
-
-S = "${WORKDIR}/git/llvm"
-
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DLLVM_INSTALL_UTILS=ON -DLLVM_ENABLE_PROJECTS=clang"
-
-inherit pkgconfig cmake
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


