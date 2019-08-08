Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 20D2152999
	for <meta-arago@arago-project.org>;
	Thu,  8 Aug 2019 19:33:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x78JW97j108615
	for <meta-arago@arago-project.org>; Thu, 8 Aug 2019 14:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565292729;
	bh=UTnTFoF9yGdrHgfRGbj7S6qY/YPnmiOeGQupLeDF5sQ=;
	h=From:To:CC:Subject:Date;
	b=UQUFw1sVVVk2bk1lafwdOAFIiL++K7IpOtsZCElQKVSAetFYZr/5FALwG5keWeUWr
	vWWqdvFdrdRVis3dSSIQWDy8MJj/QkMC8AU/Rv9yrCZd5EicyAMkjenvx/8vqZKAmP
	6HAkg1E23p62qj5qxiS0MiMrN3ofhiXlBqbJCrdo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x78JW97B084622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 8 Aug 2019 14:32:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 8 Aug 2019 14:32:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 8 Aug 2019 14:32:08 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x78JW8IJ032505;
	Thu, 8 Aug 2019 14:32:08 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Aug 2019 15:32:05 -0400
Message-ID: <20190808193206.16337-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 1/2] glow: Fix problem with RPATH and change LLVM to stable version 7.1
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
X-List-Received-Date: Thu, 08 Aug 2019 19:33:05 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 ...p-compilation-of-native-helper-tools.patch | 95 +++++++++++++++++++
 recipes-devtools/glow/glow_git.bb             | 48 +++++++---
 recipes-devtools/glow/llvm-glow_git.bb        | 10 +-
 3 files changed, 137 insertions(+), 16 deletions(-)
 create mode 100644 recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch

