Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11770EB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 18:02:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.114783.1692036165765225387
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 11:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xsU96/sy;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37EI2g0u007651;
	Mon, 14 Aug 2023 13:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692036162;
	bh=pPPP3DeHwsky7kUd64GHN+TkH4aVGHP4gos9Tc0uV6I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xsU96/sye1wSH3AcmWu/xGEt4mHP4iuEkbfxxNxdh0Shu8SbqOEGLDd5uwmpieUn9
	 2pkZZs6HlZuAXRBVfPfuuyLk5flzKsB82bYjDOjLGqOLhhFBPEiJE718m+6Ih7qLqV
	 1FY21ADgIJrONqIbRXz1HIFfZpj5rUtcZB+rja/Q=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37EI2ghX019085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Aug 2023 13:02:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Aug 2023 13:02:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Aug 2023 13:02:42 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37EI2f0L073561;
	Mon, 14 Aug 2023 13:02:42 -0500
Message-ID: <30dc707b-adc5-dcf8-c12f-3f80ea76b5dd@ti.com>
Date: Mon, 14 Aug 2023 13:02:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v3 1/2]
 tisdk-tiny-initramfs: Create a smaller dedicated initramfs for tiny
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230806043948.19613-1-reatmon@ti.com>
 <20230814175910.GF3359@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230814175910.GF3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Aug 2023 18:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14838



On 8/14/2023 12:59 PM, Denys Dmytriyenko wrote:
> On Sat, Aug 05, 2023 at 11:39:47PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The initramfs does not need grub-efi or the /boot directory since it
>> does not have to boot the system itself.  So create a version of the
>> tiny-image that strips those out and follow the oe-core methodology for
>> initramfs.
> 
> So, kernel.bbclass has a default weak dependency from kernel-base to
> kernel-image, which is meant to be broken/cleared if you don't need to
> pull kernel images into a rootfs.
> 
> To simplify, it looked like this some time ago:
> RDEPENDS:kernel-base ?= "kernel-image"
> 
> Well, these days it's ${KERNEL_PACKAGE_NAME}-base and
> ${KERNEL_PACKAGE_NAME}-image
> 
> So one can prevent pulling kernel images into rootfs:
> https://git.openembedded.org/openembedded-core/tree/meta/conf/machine/include/qemu.inc#n19
> 
> But, this is a kernel variable that controls how kernel packages get
> generated with their dependencies. You can modify it either in the kernel
> recipe itself, ot globally in either <machine>.conf or <distro>.conf.
> 
> We also use the same mechanism to pull in kernel-devicetree package with
> DTBs and other required FW images.
> 
> Unfortunately, that also means it cannot be adjusted on a per-image basis.
> 
> Hence, in the past we used to do exactly the same by removing /boot directory
> for a initramfs image (you don't need to create a separate class though):
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-bsp/netboot-initrd/netboot-initrd_0.0.1.bb?id=f9cf73fd8821af096fed7ad4d485af72c8ecc3ce

I thought I tried something like that... Maybe I had something else 
wrong that prevented it from working.  I'll try again.


> 
> Oh, and RDEPENDS was recently replaced with RRECOMMENDS:
> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/kernel.bbclass#n708
> 
> Supposedly, this should make the dependency even weaker and allow
> breaking it inside image recipe with BAD_RECOMMENDATIONS, but my
> quick testing didn't work for some reason...
> 
> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../classes/remove-boot-dir.bbclass           |  8 ++++++
>>   .../images/tisdk-tiny-initramfs.bb            | 26 +++++++++++++++++++
>>   .../packagegroup-arago-initramfs.bb           |  4 +++
>>   3 files changed, 38 insertions(+)
>>   create mode 100644 meta-arago-distro/classes/remove-boot-dir.bbclass
>>   create mode 100644 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
>>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
>>
>> diff --git a/meta-arago-distro/classes/remove-boot-dir.bbclass b/meta-arago-distro/classes/remove-boot-dir.bbclass
>> new file mode 100644
>> index 00000000..bd0c09fc
>> --- /dev/null
>> +++ b/meta-arago-distro/classes/remove-boot-dir.bbclass
>> @@ -0,0 +1,8 @@
>> +# Add a ROOTFS_POSTPROCESS_COMMAND that will remove some files from the
>> +# rootfs for initramfs images.
>> +
>> +ROOTFS_POSTPROCESS_COMMAND += "remove_boot_dir;"
>> +
>> +remove_boot_dir () {
>> +    rm -rf ${IMAGE_ROOTFS}/boot
>> +}
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
>> new file mode 100644
>> index 00000000..0bea8276
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = "Arago TI SDK super minimal base image for initramfs"
>> +
>> +DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
>> + bare system, this image does not package the kernel in the\
>> + standard /boot folder in rootfs. Instead, it provides a base\
>> + rootfs allowing kernel to be deployed elsewhere\
>> + (tftp/separate boot partition/jtag log etc..) and boot\
>> + the image.\
>> +"
>> +
>> +LICENSE = "MIT"
>> +
>> +inherit core-image
>> +inherit remove-boot-dir
>> +
>> +IMAGE_FEATURES:remove = "package-management"
>> +
>> +INITRAMFS_FSTYPES = "cpio cpio.xz"
>> +INITRAMFS_MAXSIZE = "65536"
>> +IMAGE_OVERHEAD_FACTOR = "1"
>> +
>> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>> +
>> +PACKAGE_INSTALL = "packagegroup-arago-initramfs"
>> +
>> +export IMAGE_BASENAME = "tisdk-tiny-initramfs"
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
>> new file mode 100644
>> index 00000000..380cc0e3
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
>> @@ -0,0 +1,4 @@
>> +
>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>> +
>> +RDEPENDS:${PN}:remove = "grub-efi kernel"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

