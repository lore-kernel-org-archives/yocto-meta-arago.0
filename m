Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C3AD0529F4
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 02:27:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE2RKwE019440
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 20:27:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE2RK91012475
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 20:27:20 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 13 Nov 2012 20:27:20 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAE2RK6X013803;
	Tue, 13 Nov 2012 20:27:20 -0600
Date: Tue, 13 Nov 2012 21:27:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121114022719.GC13096@edge>
References: <20121113044034.9EA3D529AE@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C31F344@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C31F344@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [arago-commits] Denys Dmytriyenko : external-arago-sdk-toolchain:	package up gdb from the toolchain as well
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
X-List-Received-Date: Wed, 14 Nov 2012 02:27:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, gdb from the Arago toolchain does not provide python support, as that's 
how it was built back then...

The only way to get Python support built into gdb is to rebuild it from 
sources, which we discussed and agreed not to do. Moreover, if you want gdb 
built from sources, it will be of a different version - OE-Core provides 
version 7.4, while we got clearance for 7.2 and also we have target gdbserver 
of version 7.2 as well...

Denys


On Tue, Nov 13, 2012 at 01:31:37PM +0000, Cooper Jr., Franklin wrote:
> 
> We need gdb with python support is required for Qt debugging via Qt Creator http://arago-project.org/pipermail/arago-commits/2012-January/001611.html.
> Gdb-cross-canadian recipe seems to include this needed support.
> 
> A simple test to determine if python support has been added to gdb.
> Run gdb
> Enter python print 23.
> 23 should be echoed back to the console.
> 
> My build that picked up your gdb changes did not include python support for gdb.
> 
> -----Original Message-----
> From: arago-commits-bounces@arago-project.org [mailto:arago-commits-bounces@arago-project.org] On Behalf Of Arago Project git
> Sent: Monday, November 12, 2012 10:41 PM
> To: arago-commits@arago-project.org
> Subject: [arago-commits] Denys Dmytriyenko : external-arago-sdk-toolchain: package up gdb from the toolchain as well
> 
> Module: meta-arago
> Branch: master
> Commit: 78bec05ff04e6e98def765e61a7a00c35c635938
> URL:    http://arago-project.org/git/meta-arago.git?a=commit;h=78bec05ff04e6e98def765e61a7a00c35c635938
> 
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Mon Nov 12 23:35:52 2012 -0500
> 
> external-arago-sdk-toolchain: package up gdb from the toolchain as well
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> ---
> 
>  .../meta/external-arago-sdk-toolchain.bb           |   25 +++++++++++++++++++-
>  1 files changed, 24 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb
> index 4b16bc1..abd1caf 100644
> --- a/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.bb
> +++ b/meta-arago-extras/recipes-core/meta/external-arago-sdk-toolchain.b
> +++ b
> @@ -2,7 +2,7 @@ inherit cross-canadian
>  
>  require external-arago-toolchain.inc
>  
> -PR = "r2"
> +PR = "r3"
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_DEFAULT_DEPS = "1"
> @@ -16,15 +16,18 @@ LIC_FILES_CHKSUM = "\  "
>  
>  INSANE_SKIP_gcc-cross-canadian-arm = "dev-so"
> +INSANE_SKIP_gdb-cross-canadian-arm = "dev-so"
>  INSANE_SKIP_binutils-cross-canadian-arm = "dev-so"
>  
>  PROVIDES = "\
>  	gcc-cross-canadian-arm \
> +	gdb-cross-canadian-arm \
>  	binutils-cross-canadian-arm \
>  "
>  
>  PACKAGES = "\
>  	gcc-cross-canadian-arm \
> +	gdb-cross-canadian-arm \
>  	binutils-cross-canadian-arm \
>  "
>  
> @@ -32,6 +35,7 @@ PACKAGES = "\
>  bindir = "${exec_prefix}/bin/"
>  libdir = "${exec_prefix}/lib/"
>  libexecdir = "${exec_prefix}/libexec/"
> +datadir = "${exec_prefix}/share/"
>  
>  gcclibdir = "${libdir}/gcc"
>  
> @@ -55,6 +59,14 @@ FILES_gcc-cross-canadian-arm = "\
>  	${libexecdir}/* \
>  "
>  
> +FILES_gdb-cross-canadian-arm = "\
> +	${bindir}/${TARGET_PREFIX}gdb \
> +	${bindir}/${TARGET_PREFIX}gdbtui \
> +	${datadir}/gdb/* \
> +	${datadir}/info/* \
> +	${datadir}/man/man1/${TARGET_PREFIX}* \ "
> +
>  FILES_binutils-cross-canadian-arm = "\
>  	${prefix}/${ARAGO_TARGET_SYS}/bin/ld \
>  	${prefix}/${ARAGO_TARGET_SYS}/bin/addr2line \ @@ -91,14 +103,17 @@ FILES_binutils-cross-canadian-arm = "\  "
>  
>  DESCRIPTION_gcc-cross-canadian-arm = "The GNU cc and gcc C compilers"
> +DESCRIPTION_gdb-cross-canadian-arm = "gdb - GNU debugger"
>  DESCRIPTION_binutils-cross-canadian-arm = "A GNU collection of binary utilities"
>  
>  LICENSE = "${ARG_LIC_LIBC}"
>  LICENSE_gcc-cross-canadian-arm = "${ARG_LIC_GCC}"
> +LICENSE_gdb-cross-canadian-arm = "${ARG_LIC_GDB}"
>  LICENSE_binutils-cross-canadian-arm = "${ARG_LIC_BFD}"
>  
>  PKGV = "${ARG_VER_MAIN}"
>  PKGV_gcc-cross-canadian-arm = "${ARG_VER_GCC}"
> +PKGV_gdb-cross-canadian-arm = "${ARG_VER_GDB}"
>  PKGV_binutils-cross-canadian-arm = "${ARG_VER_BFD}"
>  
>  do_install() {
> @@ -109,6 +124,9 @@ do_install() {
>  	install -d ${D}${libdir}/ldscripts
>  	install -d ${D}${includedir}
>  	install -d ${D}${libexecdir}
> +	install -d ${D}${datadir}/gdb
> +	install -d ${D}${datadir}/info
> +	install -d ${D}${datadir}/man/man1
>  	install -d ${D}${gcclibdir}/${ARAGO_TARGET_SYS}/${ARG_VER_GCC}/include
>  	install -d ${D}${prefix}/i686-linux
>  
> @@ -118,6 +136,11 @@ do_install() {
>  	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gccbug,gcc,g++,cpp} ${D}${bindir}
>  	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
>  
> +	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gdb,gdbtui} ${D}${bindir}
> +	cp -a ${TOOLCHAIN_PATH}/share/gdb/* ${D}${datadir}/gdb/
> +	cp -a ${TOOLCHAIN_PATH}/share/info/* ${D}${datadir}/info/
> +	cp -a ${TOOLCHAIN_PATH}/share/man/man1/${TARGET_PREFIX}*
> +${D}${datadir}/man/man1/
> +
>  	cp -a ${TOOLCHAIN_PATH}/${ARAGO_TARGET_SYS}/bin/{ld,addr2line,objcopy,readelf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${prefix}/${ARAGO_TARGET_SYS}/bin
>  	cp -a ${TOOLCHAIN_PATH}/include/*.h ${D}${includedir}
>  	cp -a ${TOOLCHAIN_PATH}/lib/ldscripts/* ${D}${libdir}/ldscripts
> 
> _______________________________________________
> arago-commits mailing list
> arago-commits@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

