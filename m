Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A8A9652A6F
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 03:58:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE3wppR026922
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 21:58:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE3wphq015863
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 21:58:51 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 13 Nov 2012 21:58:51 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAE3wppT031734	for
	<meta-arago@arago-project.org>; Tue, 13 Nov 2012 21:58:51 -0600
Date: Tue, 13 Nov 2012 22:58:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20121114035851.GE13096@edge>
References: <1352865012-11447-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1352865012-11447-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] meta-toolchain-arago: special case for gdb to be built as part of canadian-cross-sdk
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
X-List-Received-Date: Wed, 14 Nov 2012 03:58:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This provides the bare minimum to get the Python-enabled gdb-7.4 into the 
devkit and set it up properly. We would need to test it with gdbserver-7.2 and 
run it through OSRB...

-- 
Denys


On Tue, Nov 13, 2012 at 10:50:12PM -0500, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-extras/conf/distro/include/tcmode-external-arago.inc | 4 ++++
>  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb     | 9 ++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> index 2ed3df2..3bc0fed 100644
> --- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> +++ b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> @@ -30,6 +30,10 @@ PREFERRED_PROVIDER_glibc-thread-db = "external-arago-toolchain"
>  PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arago-sdk-toolchain"
>  PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arago-sdk-toolchain"
>  
> +# Special case for gdb to be built as part of canadian-cross-sdk
> +bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${exec_prefix}/bin"
> +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +
>  GCCVERSION ?= "4.5%"
>  SDKGCCVERSION ?= "4.5%"
>  BINUVERSION ?= "2.20%"
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 1683c1f..f780385 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r7"
> +PR = "r8"
>  
>  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
>  
> @@ -54,6 +54,8 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
>  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
> +	echo 'export PYTHONHOME=$SDK_PATH' >> $script
> +	echo 'export PYTHONPATH=lib/python2.7' >> $script
>  }
>  
>  populate_sdk_ipk_append () {
> @@ -64,4 +66,9 @@ populate_sdk_ipk_append () {
>  		printf "#!/bin/sh\nLD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" > $i
>  		chmod +x $i
>  	done
> +
> +	# Special case for gdb, which is built as part of canadian-cross-sdk
> +	mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGET_SYS}-gdb.real
> +	printf "#!/bin/sh\nLD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/${ARAGO_TARGET_SYS}-gdb.real \x24\x2a\n" > ${ARAGO_TARGET_SYS}-gdb
> +	chmod +x ${ARAGO_TARGET_SYS}-gdb
>  }
> -- 
> 1.8.0
> 

