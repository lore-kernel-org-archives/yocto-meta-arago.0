Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8FB0052A0E
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 21:05:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7L5hjl006731
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 15:05:43 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7L5gpG008656
	for <meta-arago@arago-project.org>; Wed, 7 Nov 2012 15:05:42 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 7 Nov 2012 15:05:42 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA7L5grN007857	for
	<meta-arago@arago-project.org>; Wed, 7 Nov 2012 15:05:42 -0600
Date: Wed, 7 Nov 2012 16:05:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20121107210542.GG11967@edge>
References: <1352322180-17306-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1352322180-17306-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] meta-toolchain-arago: make SDK/devkit relocatable
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
X-List-Received-Date: Wed, 07 Nov 2012 21:05:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 07, 2012 at 04:03:00PM -0500, Denys Dmytriyenko wrote:
> Implement poor man's relocation technique for self-contained crosssdk binaries
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> In v2 use stub shell scripts instead of aliases, to work in Makefiles

Ok, this seems to work fine in shell and in Makefiles too. And it also works 
when environment-setup is sources before calling make, but not inside the 
Makefile.


>  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index d2fe982..81bdeed 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r5"
> +PR = "r6"
>  
>  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
>  
> @@ -28,6 +28,7 @@ toolchain_create_sdk_env_script () {
>  	echo 'export TARGET_SYS=${ARAGO_TARGET_SYS}' >> $script
>  	echo 'export TARGET_PREFIX=$TARGET_SYS-' >> $script
>  	echo 'export PATH=$SDK_PATH/bin:$PATH' >> $script
> +	echo 'export LD_LIBRARY_PATH=$SDK_PATH/lib:$LD_LIBRARY_PATH' >> $script
>  	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
>  	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
> @@ -55,3 +56,13 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>  }
> +
> +populate_sdk_ipk_append () {
> +	cd ${SDK_OUTPUT}/${SDKPATH}/bin
> +	binfiles=`find ! -name "${ARAGO_TARGET_SYS}-*" -type f -perm +111 -exec file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`
> +	for i in $binfiles; do
> +		mv $i $i.real
> +		printf "#!/bin/sh\n\x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" > $i
> +		chmod +x $i
> +	done
> +}
> -- 
> 1.8.0
> 

