Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8042CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:04:16 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.14755.1757052074948665774
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 23:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Pk0AbO0a;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5855qS2T3251648
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 00:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757051548;
	bh=J/0YQgceTW34wrNj5IrptEv6BL5Rmj8nfChHV82HPec=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Post;
	b=Pk0AbO0avUrD+v44B5O0QjlhQVh6S6nhU6nsQPIAvMDGTRMoahqlPLdyQhjp1YMQ7
	 VXkH5VfvftP6l8dlTeQEUqWKQqhaSVY2yx3J2ajuT3OO6hiWmHZrNdRn00IwYTy3Q8
	 nv6QUO92ybJ2LhPqSUpL3I5+7sbe5iDTqkGoWz44=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5855qSNR1421589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 00:52:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 00:52:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 00:52:27 -0500
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5855qPUW4167015;
	Fri, 5 Sep 2025 00:52:26 -0500
MIME-Version: 1.0
Date: Fri, 5 Sep 2025 11:22:25 +0530
Message-ID: <DCKMSGS4WSZR.69K87H2EW2IU@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: Moteen Shah <m-shah@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-patch-review@list.ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>
Subject: Re: [meta-ti][PATCH 1/1 v2] recipes-ti: initramfs: Make minimal initrd image
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250904124331.1075343-1-m-shah@ti.com>
 <20250904124331.1075343-2-m-shah@ti.com>
In-Reply-To: <20250904124331.1075343-2-m-shah@ti.com>
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 12:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16532

Hi Moteen,

On Thu Sep 4, 2025 at 6:13 PM IST, Moteen Shah wrote:
> Add recipes to make initramfs image based on systemd.
> The image will package boot essential and other modules
> which will be modprobed by initramfs udev once the inbuilt
> drivers gets probed.
>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
>  .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-init=
ramfs.bb
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.b=
b b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
> new file mode 100644
> index 00000000..5d2ff390
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
> @@ -0,0 +1,5 @@
> +SUMMARY =3D "Minimal initramfs for boot requirements"
> +
> +require recipes-core/packagegroups/packagegroup-core-boot.bb
> +
> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb b/meta=
-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
> new file mode 100644
> index 00000000..4cebf595
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
> @@ -0,0 +1,49 @@
> +SUMMARY =3D "TI SDK super minimal base image for initramfs"
> +
> +DESCRIPTION =3D "Image meant for basic boot of linux kernel. Intended as=
\
> + bare system, this image does not package the kernel in the\
> + standard /boot folder in rootfs. Instead, it provides a base\
> + rootfs allowing kernel to be deployed elsewhere\
> + (tftp/separate boot partition/jtag log etc..) and boot\
> + the image.\
> +"
> +
> +LICENSE =3D "MIT"
> +
> +inherit core-image
> +
> +IMAGE_FEATURES:remove =3D "package-management"
> +
> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
> +
> +#INITRAMFS_MAXSIZE =3D "65536"
> +#IMAGE_OVERHEAD_FACTOR =3D "1"
> +

Why are these two commented out?

Regards,
Anshul

