Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 4C91B5208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 23:20:36 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MDE00M25E65KKR0@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 12 Nov 2012 17:20:30 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B31F3200E5; Mon,
	12 Nov 2012 18:20:29 -0500 (EST)
Date: Mon, 12 Nov 2012 18:20:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121112232029.GB8900@denix.org>
References: <1352759598-5183-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1352759598-5183-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH] meta-toolchain-arago: de-bashify
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
X-List-Received-Date: Mon, 12 Nov 2012 23:20:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Nov 12, 2012 at 04:33:18PM -0600, Franklin S. Cooper Jr wrote:
> * Replacing "echo -e" with "printf".
> * This mimics a previous de-bashify patch applied to this same recipe.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>

How is it different from this:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7f47dbad47a44c8d16c12139260a00b80d603e71

I'd suggest you update your tree to the latest code base...

> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |   20 ++++++++++----------
>  1 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 09996d6..3d3fb0d 100644
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
> @@ -54,15 +54,15 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
>  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
> -    echo -e 'export CPP="\x24{TARGET_PREFIX}gcc -E"' >> $script
> -    echo -e 'export NM=\x24{TARGET_PREFIX}nm' >> $script
> -    echo -e 'export RANLIB=\x24{TARGET_PREFIX}ranlib' >> $script
> -    echo -e 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy' >> $script
> -    echo -e 'export STRIP=\x24{TARGET_PREFIX}strip' >> $script
> -    echo -e 'export AS=\x24{TARGET_PREFIX}as' >> $script
> -    echo -e 'export AR=\x24{TARGET_PREFIX}ar' >> $script
> -    echo -e 'export OBJDUMP=\x24{TARGET_PREFIX}objdump' >> $script
> -    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
> +	printf 'export CPP="\x24{TARGET_PREFIX}gcc -E"\n' >> $script
> +	printf 'export NM=\x24{TARGET_PREFIX}nm\n' >> $script
> +	printf 'export RANLIB=\x24{TARGET_PREFIX}ranlib\n' >> $script
> +	printf 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy\n' >> $script
> +	printf 'export STRIP=\x24{TARGET_PREFIX}strip\n' >> $script
> +	printf 'export AS=\x24{TARGET_PREFIX}as\n' >> $script
> +	printf 'export AR=\x24{TARGET_PREFIX}ar\n' >> $script
> +	printf 'export OBJDUMP=\x24{TARGET_PREFIX}objdump\n' >> $script
> +	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
>  }
>  
>  populate_sdk_ipk_append () {
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

