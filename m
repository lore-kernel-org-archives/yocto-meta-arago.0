Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5BD2B52970
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 22:28:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LMRoPb121585
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 17:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561156070;
	bh=n6QxgDrXq7bekIKM5zGFa9Fxch1hSqtvF+W1lVgi6Eg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JNbUKidKrRtjxbF7W33wRNm6RNOA+ZjhsgX14bB+iuzvrkAcqJ2f5pvMc4eXUO/iG
	goub+z57cVRWg5b1uZXkk+Xg1utsOO8333n7e/nzZNHW7CLHWSPFBO4x9tumEOyVks
	L7Jr6enA4/RlFY6EOqnjKFl2iRvnzUPaocXEsSWo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LMRo3Q059705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 17:27:50 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 17:27:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 17:27:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LMRomx024670;
	Fri, 21 Jun 2019 17:27:50 -0500
Date: Fri, 21 Jun 2019 18:27:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20190621222750.GQ4849@beryl>
References: <20190620063815.18898-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190620063815.18898-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH v2 1/3] glow: Add pytorch neural network compiler and dependencies
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
X-List-Received-Date: Fri, 21 Jun 2019 22:28:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 20, 2019 at 02:38:13AM -0400, Djordje Senicic wrote:
> - LLVM8 is added for GLOW compilation only (native package)

So, we are adding another toolchain and a major dependency to the build. 
Moreover, OE-Core already provides LLVM 6 and we also have LLVM 3.6 for 
OpenCL, so there will be 3 different versions w/o re-use. I don't feel too 
good about this approach. I.e. we already have whole bunch of GCC bare metal 
toolchains because different components require different versions. We need 
to start unifying, otherwise it is not scalable!

Denys


