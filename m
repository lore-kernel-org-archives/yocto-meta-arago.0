Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4D0DC52978
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2019 16:16:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7NGFvKC002339
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 11:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566576957;
	bh=tQoUby8jW9UxvCp3uigTuMHo2hFlkb4aXd43cjduFCc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=cPhIwfEQxK7xw+rV3Y3LwHACDZFI3tDhqz2bMEnJWabOlq6zM71PR01sWUTFQHdWO
	7LM06jfUFWMvPar730SYPvmi0Vn7hs9by/QMchLZ7/tOPl07Y/3UIB1kbb31ZkmsAG
	7sfYif9wr3XdEw/wBf2mmahr8hQei6xIg3/+66CM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7NGFvIr048772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2019 11:15:57 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 23 Aug 2019 11:15:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 23 Aug 2019 11:15:56 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7NGFtuM030589;
	Fri, 23 Aug 2019 11:15:56 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190823135856.8053-1-x0157990@ti.com>
	<20190823135856.8053-2-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <edaecc87-906e-1a0d-6a27-846e30dea934@ti.com>
Date: Fri, 23 Aug 2019 12:15:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135856.8053-2-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCHv2 1/5] mesa, llvm, meson: Update llvm to 8.0.1 plus define and use LLVM version globally
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
X-List-Received-Date: Fri, 23 Aug 2019 16:16:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Djordje,

I get an error with this. Have you tried building nativesdk-llvm8?

ERROR: Nothing PROVIDES 'nativesdk-libedit' (but 
virtual:nativesdk:/oe/bld/sources/meta-processor-sdk/recipes-devtools/glow/llvm8_git.bb 
DEPENDS on or otherwise requires it).


And when using "git send-email", you can use the "--no-signed-off-by-cc" 
flag to prevent CCing those that have "signed-off" in the commit message.


- Jake


