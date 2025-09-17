Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF86CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 18:16:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.31040.1758132994898688462
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 11:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vI8ZUq5+;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HIGXYI1574225
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 13:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758132993;
	bh=l7MlH/Y4h1L1Hm6gCUcGiRllLQ27cBuxy3ZOdzjxk5U=;
	h=Date:CC:Subject:From:To:References:In-Reply-To:List-Post;
	b=vI8ZUq5+9QviX5IHYY/aKsvJPuWXx5kr/5H9RJr+XrrRwPGJGM55fpNqe8bA7VH62
	 lFisNnmLbPoJpd7bAXxZuW7LfFDxPJ631sMwblSxkv0RERsxTd2WSH4rol6USc2rOd
	 khsf8upCIB53ySDLNcu3khrnNsiKbdSlr+dyP5yA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HIGXUi1514545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 13:16:33 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 13:16:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 13:16:31 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HIGVL63486877;
	Wed, 17 Sep 2025 13:16:31 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Sep 2025 13:16:31 -0500
Message-ID: <DCVA4Q9JGNF4.3K4FZUK1LM2ER@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <linux-patch-review@list.ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>
Subject: Re: [meta-arago] [meta-ti][PATCH 1/1 v2] recipes-ti: initramfs:
 Make minimal initrd image
From: Randolph Sapp <rs@ti.com>
To: Moteen Shah <m-shah@ti.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250904124331.1075343-1-m-shah@ti.com>
 <20250904124331.1075343-2-m-shah@ti.com>
 <20250909145655.k4vc5zinnpxxbjgl@bryanbrattlof.com>
 <DCOJZ6EILZ6E.J2M26F6BFYDL@ti.com>
 <20250910114838.62ar3wxtkmtcjfqm@bryanbrattlof.com>
 <DCPAPBQCNVXL.1R2WJFQB6JA24@ti.com>
 <20250910193206.xo3ggzq3odvfmdzw@bryanbrattlof.com>
 <4b85d4fa-e8d5-43d2-b99a-71edae8444d0@ti.com>
In-Reply-To: <4b85d4fa-e8d5-43d2-b99a-71edae8444d0@ti.com>
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16584

