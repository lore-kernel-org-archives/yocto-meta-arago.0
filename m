Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB386C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 11:30:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.40532.1691753439349907333
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 04:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iWmgLkBx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37BBUYfn023114;
	Fri, 11 Aug 2023 06:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691753434;
	bh=V8VClvQ8+oohE/TeruiycdAX+FUM1l7Al/Io6jXHUtI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iWmgLkBxSEe9ZOLWtsSWu++pu/CFrZfi1GqE3LA3GfDLHM0glckigxtrGpSoO1A51
	 lRi8ABOcneQYoqjGjUXh/7pktnEsYNZsVC1NOrkc8yAw8DEGMxN2MA45ijiLnWPq2M
	 Ewbj/REs6CkAdIm4qFloqYBk2zlpT5xgSu4Njd+U=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37BBUYjm003734
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Aug 2023 06:30:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Aug 2023 06:30:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Aug 2023 06:30:32 -0500
Received: from [10.24.68.161] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37BBUURU055306;
	Fri, 11 Aug 2023 06:30:31 -0500
Content-Type: multipart/alternative;
	boundary="------------ycJex490FiRqNKRBpkmzQ0j6"
Message-ID: <dfefcf02-11bd-75bb-4400-33e7e30463bf@ti.com>
Date: Fri, 11 Aug 2023 17:00:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [EXTERNAL] [meta-arago] [kirkstone][PATCH 5/6] meta-arago: remove
 extra plumbing for internal toolchain
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230706212335.1893675-1-denis@denix.org>
 <20230706212335.1893675-6-denis@denix.org>
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20230706212335.1893675-6-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Aug 2023 11:30:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14835

--------------ycJex490FiRqNKRBpkmzQ0j6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

This is probably not about this new patch series for the r5f toolchain. 
I am facing issues with the internal toolchain for A72

I was trying out u-boot and linux builds with these new internal 
toolchains and everything works fine EXCEPT for u-boot-a72 build:

I get this error : "aarch64-oe-linux-ld.bfd: cannot find -lgcc: No such 
file or directory"

I narrowed down the error to incorrect Ldir being parsed in the u-boot 
Makefile here [1] which expects absolute path for the 
print-libgcc-file-name.

The build with the external toolchain works coz that prints the absolute 
path while the yocto internal toolchain is returning just the filename: 
./bin/aarch64-none-linux-gnu-gcc -print-libgcc-file-name #Prints full 
path to libgcc.a file

./linux-devkit/sysroots/x86_64-arago-linux/usr/bin/aarch64-oe-linux/aarch64-oe-linux-gcc 
-print-libgcc-file-name #Prints just "libgcc.a". The dirname for this 
returns "."

[1]: 
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2023.04#n895

As it stands, I am unable to build u-boot with the internal toolchain. 
Either something needs to be fixed in the toolchain itself or I am 
missing some flag / Env variable?

Thanks,

Aniket

