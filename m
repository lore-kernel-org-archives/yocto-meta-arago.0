Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DDF6452990
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2013 22:48:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8UMmnPS026227
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:48:49 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMmn5g027335
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2013 17:48:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 30 Sep 2013 17:48:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8UMmmxQ010058;
	Mon, 30 Sep 2013 17:48:48 -0500
Date: Mon, 30 Sep 2013 18:48:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130930224847.GM24472@edge>
References: <1380583168-2238-1-git-send-email-fcooper@ti.com>
	<1380583168-2238-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380583168-2238-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] meta-toolchain-arago: Remove TARGET_SYS env variable
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
X-List-Received-Date: Mon, 30 Sep 2013 22:48:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 30, 2013 at 06:19:28PM -0500, Franklin S. Cooper Jr wrote:
> * Within environment-setup the TARGET_SYS variable is exported but used
>   improperly.
> * The value for --target and --host isn't the TARGET_SYS value within the
>   environment-setup file but rather the OE variable TARGET_SYS.
> * Cross compiling autotools based applications using environment-setup
>   results in host and machine not recognized "configure" errors.

Good catch. But I would like to keep TARGET_SYS env, maybe name it 
differently, instead of hardcoding REAL_MULTIMACH_TARGET_SYS in multiple 
places. Actually, why not re-use that long name for the variable?

And for autotools configure flags, we should pass ${TARGET_SYS} instead of 
$TARGET_SYS - like in your patch.

See my comments below for what I'm thinking.


> * Looking at toolchain-scripts.bbclass it looks like that variable has been
>   removed from environment-setup so mimic that change.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index a8da4dc..2ab3b8d 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -30,17 +30,16 @@ toolchain_create_sdk_env_script () {
>  	echo '    export SDK_PATH' >> $script
>  	echo 'fi' >> $script
>  	echo 'export SDK_SYS=${SDK_SYS}' >> $script
> -	echo 'export TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script

Don't remove, but change the var name:
	echo 'export REAL_MULTIMACH_TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >> $script


>  	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
>  	echo 'export TOOLCHAIN_PREFIX=$TOOLCHAIN_SYS-' >> $script
>  	echo 'export SDK_PATH_NATIVE=$SDK_PATH/sysroots/$SDK_SYS' >> $script
> -	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$TARGET_SYS' >> $script
> +	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/${REAL_MULTIMACH_TARGET_SYS}' >> $script

Replace with this:
	echo 'export SDK_PATH_TARGET=$SDK_PATH/sysroots/$REAL_MULTIMACH_TARGET_SYS' >> $script


>  	echo 'export PATH=$SDK_PATH_NATIVE${bindir_nativesdk}:$PATH' >> $script
>  	echo 'export CPATH=$SDK_PATH_TARGET/usr/include:$CPATH' >> $script
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDK_PATH_TARGET' >> $script
>  	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig' >> $script
>  	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
> -	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$TARGET_SYS' >> $script
> +	echo 'export CONFIG_SITE=$SDK_PATH/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script

Replace with this:
	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script


>  	printf 'export CC=\x24{TOOLCHAIN_PREFIX}gcc\n' >> $script
>  	printf 'export CXX=\x24{TOOLCHAIN_PREFIX}g++\n' >> $script
>  	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
> @@ -52,7 +51,7 @@ toolchain_create_sdk_env_script () {
>  	printf 'export OBJCOPY=\x24{TOOLCHAIN_PREFIX}objcopy\n' >> $script
>  	printf 'export OBJDUMP=\x24{TOOLCHAIN_PREFIX}objdump\n' >> $script
>  	printf 'export STRIP=\x24{TOOLCHAIN_PREFIX}strip\n' >> $script
> -	echo 'export CONFIGURE_FLAGS="--target=$TARGET_SYS --host=$TARGET_SYS --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' >> $script
> +	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=$SDK_PATH_TARGET"' >> $script

Keep this change the same.


>  	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=$SDK_PATH_TARGET"' >> $script
>  	echo 'export CFLAGS="$CPPFLAGS"' >> $script
>  	echo 'export CXXFLAGS="$CPPFLAGS"' >> $script
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