> - glog and libunwind packages are also only used as native packages
> 
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  ...endencies-to-intermediate-executable.patch | 99 +++++++++++++++++++
>  .../recipes-devtools/glow/glow_git.bb         | 63 ++++++++++++
>  .../recipes-devtools/glow/llvm-glow_git.bb    | 24 +++++
>  .../recipes-support/glog/glog_0.3.5.bbappend  |  3 +
>  .../libunwind/libunwind_1.2.1.bbappend        |  3 +
>  5 files changed, 192 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/glow/files/0001-Fix-path-and-dependencies-to-intermediate-executable.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/glow/glow_git.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/glow/llvm-glow_git.bb
>  create mode 100644 meta-arago-extras/recipes-support/glog/glog_0.3.5.bbappend
>  create mode 100644 meta-arago-extras/recipes-support/libunwind/libunwind_1.2.1.bbappend
> 
> diff --git a/meta-arago-extras/recipes-devtools/glow/files/0001-Fix-path-and-dependencies-to-intermediate-executable.patch b/meta-arago-extras/recipes-devtools/glow/files/0001-Fix-path-and-dependencies-to-intermediate-executable.patch
> new file mode 100644
> index 00000000..cdac2b63
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/glow/files/0001-Fix-path-and-dependencies-to-intermediate-executable.patch
> @@ -0,0 +1,99 @@
> +From 724ed36a3efc9d48baada931feef58d831bddd3e Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <x0157990@ti.com>
> +Date: Wed, 29 May 2019 03:51:13 -0400
> +Subject: [PATCH] Fix path and dependencies to intermediate executables
> +
> +Signed-off-by: Djordje Senicic <x0157990@ti.com>
> +---
> + lib/Backends/CPU/CMakeLists.txt    |  3 ++-
> + lib/Backends/OpenCL/CMakeLists.txt | 12 ++++++------
> + lib/Graph/CMakeLists.txt           |  4 ++--
> + lib/IR/CMakeLists.txt              |  4 ++--
> + 4 files changed, 12 insertions(+), 11 deletions(-)
> +
> +diff --git a/lib/Backends/CPU/CMakeLists.txt b/lib/Backends/CPU/CMakeLists.txt
> +index 1e734539..5b79ee7d 100644
> +--- a/lib/Backends/CPU/CMakeLists.txt
> ++++ b/lib/Backends/CPU/CMakeLists.txt
> +@@ -53,8 +53,9 @@ add_custom_command(
> + file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/glow/CPU)
> + add_custom_command(
> +     OUTPUT ${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc
> +-    COMMAND include-bin "${CMAKE_BINARY_DIR}/CPU/libjit.bc" "${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc"
> ++    COMMAND ${GLOW_BINARY_DIR}/bin/include-bin "${CMAKE_BINARY_DIR}/CPU/libjit.bc" "${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc"
> +     DEPENDS ${GLOW_BINARY_DIR}/CPU/libjit.bc
> ++    DEPENDS ${GLOW_BINARY_DIR}/bin/include-bin
> +     WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
> + 
> + add_custom_target(CPURuntime
> +diff --git a/lib/Backends/OpenCL/CMakeLists.txt b/lib/Backends/OpenCL/CMakeLists.txt
> +index fd9f965c..e37b4b35 100644
> +--- a/lib/Backends/OpenCL/CMakeLists.txt
> ++++ b/lib/Backends/OpenCL/CMakeLists.txt
> +@@ -8,25 +8,25 @@ add_custom_target(make_opencl_dir
> + 
> + add_custom_command(
> +   OUTPUT "${OpenCL_DIR}/kernels.cl.inc"
> +-  COMMAND include-bin
> ++  COMMAND ${GLOW_BINARY_DIR}/bin/include-bin
> +           "${CMAKE_CURRENT_SOURCE_DIR}/kernels.cl"
> +           "${OpenCL_DIR}/kernels.cl.inc"
> +-  DEPENDS make_opencl_dir include-bin "${CMAKE_CURRENT_SOURCE_DIR}/kernels.cl")
> ++  DEPENDS make_opencl_dir ${GLOW_BINARY_DIR}/bin/include-bin "${CMAKE_CURRENT_SOURCE_DIR}/kernels.cl")
> + 
> + add_custom_command(
> +   OUTPUT "${OpenCL_DIR}/kernels_fwd_conv.cl.inc"
> +-  COMMAND include-bin
> ++  COMMAND ${GLOW_BINARY_DIR}/bin/include-bin
> +           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_conv.cl"
> +           "${OpenCL_DIR}/kernels_fwd_conv.cl.inc"
> +-  DEPENDS make_opencl_dir include-bin
> ++  DEPENDS make_opencl_dir ${GLOW_BINARY_DIR}/bin/include-bin
> +           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_conv.cl")
> + 
> + add_custom_command(
> +   OUTPUT "${OpenCL_DIR}/kernels_fwd_quantized_conv.cl.inc"
> +-  COMMAND include-bin
> ++  COMMAND ${GLOW_BINARY_DIR}/bin/include-bin
> +           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_quantized_conv.cl"
> +           "${OpenCL_DIR}/kernels_fwd_quantized_conv.cl.inc"
> +-  DEPENDS make_opencl_dir include-bin
> ++  DEPENDS make_opencl_dir ${GLOW_BINARY_DIR}/bin/include-bin
> +           "${CMAKE_CURRENT_SOURCE_DIR}/kernels_fwd_quantized_conv.cl")
> + 
> + add_library(OpenCLBackend
> +diff --git a/lib/Graph/CMakeLists.txt b/lib/Graph/CMakeLists.txt
> +index 84589761..02a92636 100644
> +--- a/lib/Graph/CMakeLists.txt
> ++++ b/lib/Graph/CMakeLists.txt
> +@@ -7,8 +7,8 @@ add_custom_command(OUTPUT
> +                    "${NODES_HDR}"
> +                    "${NODES_SRC}"
> +                    "${NODES_DEF}"
> +-                   COMMAND NodeGen ${NODES_HDR} ${NODES_SRC} ${NODES_DEF}
> +-                   DEPENDS NodeGen
> ++                   COMMAND ${GLOW_BINARY_DIR}/bin/NodeGen ${NODES_HDR} ${NODES_SRC} ${NODES_DEF}
> ++                   DEPENDS ${GLOW_BINARY_DIR}/bin/NodeGen
> +                    COMMENT "NodeGen: Generating nodes." VERBATIM)
> + add_custom_target(AutoGenNode
> +                    DEPENDS
> +diff --git a/lib/IR/CMakeLists.txt b/lib/IR/CMakeLists.txt
> +index 7660308d..fb5302ce 100644
> +--- a/lib/IR/CMakeLists.txt
> ++++ b/lib/IR/CMakeLists.txt
> +@@ -13,10 +13,10 @@ add_custom_command(OUTPUT
> +                     "${INSTR_BLD_HDR}"
> +                     "${INSTR_BLD_SRC}"
> +                     "${INSTR_IR_GEN}"
> +-                    COMMAND InstrGen
> ++                    COMMAND ${GLOW_BINARY_DIR}/bin/InstrGen
> +                       "${INSTR_HDR}" "${INSTR_SRC}" "${INSTR_DEF}"
> +                       "${INSTR_BLD_HDR}" "${INSTR_BLD_SRC}" "${INSTR_IR_GEN}"
> +-                    DEPENDS InstrGen
> ++                    DEPENDS ${GLOW_BINARY_DIR}/bin/InstrGen
> +                     COMMENT "InstrGen: Generating instructions." VERBATIM)
> + add_custom_target(AutoGenInstr
> +                    DEPENDS
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-devtools/glow/glow_git.bb b/meta-arago-extras/recipes-devtools/glow/glow_git.bb
> new file mode 100644
> index 00000000..3aea4b14
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/glow/glow_git.bb
> @@ -0,0 +1,63 @@
> +DESCRIPTION = "Pytorch neural network compiler" 
> +HOMEPAGE = "https://github.com/pytorch/glow"
> +
> +SECTION = "devel" 
> +LICENSE = "Apache-2.0 & MIT" 
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +PV = "0.1+git${SRCPV}"
> +PR = "r0" 
> +SRCREV_FORMAT = "glow"
> +
> +DEPENDS_class-native    = "zlib zlib-native llvm-glow-native ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
> +DEPENDS_class-nativesdk = "ncurses protobuf libpng glow-native zlib llvm-glow-native ninja-native protobuf-native libpng-native protobuf-c-native gflags-native glog-native"
> +
> +RDEPENDS_${PN}_class-nativesdk = "libpng ncurses glog"
> +
> +SRC_URI = "git://github.com/pytorch/glow.git;protocol=https;destsuffix=git;name=glow \
> +           file://0001-Fix-path-and-dependencies-to-intermediate-executable.patch  \
> +           git://github.com/stp/OutputCheck.git;protocol=https;destsuffix=git/tests/OutputCheck;name=outcheck \
> +           git://github.com/google/benchmark.git;protocol=https;destsuffix=git/tests/googlebenchmark;name=gbench \
> +           git://github.com/google/googletest.git;protocol=https;destsuffix=git/tests/googletest;name=gtest \
> +           git://github.com/houseroad/foxi.git;protocol=https;destsuffix=git/thirdparty/foxi;name=foxi \
> +           git://github.com/Maratyszcza/FP16.git;protocol=https;destsuffix=git/thirdparty/fp16;name=fp16 \
> +           git://github.com/onnx/onnx.git;protocol=https;destsuffix=git/thirdparty/onnx;name=onnx \
> +           git://github.com/google/benchmark.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/benchmark;name=onnxbench \
> +           git://github.com/pybind/pybind11.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/pybind11;name=onnxpybind11 \
> +           git://github.com/wjakob/clang-cindex-python3.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/pybind11/tools/clang;name=onnxclang \
> +          "
> +
> +SRCREV_glow = "ba8061367aea0b472b596448018107ca6e87929e"
> +SRCREV_outcheck = "eab62a5dd5129f6a4ebfbe4bbe41d35611f7c48d"
> +SRCREV_gbench = "090faecb454fbd6e6e17a75ef8146acb037118d4"
> +SRCREV_gtest = "0c799d0436e1b6d867c1738f6ff58166d153cacc"
> +SRCREV_foxi = "b2ec1a8041879b7be98d81387a14cae895f952f4"
> +SRCREV_fp16 = "34d4bf01bbf7376f2baa71b8fa148b18524d45cf"
> +SRCREV_onnx = "50dc186b50ea512d6888aa1f47414150fd782fa0"
> +SRCREV_onnxbench = "e776aa0275e293707b6a0901e0e8d8a8a3679508"
> +SRCREV_onnxpybind11 = "a1041190c8b8ff0cd9e2f0752248ad5e3789ea0c"
> +SRCREV_onnxclang = "6a00cbc4a9b8e68b71caf7f774b3f9c753ae84d5"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake
> +
> +EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-dynamic-linker=/lib64/ld-linux-x86-64.so.2 " "
> +
> +do_compile() {
> +   cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
> +}
> +
> +do_install () {
> +   install -d ${D}${datadir}/glow
> +   install -d ${D}${datadir}/glow/tests/images
> +   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin ${D}${datadir}/glow
> +   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/EmotionSampleImages ${D}${datadir}/glow/tests/images
> +   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet ${D}${datadir}/glow/tests/images
> +   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet_299 ${D}${datadir}/glow/tests/images
> +   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/mnist ${D}${datadir}/glow/tests/images
> +   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/other ${D}${datadir}/glow/tests/images
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +FILES_${PN} = "${datadir}"
> diff --git a/meta-arago-extras/recipes-devtools/glow/llvm-glow_git.bb b/meta-arago-extras/recipes-devtools/glow/llvm-glow_git.bb
> new file mode 100644
> index 00000000..58d392b3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/glow/llvm-glow_git.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "LLVM release suggested for pytorch glow neural network compiler"
> +HOMEPAGE = "https://github.com/llvm-mirror/llvm"
> +SECTION = "devel"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
> +PV = "8.0"
> +PR = "r0"
> +
> +DEPENDS = "ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
> +
> +SOLIBVER = "1"
> +
> +SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=release_80;rev=5563a6a769b48912b9c8052124520610966eda28;destsuffix=git/llvm \
> +           git://github.com/llvm-mirror/clang.git;protocol=https;branch=release_80;rev=ccfe04576c13497b9c422ceef0b6efe99077a392;destsuffix=git/clang \
> +           "
> +
> +
> +S = "${WORKDIR}/git/llvm"
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DLLVM_INSTALL_UTILS=ON -DLLVM_ENABLE_PROJECTS=clang"
> +
> +inherit pkgconfig cmake
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arago-extras/recipes-support/glog/glog_0.3.5.bbappend b/meta-arago-extras/recipes-support/glog/glog_0.3.5.bbappend
> new file mode 100644
> index 00000000..5e64501c
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/glog/glog_0.3.5.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = ".arago0"
> +
> +BBCLASSEXTEND += "native nativesdk"
> diff --git a/meta-arago-extras/recipes-support/libunwind/libunwind_1.2.1.bbappend b/meta-arago-extras/recipes-support/libunwind/libunwind_1.2.1.bbappend
> new file mode 100644
> index 00000000..4ad6ebc2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/libunwind/libunwind_1.2.1.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = ".arago0"
> +
> +BBCLASSEXTEND += "native nativesdk" 
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