diff --git a/recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch b/recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch
new file mode 100644
index 0000000..e60c399
--- /dev/null
+++ b/recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch
@@ -0,0 +1,95 @@
+From 923f66a209c329b2d5ab245e1c02f91fa6705d4c Mon Sep 17 00:00:00 2001
+From: Djordje Senicic <x0157990@ti.com>
+Date: Thu, 1 Aug 2019 04:58:24 -0400
+Subject: [PATCH] Skip compilation of native helper tools
+
+Signed-off-by: Djordje Senicic <x0157990@ti.com>
+---
+ lib/Backends/CPU/CMakeLists.txt    |  2 +-
+ lib/Backends/OpenCL/CMakeLists.txt | 12 ++++++------
+ lib/Graph/CMakeLists.txt           |  3 +--
+ lib/IR/CMakeLists.txt              |  3 +--
+ 4 files changed, 9 insertions(+), 11 deletions(-)
+
+diff --git a/lib/Backends/CPU/CMakeLists.txt b/lib/Backends/CPU/CMakeLists.txt
+index 1e734539..0d5c5e60 100644
+--- a/lib/Backends/CPU/CMakeLists.txt
++++ b/lib/Backends/CPU/CMakeLists.txt
+@@ -53,7 +53,7 @@ add_custom_command(
+ file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/glow/CPU)
+ add_custom_command(
+     OUTPUT ${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc
+-    COMMAND include-bin "${CMAKE_BINARY_DIR}/CPU/libjit.bc" "${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc"
++    COMMAND ${GLOW_BINARY_DIR}/bin/include-bin "${CMAKE_BINARY_DIR}/CPU/libjit.bc" "${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc"
+     DEPENDS ${GLOW_BINARY_DIR}/CPU/libjit.bc
+     WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
+ 
+diff --git a/lib/Backends/OpenCL/CMakeLists.txt b/lib/Backends/OpenCL/CMakeLists.txt
+index fd9f965c..e37b4b35 100644
+--- a/lib/Backends/OpenCL/CMakeLists.txt
++++ b/lib/Backends/OpenCL/CMakeLists.txt
+@@ -8,25 +8,25 @@ add_custom_target(make_opencl_dir
+ 
+ add_custom_command(
+   OUTPUT "${OpenCL_DIR}/kernels.cl.inc"
+-  COMMAND include-bin
++  COMMAND ${GLOW_BINARY_DIR}/bin/include-bin
+           "${CMAKE_CURRENT_SOURCE_DIR}/kernels.cl"
+           "${OpenCL_DIR}/kernels.cl.inc"
+-  DEPENDS make_opencl_dir include-bin "${CMAKE_CURRENT_SOURCE_DIR}/kernels.cl")
++  DEPENDS make_opencl_dir ${GLOW_BINARY_DIR}/bin/include-bin "${CMAKE_CURRENT_SOURCE_DIR}/kernels.cl")
+ 
+ add_custom_command(
+   OUTPUT "${OpenCL_DIR}/kernels_fwd_conv.cl.inc"
+-  COMMAND include-bin
++  COMMAND ${GLOW_BINARY_DIR}/bin/include-bin
+           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_conv.cl"
+           "${OpenCL_DIR}/kernels_fwd_conv.cl.inc"
+-  DEPENDS make_opencl_dir include-bin
++  DEPENDS make_opencl_dir ${GLOW_BINARY_DIR}/bin/include-bin
+           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_conv.cl")
+ 
+ add_custom_command(
+   OUTPUT "${OpenCL_DIR}/kernels_fwd_quantized_conv.cl.inc"
+-  COMMAND include-bin
++  COMMAND ${GLOW_BINARY_DIR}/bin/include-bin
+           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_quantized_conv.cl"
+           "${OpenCL_DIR}/kernels_fwd_quantized_conv.cl.inc"
+-  DEPENDS make_opencl_dir include-bin
++  DEPENDS make_opencl_dir ${GLOW_BINARY_DIR}/bin/include-bin
+           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_quantized_conv.cl")
+ 
+ add_library(OpenCLBackend
+diff --git a/lib/Graph/CMakeLists.txt b/lib/Graph/CMakeLists.txt
+index 84589761..f0976259 100644
+--- a/lib/Graph/CMakeLists.txt
++++ b/lib/Graph/CMakeLists.txt
+@@ -7,8 +7,7 @@ add_custom_command(OUTPUT
+                    "${NODES_HDR}"
+                    "${NODES_SRC}"
+                    "${NODES_DEF}"
+-                   COMMAND NodeGen ${NODES_HDR} ${NODES_SRC} ${NODES_DEF}
+-                   DEPENDS NodeGen
++                   COMMAND ${GLOW_BINARY_DIR}/bin/NodeGen ${NODES_HDR} ${NODES_SRC} ${NODES_DEF}
+                    COMMENT "NodeGen: Generating nodes." VERBATIM)
+ add_custom_target(AutoGenNode
+                    DEPENDS
+diff --git a/lib/IR/CMakeLists.txt b/lib/IR/CMakeLists.txt
+index 7660308d..d5861bbb 100644
+--- a/lib/IR/CMakeLists.txt
++++ b/lib/IR/CMakeLists.txt
+@@ -13,10 +13,9 @@ add_custom_command(OUTPUT
+                     "${INSTR_BLD_HDR}"
+                     "${INSTR_BLD_SRC}"
+                     "${INSTR_IR_GEN}"
+-                    COMMAND InstrGen
++                    COMMAND ${GLOW_BINARY_DIR}/bin/InstrGen
+                       "${INSTR_HDR}" "${INSTR_SRC}" "${INSTR_DEF}"
+                       "${INSTR_BLD_HDR}" "${INSTR_BLD_SRC}" "${INSTR_IR_GEN}"
+-                    DEPENDS InstrGen
+                     COMMENT "InstrGen: Generating instructions." VERBATIM)
+ add_custom_target(AutoGenInstr
+                    DEPENDS
+-- 
+2.17.1
+
diff --git a/recipes-devtools/glow/glow_git.bb b/recipes-devtools/glow/glow_git.bb
index 3aea4b1..3024230 100644
--- a/recipes-devtools/glow/glow_git.bb
+++ b/recipes-devtools/glow/glow_git.bb
@@ -8,13 +8,12 @@ PV = "0.1+git${SRCPV}"
 PR = "r0" 
 SRCREV_FORMAT = "glow"
 
-DEPENDS_class-native    = "zlib zlib-native llvm-glow-native ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
-DEPENDS_class-nativesdk = "ncurses protobuf libpng glow-native zlib llvm-glow-native ninja-native protobuf-native libpng-native protobuf-c-native gflags-native glog-native"
+DEPENDS_class-native    = "zlib zlib-native llvm-glow-native ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native patchelf-native "
+DEPENDS_class-nativesdk = "ncurses protobuf zlib protobuf-c gflags glog ninja llvm-glow-native glow-native libpng-native patchelf-native "
 
-RDEPENDS_${PN}_class-nativesdk = "libpng ncurses glog"
+RDEPENDS_${PN}_class-nativesdk = "libpng ncurses glog protobuf "
 
 SRC_URI = "git://github.com/pytorch/glow.git;protocol=https;destsuffix=git;name=glow \
-           file://0001-Fix-path-and-dependencies-to-intermediate-executable.patch  \
            git://github.com/stp/OutputCheck.git;protocol=https;destsuffix=git/tests/OutputCheck;name=outcheck \
            git://github.com/google/benchmark.git;protocol=https;destsuffix=git/tests/googlebenchmark;name=gbench \
            git://github.com/google/googletest.git;protocol=https;destsuffix=git/tests/googletest;name=gtest \
@@ -26,6 +25,11 @@ SRC_URI = "git://github.com/pytorch/glow.git;protocol=https;destsuffix=git;name=
            git://github.com/wjakob/clang-cindex-python3.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/pybind11/tools/clang;name=onnxclang \
           "
 
+SRC_URI_append_class-native = " file://0001-Fix-path-and-dependencies-to-intermediate-executable.patch \
+                              "
+SRC_URI_append_class-nativesdk = "file://0002-Skip-compilation-of-native-helper-tools.patch \
+                              "
+
 SRCREV_glow = "ba8061367aea0b472b596448018107ca6e87929e"
 SRCREV_outcheck = "eab62a5dd5129f6a4ebfbe4bbe41d35611f7c48d"
 SRCREV_gbench = "090faecb454fbd6e6e17a75ef8146acb037118d4"
@@ -41,21 +45,43 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig cmake
 
-EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-dynamic-linker=/lib64/ld-linux-x86-64.so.2 " "
+EXTRA_OECMAKE_class-native += " -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-dynamic-linker=/lib64/ld-linux-x86-64.so.2 " "
+EXTRA_OECMAKE_class-nativesdk += " -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,origin " "
+
+do_compile_class-native() {
+   cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
+}
+
+do_install_class-native() {
+   install -d ${D}${datadir}/glow/bin
+   install -d ${D}${datadir}/glow/tests/images
+   chrpath -d ${WORKDIR}/build/bin/*
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin/include-bin ${D}${datadir}/glow/bin
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin/InstrGen ${D}${datadir}/glow/bin
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin/NodeGen ${D}${datadir}/glow/bin
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin/image-classifier ${D}${datadir}/glow/bin
+   ${STAGING_DIR_NATIVE}/usr/bin/patchelf --set-rpath  "\$ORIGIN/../../../lib:\$ORIGIN/../../../../lib" ${D}${datadir}/glow/bin/image-classifier
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet ${D}${datadir}/glow/tests/images
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet_299 ${D}${datadir}/glow/tests/images
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/mnist ${D}${datadir}/glow/tests/images
+}
 
-do_compile() {
+do_compile_class-nativesdk() {
+   install -d ${WORKDIR}/build/bin
+   cp ${STAGING_DIR_NATIVE}/usr/share/glow/bin/include-bin ${WORKDIR}/build/bin
+   cp ${STAGING_DIR_NATIVE}/usr/share/glow/bin/NodeGen ${WORKDIR}/build/bin
+   cp ${STAGING_DIR_NATIVE}/usr/share/glow/bin/InstrGen ${WORKDIR}/build/bin
    cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
 }
 
-do_install () {
-   install -d ${D}${datadir}/glow
+do_install_class-nativesdk() {
+   install -d ${D}${datadir}/glow/bin
    install -d ${D}${datadir}/glow/tests/images
-   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin ${D}${datadir}/glow
-   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/EmotionSampleImages ${D}${datadir}/glow/tests/images
+   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin/image-classifier ${D}${datadir}/glow/bin
+   ${STAGING_DIR_NATIVE}/usr/bin/patchelf --set-rpath  "\$ORIGIN/../../../lib:\$ORIGIN/../../../../lib" ${D}${datadir}/glow/bin/image-classifier
    cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet ${D}${datadir}/glow/tests/images
    cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet_299 ${D}${datadir}/glow/tests/images
    cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/mnist ${D}${datadir}/glow/tests/images
-   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/other ${D}${datadir}/glow/tests/images
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-devtools/glow/llvm-glow_git.bb b/recipes-devtools/glow/llvm-glow_git.bb
index 58d392b..4c0d29e 100644
--- a/recipes-devtools/glow/llvm-glow_git.bb
+++ b/recipes-devtools/glow/llvm-glow_git.bb
@@ -2,16 +2,16 @@ DESCRIPTION = "LLVM release suggested for pytorch glow neural network compiler"
 HOMEPAGE = "https://github.com/llvm-mirror/llvm"
 SECTION = "devel"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
-PV = "8.0"
-PR = "r0"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c520ed40e11887bb1d24d86f7f5b1f05"
+PV = "7.0"
+PR = "r1"
 
 DEPENDS = "ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
 
 SOLIBVER = "1"
 
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=release_80;rev=5563a6a769b48912b9c8052124520610966eda28;destsuffix=git/llvm \
-           git://github.com/llvm-mirror/clang.git;protocol=https;branch=release_80;rev=ccfe04576c13497b9c422ceef0b6efe99077a392;destsuffix=git/clang \
+SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=release_70;rev=dd3329aeb25d87d4ac6429c0af220f92e1ba5f26;destsuffix=git/llvm \
+           git://github.com/llvm-mirror/clang.git;protocol=https;branch=release_70;rev=4519e2637fcc4bf6e3049a0a80e6a5e7b97667cb;destsuffix=git/clang \
            "
 
 
-- 
2.17.1


