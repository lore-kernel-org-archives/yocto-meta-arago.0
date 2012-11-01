Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6C333529AD
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 19:35:02 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA1JZ1Op031996
	for <meta-arago@arago-project.org>; Thu, 1 Nov 2012 14:35:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA1JZ1jP031688
	for <meta-arago@arago-project.org>; Thu, 1 Nov 2012 14:35:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 1 Nov 2012 14:35:00 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA1JZ0Xv019194	for
	<meta-arago@arago-project.org>; Thu, 1 Nov 2012 14:35:00 -0500
Date: Thu, 1 Nov 2012 15:35:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20121101193500.GH22705@edge>
References: <1351798334-12904-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1351798334-12904-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] meta-toolchain-arago: remove MULTIMACH_TARGET_SYS suffix from top level files
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
X-List-Received-Date: Thu, 01 Nov 2012 19:35:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 01, 2012 at 03:32:14PM -0400, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Well, I don't like this patch - to drop those suffixes, I need to duplicate 
two more general functions locally. Arguably, having own copy of "version" 
function is good - we can extend it. But there's no use for the "site-config" 
one. As an alternative, we can leave "site-config" one with the suffix, which 
is not very consistent, but bearable... Thoughts?

-- 
Denys


> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      | 40 +++++++++++++++++++---
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 1e5d140..8c92b10 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,19 +4,19 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
>  
>  # This function creates an environment-setup-script for use in a deployable SDK
>  toolchain_create_sdk_env_script () {
>  	# Create environment setup script
> -	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${MULTIMACH_TARGET_SYS}
> +	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
>  	rm -f $script
>  	touch $script
>  	echo 'SDK_PATH="${SDKPATHNATIVE}"' >> $script
> -	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup-${MULTIMACH_TARGET_SYS}" ]; then' >> $script
> -	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup-${MULTIMACH_TARGET_SYS}\""' >> $script
> +	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ]; then' >> $script
> +	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup\""' >> $script
>  	echo '    exit 1' >> $script
>  	echo 'else' >> $script
>  	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
> @@ -31,7 +31,7 @@ toolchain_create_sdk_env_script () {
>  	echo 'export CPATH=$SDK_PATH/$TARGET_SYS/usr/include:$CPATH' >> $script
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH/$TARGET_SYS' >> $script
>  	echo 'export PKG_CONFIG_PATH=$SDK_PATH/$TARGET_SYS${libdir}/pkgconfig' >> $script
> -	echo 'export CONFIG_SITE=$SDK_PATH/site-config-${MULTIMACH_TARGET_SYS}' >> $script
> +	echo 'export CONFIG_SITE=$SDK_PATH/site-config' >> $script
>  	echo -e 'export CC=\x24{TARGET_PREFIX}gcc' >> $script
>  	echo -e 'export CXX=\x24{TARGET_PREFIX}g++' >> $script
>  	echo -e 'export GDB=\x24{TARGET_PREFIX}gdb' >> $script
> @@ -46,3 +46,33 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>  }
> +
> +#This function create a site config file
> +toolchain_create_sdk_siteconfig () {
> +	local siteconfig=${SDK_OUTPUT}/${SDKPATH}/site-config
> +
> +	rm -f $siteconfig
> +	touch $siteconfig
> +
> +	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
> +		cat $sitefile >> $siteconfig
> +	done
> +
> +	#get cached site config
> +	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
> +		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
> +			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
> +		fi
> +	done
> +}
> +
> +#This function create a version information file
> +toolchain_create_sdk_version () {
> +	local versionfile=${SDK_OUTPUT}/${SDKPATH}/version
> +	rm -f $versionfile
> +	touch $versionfile
> +	echo 'Distro: ${DISTRO}' >> $versionfile
> +	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
> +	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
> +	echo 'Timestamp: ${DATETIME}' >> $versionfile
> +}
> -- 
> 1.7.12.4
> 

