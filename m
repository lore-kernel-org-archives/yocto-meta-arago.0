Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A277E52A77
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 17:04:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AH4c9Z015597
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 12:04:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AH4cAV025184
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 12:04:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 10 Oct 2013 12:04:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AH4cX4028257;
	Thu, 10 Oct 2013 12:04:38 -0500
Date: Thu, 10 Oct 2013 13:04:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131010170438.GC16395@edge>
References: <1380936966-1698-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380936966-1698-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Allow support for uImage and Zimage
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
X-List-Received-Date: Thu, 10 Oct 2013 17:04:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 04, 2013 at 08:36:06PM -0500, Franklin S. Cooper Jr wrote:
> * There is a possibility some SDKs will use uImage while others will use zImage.
> * Support both choices.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  lib/oesdk/bitbake-test-sdk-image |    2 +-
>  lib/oesdk/package-sdks           |   11 ++++++-----
>  lib/run-opentest                 |    4 ++--
>  3 files changed, 9 insertions(+), 8 deletions(-)
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
> index 8f4e5e2..df0ec07 100644
> --- a/lib/oesdk/package-sdks
> +++ b/lib/oesdk/package-sdks
> @@ -48,18 +48,19 @@ create_sd_card_content() {
>          rm u-boot-spl.bin-$m
>      fi
>  
> -    # For some devices the uImage  and dtb files are read from the /boot
> -    # directory of the rootfs.  In this case do not package the uImage
> +    # For some devices the uImage/zImage  and dtb files are read from the /boot
> +    # directory of the rootfs.  In this case do not package the uImage/zImage
>      # and device tree files into the boot partition as it will cause
>      # confusion.
>      if [ "$PACKAGE_BOOT_KERNEL_FILES" = "true" ]
>      then
> -        if [ -e uImage-$m.bin ]
> +        if [ -e uImage-$m.bin -o -e zImage-$m.bin ]

This is fine, but [ -e [uz]Image-$m.bin ] should also work...


>          then
> -            mv uImage-$m.bin uImage
> +            kernel_image=`ls | grep [uz]Image-$m.bin | grep -o [uz]Image`

Bash is capable of expanding regular expressions, so "ls [uz]Image-$m.bin" 
should be fine.


> +            mv [uz]Image-$m.bin $kernel_name

Hmm, here you set kernel_image variable and then use $kernel_name instead.


>          fi
>      else
> -        rm -f uImage*
> +        rm -f [uz]Image*
>          rm -f *.dtb
>      fi
>  
> diff --git a/lib/run-opentest b/lib/run-opentest
> index d3a04f3..b08f962 100644
> --- a/lib/run-opentest
> +++ b/lib/run-opentest
> @@ -170,9 +170,9 @@ run_target_side_test() {
>          return 1
>      fi
>  
> -    if [ -f $test_dir/temp/board-support/prebuilt-images/uImage-$m.bin ]
> +    if [ -f $test_dir/temp/board-support/prebuilt-images/uImage-$m.bin -o -f $test_dir/temp/board-support/prebuilt-images/zImage-$m.bin ]

Same comment as above, you can pass regexp [uz]Image to [ ] test


>      then
> -        kernel=$test_dir/temp/board-support/prebuilt-images/uImage-$m.bin
> +        kernel=$test_dir/temp/board-support/prebuilt-images/[uz]Image-$m.bin

As we found out, assigning regexp to a variable doesn't always get it 
expanded, so you may end up with [uz]Image literal in your $kernel variable - 
make sure it's being used as is later on, or you may not get the epected 
resukts...


>          if [ "$odtb" ]
>          then
>              dtb="~dtb=$test_dir/temp/board-support/prebuilt-images/$odtb"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

