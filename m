Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022BFEB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:59:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.114707.1692035956262045817
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 10:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE47140C98;
	Mon, 14 Aug 2023 17:59:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlUR3-0clL8e; Mon, 14 Aug 2023 17:59:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A620140C93;
	Mon, 14 Aug 2023 17:59:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E65E4163C58; Mon, 14 Aug 2023 13:59:10 -0400 (EDT)
Date: Mon, 14 Aug 2023 13:59:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v3 1/2]
 tisdk-tiny-initramfs: Create a smaller dedicated initramfs for tiny
Message-ID: <20230814175910.GF3359@denix.org>
References: <20230806043948.19613-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230806043948.19613-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Aug 2023 17:59:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14837

On Sat, Aug 05, 2023 at 11:39:47PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The initramfs does not need grub-efi or the /boot directory since it
> does not have to boot the system itself.  So create a version of the
> tiny-image that strips those out and follow the oe-core methodology for
> initramfs.

So, kernel.bbclass has a default weak dependency from kernel-base to 
kernel-image, which is meant to be broken/cleared if you don't need to 
pull kernel images into a rootfs.

To simplify, it looked like this some time ago:
RDEPENDS:kernel-base ?= "kernel-image"

Well, these days it's ${KERNEL_PACKAGE_NAME}-base and 
${KERNEL_PACKAGE_NAME}-image

So one can prevent pulling kernel images into rootfs:
https://git.openembedded.org/openembedded-core/tree/meta/conf/machine/include/qemu.inc#n19

But, this is a kernel variable that controls how kernel packages get 
generated with their dependencies. You can modify it either in the kernel 
recipe itself, ot globally in either <machine>.conf or <distro>.conf.

We also use the same mechanism to pull in kernel-devicetree package with 
DTBs and other required FW images.

Unfortunately, that also means it cannot be adjusted on a per-image basis.

Hence, in the past we used to do exactly the same by removing /boot directory 
for a initramfs image (you don't need to create a separate class though):
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb?id=f9cf73fd8821af096fed7ad4d485af72c8ecc3ce


Oh, and RDEPENDS was recently replaced with RRECOMMENDS:
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/kernel.bbclass#n708

Supposedly, this should make the dependency even weaker and allow 
breaking it inside image recipe with BAD_RECOMMENDATIONS, but my 
quick testing didn't work for some reason...


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../classes/remove-boot-dir.bbclass           |  8 ++++++
>  .../images/tisdk-tiny-initramfs.bb            | 26 +++++++++++++++++++
>  .../packagegroup-arago-initramfs.bb           |  4 +++
>  3 files changed, 38 insertions(+)
>  create mode 100644 meta-arago-distro/classes/remove-boot-dir.bbclass
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
> 
> diff --git a/meta-arago-distro/classes/remove-boot-dir.bbclass b/meta-arago-distro/classes/remove-boot-dir.bbclass
> new file mode 100644
> index 00000000..bd0c09fc
> --- /dev/null
> +++ b/meta-arago-distro/classes/remove-boot-dir.bbclass
> @@ -0,0 +1,8 @@
> +# Add a ROOTFS_POSTPROCESS_COMMAND that will remove some files from the
> +# rootfs for initramfs images.
> +
> +ROOTFS_POSTPROCESS_COMMAND += "remove_boot_dir;"
> +
> +remove_boot_dir () {
> +    rm -rf ${IMAGE_ROOTFS}/boot
> +}
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
> new file mode 100644
> index 00000000..0bea8276
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Arago TI SDK super minimal base image for initramfs"
> +
> +DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
> + bare system, this image does not package the kernel in the\
> + standard /boot folder in rootfs. Instead, it provides a base\
> + rootfs allowing kernel to be deployed elsewhere\
> + (tftp/separate boot partition/jtag log etc..) and boot\
> + the image.\
> +"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> +inherit remove-boot-dir
> +
> +IMAGE_FEATURES:remove = "package-management"
> +
> +INITRAMFS_FSTYPES = "cpio cpio.xz"
> +INITRAMFS_MAXSIZE = "65536"
> +IMAGE_OVERHEAD_FACTOR = "1"
> +
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +
> +PACKAGE_INSTALL = "packagegroup-arago-initramfs"
> +
> +export IMAGE_BASENAME = "tisdk-tiny-initramfs"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
> new file mode 100644
> index 00000000..380cc0e3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
> @@ -0,0 +1,4 @@
> +
> +require recipes-core/packagegroups/packagegroup-core-boot.bb
> +
> +RDEPENDS:${PN}:remove = "grub-efi kernel"
> -- 
> 2.17.1

