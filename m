Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8093D529BD
	for <meta-arago@arago-project.org>;
	Wed, 16 Oct 2013 02:06:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9G26hs1010079
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 21:06:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9G26h5j011927
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 21:06:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 15 Oct 2013 21:06:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9G26hZD020923;
	Tue, 15 Oct 2013 21:06:43 -0500
Date: Tue, 15 Oct 2013 22:06:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131016020642.GA27524@edge>
References: <1381445101-27904-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1381445101-27904-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH v2] tisdk-build-scripts: Allow support for uImage and zImage
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
X-List-Received-Date: Wed, 16 Oct 2013 02:06:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 10, 2013 at 05:45:01PM -0500, Franklin S. Cooper Jr wrote:
> * There is a possibility some SDKs will use uImage while others will use
>   zImage.
> * Support both choices.
> 
> Version 2 changes:
> * Rebase and drop 1 out of the 3 changes that were already in mainline.
> * Simplify if statement conditional.
> * Use Bash's regular expression expansion capability.
> * Fix inconsistent variable name usage.

Seems reasonable. Haven't tried it myself yet...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  lib/oesdk/bitbake-test-sdk-image |    2 +-
>  lib/oesdk/package-sdks           |   15 ++++++++-------
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
> index 9122d89..7baa106 100644
> --- a/lib/oesdk/bitbake-test-sdk-image
> +++ b/lib/oesdk/bitbake-test-sdk-image
> @@ -174,7 +174,7 @@ extract_sdk_image() {
>          cp $sdk_path/$filesys $test_dir/temp/filesystem
>  
>          # Find the kernel image
> -        kernel=`find ./$sdk_path -name "uImage-$m.bin" | xargs basename`
> +        kernel=`find ./$sdk_path -name "[uz]Image-$m.bin" | xargs basename`
>          # This is a critical failure and will not be able to be skipped
>          if [ -z "$kernel" ]
>          then
> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
> index 8f4e5e2..d6b01f7 100644
> --- a/lib/oesdk/package-sdks
> +++ b/lib/oesdk/package-sdks
> @@ -48,18 +48,19 @@ create_sd_card_content() {
>          rm u-boot-spl.bin-$m
>      fi
>  
> -    # For some devices the uImage  and dtb files are read from the /boot
> -    # directory of the rootfs.  In this case do not package the uImage
> -    # and device tree files into the boot partition as it will cause
> -    # confusion.
> +    # For some devices the uImage/zImage and dtb files are read
> +    # from the /boot directory of the rootfs. In this case do
> +    # not package the uImage/zImage and device tree files into
> +    # the boot partition as it will cause confusion.
>      if [ "$PACKAGE_BOOT_KERNEL_FILES" = "true" ]
>      then
> -        if [ -e uImage-$m.bin ]
> +        if [ -e [uz]Image-$m.bin ]
>          then
> -            mv uImage-$m.bin uImage
> +            kernel_image=`ls [uz]Image-$m.bin | grep -o [uz]Image`
> +            mv [uz]Image-$m.bin $kernel_image
>          fi
>      else
> -        rm -f uImage*
> +        rm -f [uz]Image*
>          rm -f *.dtb
>      fi
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

