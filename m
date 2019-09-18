Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DACCD520DF
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 19:41:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IJdrTQ026164
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 14:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568835593;
	bh=exkjLS5IMt4rw+JVDWNvHuG27ZJdVUGWrn9KO66OHAE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=LGpcYeJYyfIcCPsIINf1JfoUAn/2Cj6aRINP+67kBAnzBUPKuvCCy7tOLw/tuvJ6A
	6f3PUJLyDUdTsqnZFoc6it+1kaMURVP+pVhxwFViylBpKbZMMq2gfNSldmDfiF0RWr
	45EG1fs+idj2ouVQXB7Bvs8hF4qP1e33SYcy119U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IJdr2O090438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 14:39:53 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 14:39:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 14:39:52 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IJdq4m060288;
	Wed, 18 Sep 2019 14:39:52 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190823135856.8053-1-x0157990@ti.com>
	<20190823135856.8053-4-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2778dd52-8cf7-3713-c077-a90c5e2f5c4e@ti.com>
Date: Wed, 18 Sep 2019 15:39:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135856.8053-4-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCHv2 3/5] glow: Address devkit related RPATH issue to point to devkit shared libraries instead of host native
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
X-List-Received-Date: Wed, 18 Sep 2019 19:41:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I get an error when configuring glow-native.


Log data follows:
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 5.3.1 | -- The CXX compiler 
identification is GNU 5.3.1
| -- Check for working C compiler: 
/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/hosttools/gcc
| -- Check for working C compiler: 
/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/hosttools/gcc -- 
broken
| CMake Error at 
/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/work/x86_64-linux/glow-native/0.1+gitAUTOINC+ba8061367a-r0/recipe-sysroot-native/usr/share/cmake-3.12/Modules/CMakeTestCCompiler.cmake:52 
(message):
|   The C compiler
|
| "/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/hosttools/gcc"
|
|   is not able to compile a simple test program.
|
|   It fails with the following output:
|
|     Change Dir: 
/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/work/x86_64-linux/glow-native/0.1+gitAUTOINC+ba8061367a-r0/build/CMakeFiles/CMakeTmp
|
|     Run Build 
Command:"/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/work/x86_64-linux/glow-native/0.1+gitAUTOINC+ba8061367a-r0/recipe-sysroot-native/usr/bin/ninja" 
"cmTC_cc2e4"
|     [1/2] Building C object CMakeFiles/cmTC_cc2e4.dir/testCCompiler.c.o
|     [2/2] Linking C executable cmTC_cc2e4
|     FAILED: cmTC_cc2e4
|     : && 
/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/hosttools/gcc 
-isystem/oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/work/x86_64-linux/glow-native/0.1+gitAUTOINC+ba8061367a-r0/recipe-sysroot-native/usr/include 
-O2 -pipe  -Wl,-z,origin -ldl -lz -ltinfo -pthread 
CMakeFiles/cmTC_cc2e4.dir/testCCompiler.c.o  -o cmTC_cc2e4 && :
| /oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/hosttools/ld: 
cannot find -lz
| /oe/bld/build-CORTEX_1/arago-tmp-external-arm-toolchain/hosttools/ld: 
cannot find -ltinfo
|     collect2: error: ld returned 1 exit status
|     ninja: build stopped: subcommand failed.
|
|
|
|
|   CMake will not be able to correctly generate this project.
| Call Stack (most recent call first):
|   CMakeLists.txt:5 (project)
|
|
| -- Configuring incomplete, errors occurred!