On Fri Sep 12, 2025 at 4:42 AM CDT, Moteen Shah wrote:
> Hey Bryan,
>
> On 11/09/25 01:02, Bryan Brattlof wrote:
>> On September 10, 2025 thus sayeth Randolph Sapp:
>>> On Wed Sep 10, 2025 at 6:48 AM CDT, Bryan Brattlof wrote:
>>>> On September  9, 2025 thus sayeth Randolph Sapp:
>>>>> On Tue Sep 9, 2025 at 9:56 AM CDT, Bryan Brattlof via lists.yoctoproj=
ect.org wrote:
>>>>>> On September  4, 2025 thus sayeth Moteen Shah:
>>>>>>> Add recipes to make initramfs image based on systemd.
>>>>>>> The image will package boot essential and other modules
>>>>>>> which will be modprobed by initramfs udev once the inbuilt
>>>>>>> drivers gets probed.
>>>>>>>
>>>>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>>>>> ---
>>>>>>>   .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
>>>>>>>   .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 ++++++++++++++=
+++++
>>>>>>>   2 files changed, 54 insertions(+)
>>>>>>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-=
ti-initramfs.bb
>>>>>>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initr=
amfs.bb
>>>>>>>
>>>>>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initr=
amfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>>>>>>> new file mode 100644
>>>>>>> index 00000000..5d2ff390
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>>>>>>> @@ -0,0 +1,5 @@
>>>>>>> +SUMMARY =3D "Minimal initramfs for boot requirements"
>>>>>>> +
>>>>>>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>>>>> +
>>>>>>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>>>>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb =
b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>>>>>>> new file mode 100644
>>>>>>> index 00000000..4cebf595
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>>>>>>> @@ -0,0 +1,49 @@
>>>>>>> +SUMMARY =3D "TI SDK super minimal base image for initramfs"
>>>>>>> +
>>>>>>> +DESCRIPTION =3D "Image meant for basic boot of linux kernel. Inten=
ded as\
>>>>>>> + bare system, this image does not package the kernel in the\
>>>>>>> + standard /boot folder in rootfs. Instead, it provides a base\
>>>>>>> + rootfs allowing kernel to be deployed elsewhere\
>>>>>>> + (tftp/separate boot partition/jtag log etc..) and boot\
>>>>>>> + the image.\
>>>>>>> +"
>>>>>>> +
>>>>>>> +LICENSE =3D "MIT"
>>>>>>> +
>>>>>>> +inherit core-image
>>>>>>> +
>>>>>>> +IMAGE_FEATURES:remove =3D "package-management"
>>>>>>> +
>>>>>>> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>>>>>>> +
>>>>>>> +#INITRAMFS_MAXSIZE =3D "65536"
>>>>>>> +#IMAGE_OVERHEAD_FACTOR =3D "1"
>>>>>>> +
>>>>>>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>>>>>>> +
>>>>>>> +INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-=
udev initramfs-module-nfsrootfs"
>>>>>>> +
>>>>>>> +MODULES =3D "\
>>>>>>> +    kernel-module-cdns-pltfrm \
>>>>>>> +    kernel-module-ti-j721e-ufs \
>>>>>>> +    kernel-module-tps6594-i2c \
>>>>>>> +"
>>>>>> Are these all the modules we'll need? Is everything else build-in th=
e
>>>>>> default defconfig? or are we expecting this list to expand as more
>>>>>> platforms start migrating to this?
>>>>>>
>>>>>> ~Bryan
>>>>> Should this instead be defined per machine with
>>>>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS?
>>>>>
>>>>> https://docs.yoctoproject.org/ref-manual/variables.html#term-MACHINE_=
ESSENTIAL_EXTRA_RDEPENDS
>>>> Yeah, I guess what I'm slowly realizing is we're adding roughly a 140M=
B
>>>> binary to the critical path for the bootloaders (so long any boot KPI)
>>>> all so we can have a PMIC driver as a builtin.
>>>>
>> Small correction. The evil vendor u-boot patches I saw we made room for
>> 140MB however building this locally just now it's closer to 70MB so half
>> as bad but still more than 3 times the size of the kernel :(
>>
>>>> All the distributions I can think of all modify the ARM64 defconfig in
>>>> some way to better suit their distribution. Yocto even has the advanta=
ge
>>>> of knowing what target they are building for. Should we instead carry =
a
>>>> fragment, or use some other mechanism, to change the kernel's config s=
o
>>>> the PMIC driver is a builtin if needed by the target?
>>>>
>>>> ~Bryan
>>> Use of conditional configs is simply reverting back to the schemes we w=
ere using
>>> 3+ years ago. Initramfs is big and slow, but it's standard and can be l=
everaged
>>> across other distros easily as it's already been a production solution =
for them
>>> for quite some time.
>>>
>>> That being said, Yocto is *unique*, and what it doesn't do weird itself=
, it
>>> leaves for the implementer to make weird in their own way. I guess it d=
oesn't
>>> really matter if we don't care about having a uniform bootflow across d=
istros,
>>> but that sounds like hell.
>>>
>> oh I agree, we can also fall back to a busybox shell if the MMC or flash
>> is corrupted. There is tons of benefit if we don't care about boot time.
>> I'm just not sure when we enable this, everyone will be happy about it
>>
>> ~Bryan
>>
>
> Size was the concern for me as well while developing this. The issue=20
> here is
> there is a lot of systemd stuff going in the background contributing to=
=20
> the size.
> If you remove systemd and use busybox instead, you will observe that the=
=20
> image
> size gets dropped to around 20 MB's. That solves our sizing issue but it=
=20
> brings on
> its own set of challenges:
>
> 1. meta-ti and meta-arago currently has a global define for init manager=
=20
> which is
> systemd, making them to support multi-config (multiple init manager)=20
> isn't that
> straight forward.
> 2. Currently, this image is being used to modprobe extra modules and=20
> down the
> line if we want to have a secure boot setup with dm-crypt, LUKS, etc to=
=20
> unlock
> encrypted rootfs, systemd's own infra might come in handy.
>
> Regards,
> Moteen

Stop blaming systemd here. It may be large, but Arch Linux can build a
compressed initial ramdisk with systemd that's only 36MB in size. Something=
 else
is bloating the image.

- Randolph

