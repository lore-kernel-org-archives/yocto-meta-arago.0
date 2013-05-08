Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 60039529D9
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 13:59:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48DxBp6014409
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 08:59:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48DxBAN032255
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 08:59:11 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 08:59:11 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r48DxBi9013401;
	Wed, 8 May 2013 08:59:11 -0500
Date: Wed, 8 May 2013 09:59:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130508135910.GA13151@edge>
References: <1368019131-13375-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1368019131-13375-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] meta-toolchain-arago: Allow relocate script to hard code SDK_PATH value
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
X-List-Received-Date: Wed, 08 May 2013 13:59:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Franklin,

Well, I think I already used up all my weekly quota for reviewing patches 
yesterday... :) But, Ok.


> * SDK_PATH was previously dynamically determined by using BASHISMS when
>   environment-setup was sourced.

But there was still a known good fallback for when not run under bash.


> * Relocate_sdk.py is required to be ran and the script knows the location of the
>   toolchain SDK.
> * By having the relocate_sdk script set SDK_PATH we remove the need for
>   bashisms from environment-setup.

It is already doing that, no need to change it.


> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 699ada7..7f70c42 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -7,7 +7,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= ""
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r23"
> +PR = "r24"
>  
>  # This function creates an environment-setup-script for use in a deployable SDK
>  toolchain_create_sdk_env_script () {
> @@ -15,17 +15,7 @@ toolchain_create_sdk_env_script () {
>  	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
>  	rm -f $script
>  	touch $script
> -	echo 'SDK_PATH="${SDKPATH}"' >> $script
> -	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ]; then' >> $script
> -	echo '    echo "Error: This script needs to be sourced. Please run as \". ./environment-setup\""' >> $script
> -	echo '    exit 1' >> $script

This portion above may stay - it's a nice safeguard. And there's nothing 
bashisms about it.


> -	echo 'else' >> $script
> -	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
> -	echo '        SDK_PATH="`dirname $BASH_SOURCE`"' >> $script
> -	echo '    fi' >> $script

I can see potentially removing this portion, since devkit is not relocatable 
on its own w/o re-installing it in a different location. BTW, this is the only 
bash-related piece of code here, it just uses bash-specific env variable. If 
not run under bash, it will safely skip it, so it's not really a bashism.


> -	echo '    SDK_PATH=`readlink -f "$SDK_PATH"`' >> $script
> -	echo '    export SDK_PATH' >> $script
> -	echo 'fi' >> $script

And this portion is another nice safeguard - in case you install it in a 
location that is a symlink.


> +	echo 'export SDK_PATH="${SDKPATH}"' >> $script
>  	echo 'export SDK_SYS=${SDK_SYS}' >> $script
>  	echo 'export TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script
>  	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
> @@ -234,6 +224,9 @@ for env_setup_script in `ls $target_sdk_dir/environment-setup*`; do
>  	$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:g" -i $env_setup_script
>  done
>  
> +# Correct SDK_PATH since the exact installation path is now known
> +$SUDO_EXEC sed -i -e "s|export SDK_PATH\=.*|export SDK_PATH=$target_sdk_dir|g" $target_sdk_dir/environment-setup*

Why do you need this line? It's already happening anyway.

-- 
Denys