On 8/23/2019 9:58 AM, Djordje Senicic wrote:
> - Add missing dependency on libedit
> - Define LLVMVERSION on the same lines as GCCVERSION and other tools
> - Use LLVMVERSION in mesa and meson.bbclass to get llvm version instead of
>    hardcoding it
> - Use llvm patches unmodified from meta-clang, helps in keeping them in
>    sync
> - Define PREFERRED_VERSION for llvm, llvm-native, nativesdk-llvm
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The recipe was imported from the OpenEmbedded server
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/llvm/llvm_git.bb
> commit_id 3c08b638348abd543fc92baf56c28ca16ae6aac6
> Currently this is needed for compiling pytorch glow with CPU backend which requires llvm7 or later.
> To avoid being used globally name before 2020LTS, name of the recipe is not llvm_git but llvm8_git
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   ...ryInfo-Undefine-libc-functions-if-th.patch |  92 +++++++++
>   ...-llvm-allow-env-override-of-exe-path.patch |  38 ++++
>   recipes-devtools/glow/llvm-glow_git.bb        | 180 ++++++++++++++++--
>   3 files changed, 298 insertions(+), 12 deletions(-)
>   create mode 100644 recipes-devtools/glow/llvm-glow/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
>   create mode 100644 recipes-devtools/glow/llvm-glow/0007-llvm-allow-env-override-of-exe-path.patch
>
> diff --git a/recipes-devtools/glow/llvm-glow/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/recipes-devtools/glow/llvm-glow/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
> new file mode 100644
> index 0000000..789c308
> --- /dev/null
> +++ b/recipes-devtools/glow/llvm-glow/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
> @@ -0,0 +1,92 @@
> +From 4c08879d2dfbe7face4e679ac8499dc7bff2dd20 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 21 May 2016 00:33:20 +0000
> +Subject: [PATCH 06/19] llvm: TargetLibraryInfo: Undefine libc functions if
> + they are macros
> +
> +musl defines some functions as macros and not inline functions
> +if this is the case then make sure to undefine them
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + .../llvm/Analysis/TargetLibraryInfo.def       | 21 +++++++++++++++++++
> + 1 file changed, 21 insertions(+)
> +
> +diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> +index afed404f04c..876888656f2 100644
> +--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> ++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> +@@ -782,6 +782,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
> + TLI_DEFINE_ENUM_INTERNAL(fopen)
> + TLI_DEFINE_STRING_INTERNAL("fopen")
> + /// FILE *fopen64(const char *filename, const char *opentype)
> ++#ifdef fopen64
> ++#undef fopen64
> ++#endif
> + TLI_DEFINE_ENUM_INTERNAL(fopen64)
> + TLI_DEFINE_STRING_INTERNAL("fopen64")
> + /// int fork();
> +@@ -829,6 +832,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
> + /// int fseeko(FILE *stream, off_t offset, int whence);
> + TLI_DEFINE_ENUM_INTERNAL(fseeko)
> + TLI_DEFINE_STRING_INTERNAL("fseeko")
> ++#ifdef fseeko64
> ++#undef fseeko64
> ++#endif
> + /// int fseeko64(FILE *stream, off64_t offset, int whence)
> + TLI_DEFINE_ENUM_INTERNAL(fseeko64)
> + TLI_DEFINE_STRING_INTERNAL("fseeko64")
> +@@ -839,6 +845,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
> + TLI_DEFINE_ENUM_INTERNAL(fstat)
> + TLI_DEFINE_STRING_INTERNAL("fstat")
> + /// int fstat64(int filedes, struct stat64 *buf)
> ++#ifdef fstat64
> ++#undef fstat64
> ++#endif
> + TLI_DEFINE_ENUM_INTERNAL(fstat64)
> + TLI_DEFINE_STRING_INTERNAL("fstat64")
> + /// int fstatvfs(int fildes, struct statvfs *buf);
> +@@ -854,6 +863,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
> + TLI_DEFINE_ENUM_INTERNAL(ftello)
> + TLI_DEFINE_STRING_INTERNAL("ftello")
> + /// off64_t ftello64(FILE *stream)
> ++#ifdef ftello64
> ++#undef ftello64
> ++#endif
> + TLI_DEFINE_ENUM_INTERNAL(ftello64)
> + TLI_DEFINE_STRING_INTERNAL("ftello64")
> + /// int ftrylockfile(FILE *file);
> +@@ -980,6 +992,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
> + TLI_DEFINE_ENUM_INTERNAL(lstat)
> + TLI_DEFINE_STRING_INTERNAL("lstat")
> + /// int lstat64(const char *path, struct stat64 *buf);
> ++#ifdef lstat64
> ++#undef lstat64
> ++#endif
> + TLI_DEFINE_ENUM_INTERNAL(lstat64)
> + TLI_DEFINE_STRING_INTERNAL("lstat64")
> + /// void *malloc(size_t size);
> +@@ -1205,6 +1220,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
> + TLI_DEFINE_ENUM_INTERNAL(stat)
> + TLI_DEFINE_STRING_INTERNAL("stat")
> + /// int stat64(const char *path, struct stat64 *buf);
> ++#ifdef stat64
> ++#undef stat64
> ++#endif
> + TLI_DEFINE_ENUM_INTERNAL(stat64)
> + TLI_DEFINE_STRING_INTERNAL("stat64")
> + /// int statvfs(const char *path, struct statvfs *buf);
> +@@ -1340,6 +1358,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
> + TLI_DEFINE_ENUM_INTERNAL(tmpfile)
> + TLI_DEFINE_STRING_INTERNAL("tmpfile")
> + /// FILE *tmpfile64(void)
> ++#ifdef tmpfile64
> ++#undef tmpfile64
> ++#endif
> + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
> + TLI_DEFINE_STRING_INTERNAL("tmpfile64")
> + /// int toascii(int c);
> +--
> +2.22.0
> +
> diff --git a/recipes-devtools/glow/llvm-glow/0007-llvm-allow-env-override-of-exe-path.patch b/recipes-devtools/glow/llvm-glow/0007-llvm-allow-env-override-of-exe-path.patch
> new file mode 100644
> index 0000000..f47080c
> --- /dev/null
> +++ b/recipes-devtools/glow/llvm-glow/0007-llvm-allow-env-override-of-exe-path.patch
> @@ -0,0 +1,38 @@
> +From b66d6f39a374b8df41e7235351e5dee2e81f440c Mon Sep 17 00:00:00 2001
> +From: Martin Kelly <mkelly@xevo.com>
> +Date: Fri, 19 May 2017 00:22:57 -0700
> +Subject: [PATCH 07/19] llvm: allow env override of exe path
> +
> +When using a native llvm-config from inside a sysroot, we need llvm-config to
> +return the libraries, include directories, etc. from inside the sysroot rather
> +than from the native sysroot. Thus provide an env override for calling
> +llvm-config from a target sysroot.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Martin Kelly <mkelly@xevo.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
> +index 7ef7c46a262..a4f7ed82c7b 100644
> +--- a/llvm/tools/llvm-config/llvm-config.cpp
> ++++ b/llvm/tools/llvm-config/llvm-config.cpp
> +@@ -225,6 +225,13 @@ Typical components:\n\
> +
> + /// Compute the path to the main executable.
> + std::string GetExecutablePath(const char *Argv0) {
> ++  // Hack for Yocto: we need to override the root path when we are using
> ++  // llvm-config from within a target sysroot.
> ++  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
> ++  if (Sysroot != nullptr) {
> ++    return Sysroot;
> ++  }
> ++
> +   // This just needs to be some symbol in the binary; C++ doesn't
> +   // allow taking the address of ::main however.
> +   void *P = (void *)(intptr_t)GetExecutablePath;
> +--
> +2.22.0
> +
> diff --git a/recipes-devtools/glow/llvm-glow_git.bb b/recipes-devtools/glow/llvm-glow_git.bb
> index 58d392b..d3c2642 100644
> --- a/recipes-devtools/glow/llvm-glow_git.bb
> +++ b/recipes-devtools/glow/llvm-glow_git.bb
> @@ -1,24 +1,180 @@
> -DESCRIPTION = "LLVM release suggested for pytorch glow neural network compiler"
> -HOMEPAGE = "https://github.com/llvm-mirror/llvm"
> +# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "The LLVM Compiler Infrastructure"
> +HOMEPAGE = "http://llvm.org"
> +LICENSE = "NCSA"
>   SECTION = "devel"
> -LICENSE = "Apache-2.0"
> +
>   LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
> -PV = "8.0"
> -PR = "r0"
>   
> -DEPENDS = "ninja-native protobuf-native libpng-native protobuf-native protobuf-c-native gflags-native glog-native"
> +DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm8-native"
>   
> -SOLIBVER = "1"
> +RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
> +
> +inherit cmake pkgconfig
> +
> +PROVIDES += "llvm${PV}"
>   
> -SRC_URI = "git://github.com/llvm-mirror/llvm.git;protocol=https;branch=release_80;rev=5563a6a769b48912b9c8052124520610966eda28;destsuffix=git/llvm \
> -           git://github.com/llvm-mirror/clang.git;protocol=https;branch=release_80;rev=ccfe04576c13497b9c422ceef0b6efe99077a392;destsuffix=git/clang \
> -           "
> +LLVM_RELEASE = "${PV}"
> +LLVM_DIR = "llvm${LLVM_RELEASE}"
>   
> +SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
> +
> +BRANCH = "release/${MAJOR_VERSION}.x"
> +MAJOR_VERSION = "8"
> +MINOR_VERSION = "0"
> +PATCH_VERSION = "1"
> +SOLIBVER = "1"
> +PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
> +SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
> +           file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
> +           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
> +          "
>   
>   S = "${WORKDIR}/git/llvm"
>   
> -EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DLLVM_INSTALL_UTILS=ON -DLLVM_ENABLE_PROJECTS=clang"
> +LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
> +
> +def get_llvm_arch(bb, d, arch_var):
> +    import re
> +    a = d.getVar(arch_var)
> +    if   re.match(r'(i.86|athlon|x86.64)$', a):         return 'X86'
> +    elif re.match(r'arm$', a):                          return 'ARM'
> +    elif re.match(r'armeb$', a):                        return 'ARM'
> +    elif re.match(r'aarch64$', a):                      return 'AArch64'
> +    elif re.match(r'aarch64_be$', a):                   return 'AArch64'
> +    elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
> +    elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
> +    else:
> +        raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
> +
> +def get_llvm_host_arch(bb, d):
> +    return get_llvm_arch(bb, d, 'HOST_ARCH')
> +
> +#
> +# Default to build all OE-Core supported target arches (user overridable).
> +#
> +LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
> +
> +ARM_INSTRUCTION_SET_armv5 = "arm"
> +ARM_INSTRUCTION_SET_armv4t = "arm"
> +
> +EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
> +                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
> +                  -DLLVM_ENABLE_PIC=ON \
> +                  -DLLVM_BINDINGS_LIST='' \
> +                  -DLLVM_LINK_LLVM_DYLIB=ON \
> +                  -DLLVM_ENABLE_FFI=ON \
> +                  -DLLVM_ENABLE_RTTI=ON \
> +                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
> +                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
> +                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
> +                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
> +                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python2 \
> +                  -G Ninja"
> +
> +EXTRA_OECMAKE_append_class-target = "\
> +                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
> +                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> +                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> +                 "
> +
> +EXTRA_OECMAKE_append_class-nativesdk = "\
> +                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
> +                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
> +                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
> +                 "
> +
> +CXXFLAGS_append_class-target_powerpc = " -mlongcall"
> +
> +do_configure_prepend() {
> +# Fix paths in llvm-config
> +	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
> +	sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
> +	sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g" ${S}/tools/llvm-config/llvm-config.cpp
> +}
> +
> +do_compile() {
> +	ninja -v ${PARALLEL_MAKE}
> +}
> +
> +do_compile_class-native() {
> +	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
> +}
> +
> +do_install() {
> +	DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
> +	install -D -m 0755 ${B}/bin/llvm-config ${D}${libdir}/${LLVM_DIR}/llvm-config
> +
> +	install -d ${D}${bindir}/${LLVM_DIR}
> +	cp -r ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
> +
> +	install -d ${D}${includedir}/${LLVM_DIR}
> +	cp -r ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
> +
> +	install -d ${D}${libdir}/${LLVM_DIR}
> +
> +	# The LLVM sources have "/lib" embedded and so we cannot completely rely on the ${libdir} variable
> +	if [ -d ${LLVM_INSTALL_DIR}${libdir}/ ]; then
> +		cp -r ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
> +	elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib ]; then
> +		cp -r ${LLVM_INSTALL_DIR}${prefix}/lib/* ${D}${libdir}/${LLVM_DIR}/
> +	elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib64 ]; then
> +		cp -r ${LLVM_INSTALL_DIR}${prefix}/lib64/* ${D}${libdir}/${LLVM_DIR}/
> +	fi
> +
> +	# Remove unnecessary cmake files
> +	rm -rf ${D}${libdir}/${LLVM_DIR}/cmake
> +
> +	ln -s ${LLVM_DIR}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV} ${D}${libdir}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV}
> +
> +	# We'll have to delete the libLLVM.so due to multiple reasons...
> +	rm -rf ${D}${libdir}/${LLVM_DIR}/libLLVM.so
> +	rm -rf ${D}${libdir}/${LLVM_DIR}/libLTO.so
> +}
> +
> +do_install_class-native() {
> +	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
> +	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
> +	install -D -m 0755 ${B}/lib/libLLVM-${MAJOR_VERSION}.so ${D}${libdir}/libLLVM-${MAJOR_VERSION}.so
> +}
> +
> +PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
> +
> +RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
> +
> +FILES_${PN}-bugpointpasses = "\
> +    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
> +"
> +
> +FILES_${PN}-libllvm = "\
> +    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.so \
> +    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
> +"
> +
> +FILES_${PN}-liblto += "\
> +    ${libdir}/${LLVM_DIR}/libLTO.so.* \
> +"
> +
> +FILES_${PN}-liboptremarks += "\
> +    ${libdir}/${LLVM_DIR}/libOptRemarks.so.* \
> +"
> +
> +FILES_${PN}-llvmhello = "\
> +    ${libdir}/${LLVM_DIR}/LLVMHello.so \
> +"
> +
> +FILES_${PN}-dev += " \
> +    ${libdir}/${LLVM_DIR}/llvm-config \
> +    ${libdir}/${LLVM_DIR}/libOptRemarks.so \
> +    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}.so \
> +"
> +
> +FILES_${PN}-staticdev += "\
> +    ${libdir}/${LLVM_DIR}/*.a \
> +"
>   
> -inherit pkgconfig cmake
> +INSANE_SKIP_${PN}-libllvm += "dev-so"
>   
>   BBCLASSEXTEND = "native nativesdk"

