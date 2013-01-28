Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id C646652A5D
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:35:37 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHC000Q0JIX4681@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 28 Jan 2013 11:35:22 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4E7BD201D8; Mon,
	28 Jan 2013 12:35:20 -0500 (EST)
Date: Mon, 28 Jan 2013 12:35:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: fcooperjr27@gmail.com
Message-id: <20130128173520.GA8971@denix.org>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
	<1359393932-31361-31-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1359393932-31361-31-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 31/32] meta-toolchain-arago: Remove remaining .la files
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
X-List-Received-Date: Mon, 28 Jan 2013 17:35:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 28, 2013 at 11:25:31AM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * The following .la files were not deleted from the toolchain sdk:
>     libgfortranbegin.la
>     /arago-2012.12/lib/gcc/arm-arago-linux-gnueabi/4.5.3
> 
>     libbfd.la
>     /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib
> 
>     libopcodes.la
>     /arago-2012.12/i686-linux/arm-arago-linux-gnueabi/lib
> 
> * Updating the path that find is using to insure all .la files are deleted
>   from the toolchain sdk.

What was the problem with those .la files? They are part of host-side binutils 
and gcc, so weren't supposed to be used for any SDK cross-compiling...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 332fe48..7428001 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r14"
> +PR = "r15"
>  
>  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
>  
> @@ -84,7 +84,7 @@ populate_sdk_ipk_append () {
>  	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', '', 'create_shell_stub ${TARGET_PREFIX}gdb yes', d)}
>  
>  	# Remove broken .la files
> -	for i in `find ${SDK_OUTPUT}/${SDKTARGETSYSROOT} -name \*.la`; do
> +	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
>  		rm -f $i
>  	done
>  	rm -f ${SDK_OUTPUT}/${SDKPATH}/lib/*.la
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

