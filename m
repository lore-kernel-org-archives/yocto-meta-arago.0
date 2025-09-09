Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F26FCAC582
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 20:30:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.860.1757449850034691775
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 13:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jiWZ7f4M;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589KUnWe4104563
	for <meta-arago@lists.yoctoproject.org>; Tue, 9 Sep 2025 15:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757449849;
	bh=Y1bffd5NF10rI/NhuPmOHLdprCvtfn3wa7KBnFtaxIs=;
	h=Date:CC:Subject:From:To:References:In-Reply-To:List-Post;
	b=jiWZ7f4MFZI7Db1PMKh1p1t5+ViK0zBz8xOC/5OQpyJmRO6M028ppIm5Z9HHjfwAk
	 SEpi0yAWKXaJ8Kx0xfignnU7uM8HuSNNv0zp8ejg+Rt+OeIDF0xd9flnzAJHEkXqdi
	 odL2VKcjJRAz7Ohb/O4IOMWR6j9Ao2+iq6wA+Y+Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589KUnMh3961063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 9 Sep 2025 15:30:49 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 15:30:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Sep 2025 15:30:48 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589KUlkp3277866;
	Tue, 9 Sep 2025 15:30:47 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 9 Sep 2025 15:30:47 -0500
Message-ID: <DCOJZ6EILZ6E.J2M26F6BFYDL@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <linux-patch-review@list.ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>
Subject: Re: [meta-arago] [meta-ti][PATCH 1/1 v2] recipes-ti: initramfs:
 Make minimal initrd image
From: Randolph Sapp <rs@ti.com>
To: <bb@ti.com>, Moteen Shah <m-shah@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250904124331.1075343-1-m-shah@ti.com>
 <20250904124331.1075343-2-m-shah@ti.com>
 <20250909145655.k4vc5zinnpxxbjgl@bryanbrattlof.com>
In-Reply-To: <20250909145655.k4vc5zinnpxxbjgl@bryanbrattlof.com>
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Sep 2025 20:30:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16555

On Tue Sep 9, 2025 at 9:56 AM CDT, Bryan Brattlof via lists.yoctoproject.or=
g wrote:
> On September  4, 2025 thus sayeth Moteen Shah:
>> Add recipes to make initramfs image based on systemd.
>> The image will package boot essential and other modules
>> which will be modprobed by initramfs udev once the inbuilt
>> drivers gets probed.
>>=20
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>>  .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
>>  .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 +++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-ini=
tramfs.bb
>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.b=
b
>>=20
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.=
bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>> new file mode 100644
>> index 00000000..5d2ff390
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>> @@ -0,0 +1,5 @@
>> +SUMMARY =3D "Minimal initramfs for boot requirements"
>> +
>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>> +
>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb b/met=
a-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>> new file mode 100644
>> index 00000000..4cebf595
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>> @@ -0,0 +1,49 @@
>> +SUMMARY =3D "TI SDK super minimal base image for initramfs"
>> +
>> +DESCRIPTION =3D "Image meant for basic boot of linux kernel. Intended a=
s\
>> + bare system, this image does not package the kernel in the\
>> + standard /boot folder in rootfs. Instead, it provides a base\
>> + rootfs allowing kernel to be deployed elsewhere\
>> + (tftp/separate boot partition/jtag log etc..) and boot\
>> + the image.\
>> +"
>> +
>> +LICENSE =3D "MIT"
>> +
>> +inherit core-image
>> +
>> +IMAGE_FEATURES:remove =3D "package-management"
>> +
>> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>> +
>> +#INITRAMFS_MAXSIZE =3D "65536"
>> +#IMAGE_OVERHEAD_FACTOR =3D "1"
>> +
>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>> +
>> +INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-udev =
initramfs-module-nfsrootfs"
>> +
>> +MODULES =3D "\
>> +    kernel-module-cdns-pltfrm \
>> +    kernel-module-ti-j721e-ufs \
>> +    kernel-module-tps6594-i2c \
>> +"
>
> Are these all the modules we'll need? Is everything else build-in the=20
> default defconfig? or are we expecting this list to expand as more=20
> platforms start migrating to this?
>
> ~Bryan

Should this instead be defined per machine with
MACHINE_ESSENTIAL_EXTRA_RDEPENDS?

https://docs.yoctoproject.org/ref-manual/variables.html#term-MACHINE_ESSENT=
IAL_EXTRA_RDEPENDS

