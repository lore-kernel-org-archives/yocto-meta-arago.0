Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id BB82E52A78
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 06:31:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MD300JD3U47K741@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 07 Nov 2012 00:31:34 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E025B200BE; Wed,
	07 Nov 2012 01:31:18 -0500 (EST)
Date: Wed, 07 Nov 2012 01:31:18 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Denys Dmytriyenko <denys@ti.com>
Message-id: <20121107063118.GB29763@denix.org>
References: <1352269511-5899-1-git-send-email-denys@ti.com>
MIME-version: 1.0
In-reply-to: <1352269511-5899-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] meta-toolchain-arago: make SDK/devkit relocatable
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
X-List-Received-Date: Wed, 07 Nov 2012 06:31:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 07, 2012 at 01:25:11AM -0500, Denys Dmytriyenko wrote:
> Implement poor man's relocation technique for self-contained crosssdk binaries
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index d2fe982..27782f7 100644
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
> @@ -54,4 +55,5 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH/usr/share/aclocal"' >> $script
>  	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
> +	echo 'for i in `cd $SDK_PATH/bin; find -L ! -name "$TARGET_SYS-*" -type f -perm +111 -exec file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`; do alias $i="$SDK_PATH/lib/ld-linux.so.2 $SDK_PATH/bin/$i"; done' >> $script

^^^^^^^^^^^^^^^^^^^^
Yep, that's pretty much it - several days of debugging, reseach and testing 
and the result is a one-liner script-fu...

-- 
Denys

