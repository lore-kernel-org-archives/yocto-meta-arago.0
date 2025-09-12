Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2473CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 09:42:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.12616.1757670134792361753
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 02:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T8ZqjKQm;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9gEbL494759
	for <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 04:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670134;
	bh=3kQP0tzRiBMVPnbJ8BNOdE0anau/Ey0+bKAs2/Wbyws=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Post;
	b=T8ZqjKQm8+zuIeRU8BDzol8kd6RIWFXiNK1SWskv3xQYMF/qCx9mE/I+dD/3lxepA
	 /Fv8Q4eQPKiyJTKJ4g1R5koBB4l211VGzZ+oO4Hqb4zrhxW4gJeA3ewnQquea1xhzv
	 YOG2TPfyXswAtSAw2jeNqqkEOK1ChmTueoWY950Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9gEHn1890722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 04:42:14 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:42:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:42:11 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9g80x3709251;
	Fri, 12 Sep 2025 04:42:08 -0500
Message-ID: <4b85d4fa-e8d5-43d2-b99a-71edae8444d0@ti.com>
Date: Fri, 12 Sep 2025 15:12:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [meta-ti][PATCH 1/1 v2] recipes-ti: initramfs: Make
 minimal initrd image
To: Bryan Brattlof <bb@ti.com>, Randolph Sapp <rs@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <linux-patch-review@list.ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>
References: <20250904124331.1075343-1-m-shah@ti.com>
 <20250904124331.1075343-2-m-shah@ti.com>
 <20250909145655.k4vc5zinnpxxbjgl@bryanbrattlof.com>
 <DCOJZ6EILZ6E.J2M26F6BFYDL@ti.com>
 <20250910114838.62ar3wxtkmtcjfqm@bryanbrattlof.com>
 <DCPAPBQCNVXL.1R2WJFQB6JA24@ti.com>
 <20250910193206.xo3ggzq3odvfmdzw@bryanbrattlof.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20250910193206.xo3ggzq3odvfmdzw@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16574

Hey Bryan,

On 11/09/25 01:02, Bryan Brattlof wrote:
> On September 10, 2025 thus sayeth Randolph Sapp:
>> On Wed Sep 10, 2025 at 6:48 AM CDT, Bryan Brattlof wrote:
>>> On September  9, 2025 thus sayeth Randolph Sapp:
>>>> On Tue Sep 9, 2025 at 9:56 AM CDT, Bryan Brattlof via lists.yoctoproject.org wrote:
>>>>> On September  4, 2025 thus sayeth Moteen Shah:
>>>>>> Add recipes to make initramfs image based on systemd.
>>>>>> The image will package boot essential and other modules
>>>>>> which will be modprobed by initramfs udev once the inbuilt
>>>>>> drivers gets probed.
>>>>>>
>>>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>>>> ---
>>>>>>   .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
>>>>>>   .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 +++++++++++++++++++
>>>>>>   2 files changed, 54 insertions(+)
>>>>>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>>>>>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>>>>>> new file mode 100644
>>>>>> index 00000000..5d2ff390
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
>>>>>> @@ -0,0 +1,5 @@
>>>>>> +SUMMARY = "Minimal initramfs for boot requirements"
>>>>>> +
>>>>>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>>>> +
>>>>>> +RDEPENDS:${PN}:remove = "grub-efi kernel"
>>>>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>>>>>> new file mode 100644
>>>>>> index 00000000..4cebf595
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
>>>>>> @@ -0,0 +1,49 @@
>>>>>> +SUMMARY = "TI SDK super minimal base image for initramfs"
>>>>>> +
>>>>>> +DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
>>>>>> + bare system, this image does not package the kernel in the\
>>>>>> + standard /boot folder in rootfs. Instead, it provides a base\
>>>>>> + rootfs allowing kernel to be deployed elsewhere\
>>>>>> + (tftp/separate boot partition/jtag log etc..) and boot\
>>>>>> + the image.\
>>>>>> +"
>>>>>> +
>>>>>> +LICENSE = "MIT"
>>>>>> +
>>>>>> +inherit core-image
>>>>>> +
>>>>>> +IMAGE_FEATURES:remove = "package-management"
>>>>>> +
>>>>>> +INITRAMFS_FSTYPES = "cpio cpio.xz"
>>>>>> +
>>>>>> +#INITRAMFS_MAXSIZE = "65536"
>>>>>> +#IMAGE_OVERHEAD_FACTOR = "1"
>>>>>> +
>>>>>> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>>>>>> +
>>>>>> +INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev initramfs-module-nfsrootfs"
>>>>>> +
>>>>>> +MODULES = "\
>>>>>> +    kernel-module-cdns-pltfrm \
>>>>>> +    kernel-module-ti-j721e-ufs \
>>>>>> +    kernel-module-tps6594-i2c \
>>>>>> +"
>>>>> Are these all the modules we'll need? Is everything else build-in the
>>>>> default defconfig? or are we expecting this list to expand as more
>>>>> platforms start migrating to this?
>>>>>
>>>>> ~Bryan
>>>> Should this instead be defined per machine with
>>>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS?
>>>>
>>>> https://docs.yoctoproject.org/ref-manual/variables.html#term-MACHINE_ESSENTIAL_EXTRA_RDEPENDS
>>> Yeah, I guess what I'm slowly realizing is we're adding roughly a 140MB
>>> binary to the critical path for the bootloaders (so long any boot KPI)
>>> all so we can have a PMIC driver as a builtin.
>>>
> Small correction. The evil vendor u-boot patches I saw we made room for
> 140MB however building this locally just now it's closer to 70MB so half
> as bad but still more than 3 times the size of the kernel :(
>
>>> All the distributions I can think of all modify the ARM64 defconfig in
>>> some way to better suit their distribution. Yocto even has the advantage
>>> of knowing what target they are building for. Should we instead carry a
>>> fragment, or use some other mechanism, to change the kernel's config so
>>> the PMIC driver is a builtin if needed by the target?
>>>
>>> ~Bryan
>> Use of conditional configs is simply reverting back to the schemes we were using
>> 3+ years ago. Initramfs is big and slow, but it's standard and can be leveraged
>> across other distros easily as it's already been a production solution for them
>> for quite some time.
>>
>> That being said, Yocto is *unique*, and what it doesn't do weird itself, it
>> leaves for the implementer to make weird in their own way. I guess it doesn't
>> really matter if we don't care about having a uniform bootflow across distros,
>> but that sounds like hell.
>>
> oh I agree, we can also fall back to a busybox shell if the MMC or flash
> is corrupted. There is tons of benefit if we don't care about boot time.
> I'm just not sure when we enable this, everyone will be happy about it
>
> ~Bryan
>

Size was the concern for me as well while developing this. The issue 
here is
there is a lot of systemd stuff going in the background contributing to 
the size.
If you remove systemd and use busybox instead, you will observe that the 
image
size gets dropped to around 20 MB's. That solves our sizing issue but it 
brings on
its own set of challenges:

1. meta-ti and meta-arago currently has a global define for init manager 
which is
systemd, making them to support multi-config (multiple init manager) 
isn't that
straight forward.
2. Currently, this image is being used to modprobe extra modules and 
down the
line if we want to have a secure boot setup with dm-crypt, LUKS, etc to 
unlock
encrypted rootfs, systemd's own infra might come in handy.

Regards,
Moteen