On 07/07/23 02:53, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@konsulko.com>
>
> No longer needed w/o external toolchain - use defaults from OE-Core.
>
> Also remove extra code that was trying to unify internal and external
> toolchains structures in meta-toolchain-arago.
>
> Signed-off-by: Denys Dmytriyenko<denys@konsulko.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf      | 10 ----
>   .../conf/distro/include/toolchain-gcc.inc     | 41 --------------
>   .../distro/include/toolchain-internal.inc     |  4 --
>   .../recipes-core/meta/meta-toolchain-arago.bb | 54 +++++--------------
>   4 files changed, 14 insertions(+), 95 deletions(-)
>   delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-gcc.inc
>   delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-internal.inc
>
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index ceb74b6e..f03c82bf 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -152,16 +152,6 @@ ARAGO_SYSTEST_ENABLE ?= "0"
>   ARAGO_KERNEL_SUFFIX:append ="${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
>   IMAGE_FSTYPES:remove ="${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"
>   
> -# Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
> -# Set some sane defaults, in case someone forgets to set them in local.conf
> -TC_SANE_DEFAULT ?= "arm"
> -TOOLCHAIN_TYPE ?= "internal"
> -TOOLCHAIN_TYPE:omapl138 = "internal"
> -TOOLCHAIN_BRAND ?="${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 
> 'internal']}"
> -
> -require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
> -require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> -
>   # Enable basic stack and buffer overflow protections
>   #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
>   #TARGET_CPPFLAGS += "-fstack-protector"
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> deleted file mode 100644
> index 1c059a6f..00000000
> --- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -# Select internal gcc toolchain to be built from sources
> -TCMODE = "default"
> -TCLIBC = "glibc"
> -
> -LIBCEXTENSION ="${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
> -
> -# Match some of the external vars
> -TOOLCHAIN_SYS := "${TARGET_SYS}"
> -TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
> -
> -PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> -PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> -PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> -
> -# Set Cross and SDK toolchain preferences
> -SDKGCCVERSION ?= "11%"
> -SDKBINUVERSION ?= "2.38%"
> -SDKGLIBCVERSION ?= "2.35%"
> -
> -PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
> -
> -PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
> -
> -# Set target toolchain preferences to match Cross/SDK by default
> -# Can be overwritten globally, if needed
> -GCCVERSION ?= "11%"
> -BINUVERSION ?= "2.38%"
> -GLIBCVERSION ?= "2.35%"
> -
> -PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
> -PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> -PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-internal.inc b/meta-arago-distro/conf/distro/include/toolchain-internal.inc
> deleted file mode 100644
> index cbc3b53d..00000000
> --- a/meta-arago-distro/conf/distro/include/toolchain-internal.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# No special handling is required for locating the internal toolchain, just re-use existing vars
> -TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
> -TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
> -EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 5c1c3ad0..8bff9abb 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -33,8 +33,8 @@ toolchain_create_sdk_env_script () {
>   	echo 'fi' >> $script
>   	echo 'export SDK_SYS=${SDK_SYS}' >> $script
>   	echo 'export REAL_MULTIMACH_TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script
> -	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
> -	echo 'export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-' >> $script
> +	echo 'export TARGET_SYS=${TARGET_SYS}' >> $script
> +	echo 'export TARGET_PREFIX=$TARGET_SYS-' >> $script
>   	echo 'export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS' >> $script
>   	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' >> $script
>   	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIVE${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' >> $script
> @@ -43,18 +43,18 @@ toolchain_create_sdk_env_script () {
>   	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig:$SDK_PATH_TARGET${datadir}/pkgconfig' >> $script
>   	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
>   	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script
> -	printf 'export CC="\x24{TOOLCHAIN_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' >> $script
> -	printf 'export CXX="\x24{TOOLCHAIN_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' >> $script
> -	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
> -	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' >> $script
> -	printf 'export LD="\x24{TOOLCHAIN_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' >> $script
> -	printf 'export NM=\x24{TOOLCHAIN_PREFIX}nm\n' >> $script
> -	printf 'export AS=\x24{TOOLCHAIN_PREFIX}as\n' >> $script
> -	printf 'export AR=\x24{TOOLCHAIN_PREFIX}ar\n' >> $script
> -	printf 'export RANLIB=\x24{TOOLCHAIN_PREFIX}ranlib\n' >> $script
> -	printf 'export OBJCOPY=\x24{TOOLCHAIN_PREFIX}objcopy\n' >> $script
> -	printf 'export OBJDUMP=\x24{TOOLCHAIN_PREFIX}objdump\n' >> $script
> -	printf 'export STRIP=\x24{TOOLCHAIN_PREFIX}strip\n' >> $script
> +	printf 'export CC="\x24{TARGET_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' >> $script
> +	printf 'export CXX="\x24{TARGET_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' >> $script
> +	printf 'export GDB=\x24{TARGET_PREFIX}gdb\n' >> $script
> +	printf 'export CPP="\x24{TARGET_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' >> $script
> +	printf 'export LD="\x24{TARGET_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' >> $script
> +	printf 'export NM=\x24{TARGET_PREFIX}nm\n' >> $script
> +	printf 'export AS=\x24{TARGET_PREFIX}as\n' >> $script
> +	printf 'export AR=\x24{TARGET_PREFIX}ar\n' >> $script
> +	printf 'export RANLIB=\x24{TARGET_PREFIX}ranlib\n' >> $script
> +	printf 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy\n' >> $script
> +	printf 'export OBJDUMP=\x24{TARGET_PREFIX}objdump\n' >> $script
> +	printf 'export STRIP=\x24{TARGET_PREFIX}strip\n' >> $script
>   	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' >> $script
>   	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=$SDK_PATH_TARGET"' >> $script
>   	echo 'export CFLAGS="$CPPFLAGS"' >> $script
> @@ -97,32 +97,6 @@ arago_sdk_fixup () {
>   	done
>   
>   	cleanup_toolchain_packages
> -
> -	# Do some extra setup work due to new structure
> -	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
> -	if [ "${TOOLCHAIN_TYPE}" = "internal" ]; then
> -		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
> -	else
> -		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
> -	fi
> -	tcv=`ls -1 $lexec|head -1`
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
> -	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN_SYS}"
> -	mkdir -p $tcpath
> -	( cd $tcpath; \
> -		ln -s ${SDKTARGETSYSROOT}/include include; \
> -		if [ "${TOOLCHAIN_BRAND}" != "arago" ]; then \
> -			mkdir -p libc; \
> -			cd libc; \
> -		fi; \
> -		mkdir -p usr; \
> -		ln -s ${SDKTARGETSYSROOT}/lib lib; \
> -		ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib; \
> -		ln -s ${SDKTARGETSYSROOT}/usr/include usr/include; \
> -	)
>   }
>   
>   fakeroot create_sdk_files() {
--------------ycJex490FiRqNKRBpkmzQ0j6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Denys,</p>
    <p>
</p>
    <p>This is probably not about this new patch series for the r5f toolchain. I am facing issues with the internal toolchain for A72
</p>
    <p>I was trying out u-boot and linux builds with these new internal toolchains and everything works fine EXCEPT for u-boot-a72 build:</p>
    <p>I get this error : "<span style=" font-family:'Consolas'; color:#ffffff; background-color:#1c1c1c;">aarch64-oe-linux-ld.bfd: cannot find -lgcc: No such file or directory</span>"</p>
    <p>
</p>
    <p>I narrowed down the error to incorrect Ldir being parsed in the u-boot Makefile here [1] which expects absolute path for the print-libgcc-file-name.
</p>
    <p>
</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">The build with the external toolchain works coz that prints the absolute path while the yocto internal toolchain is returning just the filename:
./bin/aarch64-none-linux-gnu-gcc -print-libgcc-file-name    						 						#Prints full path to libgcc.a file
</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">./linux-devkit/sysroots/x86_64-arago-linux/usr/bin/aarch64-oe-linux/aarch64-oe-linux-gcc -print-libgcc-file-name	#Prints just "libgcc.a". The dirname for this returns "."</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <p><style type="text/css">p, li { white-space: pre-wrap; }</style></p>
    <p>
</p>
    <p>[1]: <a class="moz-txt-link-freetext" href="https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2023.04#n895">https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/Makefile?h=ti-u-boot-2023.04#n895</a></p>
    <p>
</p>
    <p>As it stands, I am unable to build u-boot with the internal toolchain. Either something needs to be fixed in the toolchain itself or I am missing some flag / Env variable?</p>
    <p>
</p>
    <p>Thanks,</p>
    <p>Aniket
</p>
    <p>
</p>
    <div class="moz-cite-prefix">On 07/07/23 02:53, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230706212335.1893675-6-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@konsulko.com">&lt;denys@konsulko.com&gt;</a>

No longer needed w/o external toolchain - use defaults from OE-Core.

Also remove extra code that was trying to unify internal and external
toolchains structures in meta-toolchain-arago.

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@konsulko.com">&lt;denys@konsulko.com&gt;</a>
---
 meta-arago-distro/conf/distro/arago.conf      | 10 ----
 .../conf/distro/include/toolchain-gcc.inc     | 41 --------------
 .../distro/include/toolchain-internal.inc     |  4 --
 .../recipes-core/meta/meta-toolchain-arago.bb | 54 +++++--------------
 4 files changed, 14 insertions(+), 95 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-gcc.inc
 delete mode 100644 meta-arago-distro/conf/distro/include/toolchain-internal.inc

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ceb74b6e..f03c82bf 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -152,16 +152,6 @@ ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX:append = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.conditional(">"${@oe.utils.conditional("</a>ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES:remove = <a class="moz-txt-link-rfc2396E" href="mailto:${@['','ubiubifs'][d.getVar('ARAGO_SYSTEST_ENABLE')=='1']}">"${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"</a>
 
-# Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
-# Set some sane defaults, in case someone forgets to set them in local.conf
-TC_SANE_DEFAULT ?= "arm"
-TOOLCHAIN_TYPE ?= "internal"
-TOOLCHAIN_TYPE:omapl138 = "internal"
-TOOLCHAIN_BRAND ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE')=='internal']}">"${@[d.getVar('TC_SANE_DEFAULT'),'gcc'][d.getVar('TOOLCHAIN_TYPE') == 'internal']}"</a>
-
-require conf/distro/include/toolchain-${TOOLCHAIN_BRAND}.inc
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-
 # Enable basic stack and buffer overflow protections
 #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
 #TARGET_CPPFLAGS += "-fstack-protector"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc b/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
deleted file mode 100644
index 1c059a6f..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-gcc.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-# Select internal gcc toolchain to be built from sources
-TCMODE = "default"
-TCLIBC = "glibc"
-
-LIBCEXTENSION = <a class="moz-txt-link-rfc2396E" href="mailto:${@['','-gnu'][(d.getVar('ABIEXTENSION')or'')!='']}">"${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"</a>
-
-# Match some of the external vars
-TOOLCHAIN_SYS := "${TARGET_SYS}"
-TOOLCHAIN_PREFIX := "${TARGET_PREFIX}"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-# Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "11%"
-SDKBINUVERSION ?= "2.38%"
-SDKGLIBCVERSION ?= "2.35%"
-
-PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_gcc-crosssdk-initial-${SDK_SYS} ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${SDKBINUVERSION}"
-
-PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc ?= "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-locale ?= "${SDKGLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
-
-# Set target toolchain preferences to match Cross/SDK by default
-# Can be overwritten globally, if needed
-GCCVERSION ?= "11%"
-BINUVERSION ?= "2.38%"
-GLIBCVERSION ?= "2.35%"
-
-PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_glibc ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial ?= "${GLIBCVERSION}"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-internal.inc b/meta-arago-distro/conf/distro/include/toolchain-internal.inc
deleted file mode 100644
index cbc3b53d..00000000
--- a/meta-arago-distro/conf/distro/include/toolchain-internal.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# No special handling is required for locating the internal toolchain, just re-use existing vars
-TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
-TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
-EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 5c1c3ad0..8bff9abb 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -33,8 +33,8 @@ toolchain_create_sdk_env_script () {
 	echo 'fi' &gt;&gt; $script
 	echo 'export SDK_SYS=${SDK_SYS}' &gt;&gt; $script
 	echo 'export REAL_MULTIMACH_TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' &gt;&gt; $script
-	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' &gt;&gt; $script
-	echo 'export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-' &gt;&gt; $script
+	echo 'export TARGET_SYS=${TARGET_SYS}' &gt;&gt; $script
+	echo 'export TARGET_PREFIX=$TARGET_SYS-' &gt;&gt; $script
 	echo 'export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS' &gt;&gt; $script
 	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' &gt;&gt; $script
 	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$SDK_PATH_NATIVE${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}:$PATH' &gt;&gt; $script
@@ -43,18 +43,18 @@ toolchain_create_sdk_env_script () {
 	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig:$SDK_PATH_TARGET${datadir}/pkgconfig' &gt;&gt; $script
 	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' &gt;&gt; $script
 	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' &gt;&gt; $script
-	printf 'export CC="\x24{TOOLCHAIN_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
-	printf 'export CXX="\x24{TOOLCHAIN_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
-	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' &gt;&gt; $script
-	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
-	printf 'export LD="\x24{TOOLCHAIN_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
-	printf 'export NM=\x24{TOOLCHAIN_PREFIX}nm\n' &gt;&gt; $script
-	printf 'export AS=\x24{TOOLCHAIN_PREFIX}as\n' &gt;&gt; $script
-	printf 'export AR=\x24{TOOLCHAIN_PREFIX}ar\n' &gt;&gt; $script
-	printf 'export RANLIB=\x24{TOOLCHAIN_PREFIX}ranlib\n' &gt;&gt; $script
-	printf 'export OBJCOPY=\x24{TOOLCHAIN_PREFIX}objcopy\n' &gt;&gt; $script
-	printf 'export OBJDUMP=\x24{TOOLCHAIN_PREFIX}objdump\n' &gt;&gt; $script
-	printf 'export STRIP=\x24{TOOLCHAIN_PREFIX}strip\n' &gt;&gt; $script
+	printf 'export CC="\x24{TARGET_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
+	printf 'export CXX="\x24{TARGET_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
+	printf 'export GDB=\x24{TARGET_PREFIX}gdb\n' &gt;&gt; $script
+	printf 'export CPP="\x24{TARGET_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
+	printf 'export LD="\x24{TARGET_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' &gt;&gt; $script
+	printf 'export NM=\x24{TARGET_PREFIX}nm\n' &gt;&gt; $script
+	printf 'export AS=\x24{TARGET_PREFIX}as\n' &gt;&gt; $script
+	printf 'export AR=\x24{TARGET_PREFIX}ar\n' &gt;&gt; $script
+	printf 'export RANLIB=\x24{TARGET_PREFIX}ranlib\n' &gt;&gt; $script
+	printf 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy\n' &gt;&gt; $script
+	printf 'export OBJDUMP=\x24{TARGET_PREFIX}objdump\n' &gt;&gt; $script
+	printf 'export STRIP=\x24{TARGET_PREFIX}strip\n' &gt;&gt; $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' &gt;&gt; $script
 	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=$SDK_PATH_TARGET"' &gt;&gt; $script
 	echo 'export CFLAGS="$CPPFLAGS"' &gt;&gt; $script
@@ -97,32 +97,6 @@ arago_sdk_fixup () {
 	done
 
 	cleanup_toolchain_packages
-
-	# Do some extra setup work due to new structure
-	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-	if [ "${TOOLCHAIN_TYPE}" = "internal" ]; then
-		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/gcc/${TOOLCHAIN_SYS}"
-	else
-		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
-	fi
-	tcv=`ls -1 $lexec|head -1`
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
-	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN_SYS}"
-	mkdir -p $tcpath
-	( cd $tcpath; \
-		ln -s ${SDKTARGETSYSROOT}/include include; \
-		if [ "${TOOLCHAIN_BRAND}" != "arago" ]; then \
-			mkdir -p libc; \
-			cd libc; \
-		fi; \
-		mkdir -p usr; \
-		ln -s ${SDKTARGETSYSROOT}/lib lib; \
-		ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib; \
-		ln -s ${SDKTARGETSYSROOT}/usr/include usr/include; \
-	)
 }
 
 fakeroot create_sdk_files() {
</pre>
    </blockquote>
  </body>
</html>

--------------ycJex490FiRqNKRBpkmzQ0j6--