On 8/23/2019 9:58 AM, Djordje Senicic wrote:
> - Pytorch Glow is xNN compiler tool and artifacts are required only in devkit.
>    Glow build procedure includes creation of native tools that are used in later
>    phases of build process. These tools (include-bin, InstrGen, NodeGen) are created
>    by native compilation, then used by nativesdk. Image-clasification tool created by native
>    compilation is used by demo-glow to compile network into armv7 object file that is included in
>    target filesystem.
> - RPATH for image-classification tool (created by glow project) is modified
>    to be $ORIGIN based (i.e. relative location)
> - Update dependencies
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   ...p-compilation-of-native-helper-tools.patch | 99 +++++++++++++++++++
>   recipes-devtools/glow/glow_git.bb             | 62 +++++++++---
>   2 files changed, 145 insertions(+), 16 deletions(-)
>   create mode 100644 recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch
>
> diff --git a/recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch b/recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch
> new file mode 100644
> index 0000000..6fd4a4d
> --- /dev/null
> +++ b/recipes-devtools/glow/files/0002-Skip-compilation-of-native-helper-tools.patch
> @@ -0,0 +1,99 @@
> +From 923f66a209c329b2d5ab245e1c02f91fa6705d4c Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <x0157990@ti.com>
> +Date: Thu, 1 Aug 2019 04:58:24 -0400
> +Subject: [PATCH] Skip compilation of native helper tools
> +
> +Upstream-Status: Inappropriate [other]
> +
> +- Applicable for limited use (demo) of AOT image-classifier example only
> +
> +Signed-off-by: Djordje Senicic <x0157990@ti.com>
> +---
> + lib/Backends/CPU/CMakeLists.txt    |  2 +-
> + lib/Backends/OpenCL/CMakeLists.txt | 12 ++++++------
> + lib/Graph/CMakeLists.txt           |  3 +--
> + lib/IR/CMakeLists.txt              |  3 +--
> + 4 files changed, 9 insertions(+), 11 deletions(-)
> +
> +diff --git a/lib/Backends/CPU/CMakeLists.txt b/lib/Backends/CPU/CMakeLists.txt
> +index 1e734539..0d5c5e60 100644
> +--- a/lib/Backends/CPU/CMakeLists.txt
> ++++ b/lib/Backends/CPU/CMakeLists.txt
> +@@ -53,7 +53,7 @@ add_custom_command(
> + file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/glow/CPU)
> + add_custom_command(
> +     OUTPUT ${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc
> +-    COMMAND include-bin "${CMAKE_BINARY_DIR}/CPU/libjit.bc" "${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc"
> ++    COMMAND ${GLOW_BINARY_DIR}/bin/include-bin "${CMAKE_BINARY_DIR}/CPU/libjit.bc" "${CMAKE_BINARY_DIR}/glow/CPU/libjit_bc.inc"
> +     DEPENDS ${GLOW_BINARY_DIR}/CPU/libjit.bc
> +     WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
> +
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
> +index 84589761..f0976259 100644
> +--- a/lib/Graph/CMakeLists.txt
> ++++ b/lib/Graph/CMakeLists.txt
> +@@ -7,8 +7,7 @@ add_custom_command(OUTPUT
> +                    "${NODES_HDR}"
> +                    "${NODES_SRC}"
> +                    "${NODES_DEF}"
> +-                   COMMAND NodeGen ${NODES_HDR} ${NODES_SRC} ${NODES_DEF}
> +-                   DEPENDS NodeGen
> ++                   COMMAND ${GLOW_BINARY_DIR}/bin/NodeGen ${NODES_HDR} ${NODES_SRC} ${NODES_DEF}
> +                    COMMENT "NodeGen: Generating nodes." VERBATIM)
> + add_custom_target(AutoGenNode
> +                    DEPENDS
> +diff --git a/lib/IR/CMakeLists.txt b/lib/IR/CMakeLists.txt
> +index 7660308d..d5861bbb 100644
> +--- a/lib/IR/CMakeLists.txt
> ++++ b/lib/IR/CMakeLists.txt
> +@@ -13,10 +13,9 @@ add_custom_command(OUTPUT
> +                     "${INSTR_BLD_HDR}"
> +                     "${INSTR_BLD_SRC}"
> +                     "${INSTR_IR_GEN}"
> +-                    COMMAND InstrGen
> ++                    COMMAND ${GLOW_BINARY_DIR}/bin/InstrGen
> +                       "${INSTR_HDR}" "${INSTR_SRC}" "${INSTR_DEF}"
> +                       "${INSTR_BLD_HDR}" "${INSTR_BLD_SRC}" "${INSTR_IR_GEN}"
> +-                    DEPENDS InstrGen
> +                     COMMENT "InstrGen: Generating instructions." VERBATIM)
> + add_custom_target(AutoGenInstr
> +                    DEPENDS
> +--
> +2.17.1
> +
> diff --git a/recipes-devtools/glow/glow_git.bb b/recipes-devtools/glow/glow_git.bb
> index 3aea4b1..6ac8044 100644
> --- a/recipes-devtools/glow/glow_git.bb
> +++ b/recipes-devtools/glow/glow_git.bb
> @@ -8,13 +8,12 @@ PV = "0.1+git${SRCPV}"
>   PR = "r0"
>   SRCREV_FORMAT = "glow"
>   
> -DEPENDS_class-native    = "zlib zlib-native llvm-glow-native ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
> -DEPENDS_class-nativesdk = "ncurses protobuf libpng glow-native zlib llvm-glow-native ninja-native protobuf-native libpng-native protobuf-c-native gflags-native glog-native"
> +DEPENDS_class-native    = "clang8 zlib libpng ninja protobuf protobuf-c gflags glog "
> +DEPENDS_class-nativesdk = "ncurses protobuf zlib gflags glog libpng llvm8 glow-native ninja-native "
>   
> -RDEPENDS_${PN}_class-nativesdk = "libpng ncurses glog"
> +RDEPENDS_${PN}_class-nativesdk   = " ncurses protobuf "
>   
>   SRC_URI = "git://github.com/pytorch/glow.git;protocol=https;destsuffix=git;name=glow \
> -           file://0001-Fix-path-and-dependencies-to-intermediate-executable.patch  \
>              git://github.com/stp/OutputCheck.git;protocol=https;destsuffix=git/tests/OutputCheck;name=outcheck \
>              git://github.com/google/benchmark.git;protocol=https;destsuffix=git/tests/googlebenchmark;name=gbench \
>              git://github.com/google/googletest.git;protocol=https;destsuffix=git/tests/googletest;name=gtest \
> @@ -26,6 +25,11 @@ SRC_URI = "git://github.com/pytorch/glow.git;protocol=https;destsuffix=git;name=
>              git://github.com/wjakob/clang-cindex-python3.git;protocol=https;destsuffix=git/thirdparty/onnx/third_party/pybind11/tools/clang;name=onnxclang \
>             "
>   
> +SRC_URI_append_class-native = " file://0001-Fix-path-and-dependencies-to-intermediate-executable.patch \
> +                              "
> +SRC_URI_append_class-nativesdk = "file://0002-Skip-compilation-of-native-helper-tools.patch \
> +                              "
> +
>   SRCREV_glow = "ba8061367aea0b472b596448018107ca6e87929e"
>   SRCREV_outcheck = "eab62a5dd5129f6a4ebfbe4bbe41d35611f7c48d"
>   SRCREV_gbench = "090faecb454fbd6e6e17a75ef8146acb037118d4"
> @@ -41,23 +45,49 @@ S = "${WORKDIR}/git"
>   
>   inherit pkgconfig cmake
>   
> -EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-dynamic-linker=/lib64/ld-linux-x86-64.so.2 " "
> +CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +do_configure_class-native() {
> +   cd ${B}
> +   cmake ${S} -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,origin -ldl -lz -ltinfo -pthread "
> +}
> +
> +do_compile_class-native() {
> +   cd ${B}
> +   ninja include-bin InstrGen NodeGen image-classifier
> +}
> +
> +do_install_class-native() {
> +   install -d ${D}${datadir}/glow/bin
> +   install -d ${D}${datadir}/glow/tests/images
> +   chrpath -d ${WORKDIR}/build/bin/*
> +   cp ${CP_ARGS} ${B}/bin/* ${D}${datadir}/glow/bin/.
> +   cp ${CP_ARGS} ${S}/tests/images/mnist ${D}${datadir}/glow/tests/images
> +}
> +
>   
> -do_compile() {
> -   cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
> +do_configure_class-nativesdk() {
> +   cd ${B}
> +   cmake ${S} -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,origin -ldl -lz -ltinfo -pthread " -DRUN_HAVE_STD_REGEX=0 -DRUN_HAVE_POSIX_REGEX=0
>   }
>   
> -do_install () {
> -   install -d ${D}${datadir}/glow
> +do_compile_class-nativesdk() {
> +   cd ${B}
> +   cp ${CP_ARGS} ${STAGING_DIR_NATIVE}/usr/share/glow/bin/* ${WORKDIR}/build/bin
> +   ninja image-classifier
> +}
> +
> +do_install_class-nativesdk() {
> +   install -d ${D}${datadir}/glow/bin
>      install -d ${D}${datadir}/glow/tests/images
> -   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/bin ${D}${datadir}/glow
> -   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/EmotionSampleImages ${D}${datadir}/glow/tests/images
> -   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet ${D}${datadir}/glow/tests/images
> -   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/imagenet_299 ${D}${datadir}/glow/tests/images
> -   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/mnist ${D}${datadir}/glow/tests/images
> -   cp -Prf --preserve=mode,timestamps  ${WORKDIR}/build/tests/images/other ${D}${datadir}/glow/tests/images
> +   install -m 0755 ${B}/bin/image-classifier ${D}${datadir}/glow/bin/image-classifier
> +   chrpath -r  "\$ORIGIN/../../../lib:\$ORIGIN/../../../../lib" ${D}${datadir}/glow/bin/image-classifier
> +   cp ${CP_ARGS} ${S}/tests/images/imagenet ${D}${datadir}/glow/tests/images
> +   cp ${CP_ARGS} ${S}/tests/images/imagenet_299 ${D}${datadir}/glow/tests/images
> +   cp ${CP_ARGS} ${S}/tests/images/mnist ${D}${datadir}/glow/tests/images
>   }
>   
> +
>   BBCLASSEXTEND = "native nativesdk"
>   
> -FILES_${PN} = "${datadir}"
> +FILES_${PN} = "${datadir}/glow"

