Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 306DF52961
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2013 18:46:05 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKP0012203VEFA0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 03 Apr 2013 13:45:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AA5852018B; Wed,
	03 Apr 2013 14:45:29 -0400 (EDT)
Date: Wed, 03 Apr 2013 14:45:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130403184529.GD31233@denix.org>
References: <1365007669-12577-1-git-send-email-Chase.Maupin@ti.com>
	<1365007669-12577-4-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1365007669-12577-4-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 4/5] tisdk-readme: add README file to prebuilt images directory
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
X-List-Received-Date: Wed, 03 Apr 2013 18:46:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 03, 2013 at 11:47:48AM -0500, Chase Maupin wrote:
> * In the SDK prebuilt-images directory add a README file that
>   details where the images belong on the SD card.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../tisdk-uenv.bb => tisdk-readme/tisdk-readme.bb} |    6 ++--
>  .../recipes-tisdk/tisdk-readme/tisdk-readme/README |   21 ++++++++++++++++++++
>  2 files changed, 24 insertions(+), 3 deletions(-)
>  copy meta-arago-distro/recipes-tisdk/{tisdk-uenv/tisdk-uenv.bb => tisdk-readme/tisdk-readme.bb} (61%)
>  create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> similarity index 61%
> copy from meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
> copy to meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> index e67ea97..6fdcaff 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
> @@ -1,9 +1,9 @@
> -DESCRIPTION = "Package that will install a uEnv.txt file into the SDK prebuilt-binaries directory"
> +DESCRIPTION = "Package that will install a README file into the SDK prebuilt-binaries directory"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  
>  SRC_URI = "\
> -    file://uEnv.txt \
> +    file://README \
>  "
>  
>  PR = "r0"
> @@ -16,7 +16,7 @@ S = "${WORKDIR}"
>  do_install () {
>      install -d ${D}/board-support/prebuilt-images
>  
> -    install -m 0644 ${S}/uEnv.txt ${D}/board-support/prebuilt-images/
> +    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
>  }
>  
>  FILES_${PN} += "board-support/*"
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
> new file mode 100644
> index 0000000..1537fef
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README
> @@ -0,0 +1,21 @@
> +The files contained in this directory represent the images that were built
> +as part of the original SDK build and packaging process.  They are meant
> +to serve as a restore and starting point for your development.  In order
> +to use these images with an SD card they should be placed in the appropriate
> +locations.
> +
> +By default these locations are:
> +
> +================================================================================|       FILE       |                  LOCATION                                 |

I think something got corrupted here.


> +================================================================================
> +|    MLO           | boot partition
> +|    u-boot.img    | boot partition
> +|    uEnv.txt      | boot partition
> +|    uImage        | /boot directory of the rootfs partition
> +|    *.dtb         | /boot directory of the rootfs partition
> +================================================================================
> +
> +By default the boot loaders are read from the first FAT partition, which is
> +usually called the "boot" partition.  Then the bootloader will look for the
> +uImage and DTB files in the /boot directory of the EXT partition, which is
> +usually called the "rootfs" partition.
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

