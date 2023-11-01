Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBD8C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 13:38:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7351.1698845914259525249
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 06:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n5GLc2oW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A1DcXdN108146;
	Wed, 1 Nov 2023 08:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698845913;
	bh=3gvDgoanuavI7b9xSls7y5H5ef+LalE9mz7crzidc8A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n5GLc2oWFF5Gm1EYP5CHKO4ul162JsEEJlFK9iwAki28bfnRTm/P9APZqqSEbxYsL
	 qiv1wP3jVHAeD40TESUuOM7wu6TAjtrEc6Bux105GXS4suUkYprQWgcEKue0kULqOD
	 jiPWz+sb+H5K9dQmjEWRNPwKfza59V3TU0W9QzAw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A1DcXK7006439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Nov 2023 08:38:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 Nov 2023 08:38:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 Nov 2023 08:38:33 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A1DcXCS069926;
	Wed, 1 Nov 2023 08:38:33 -0500
Message-ID: <1235f399-9ab4-42b3-ba22-e030867c273c@ti.com>
Date: Wed, 1 Nov 2023 08:38:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH]
 packagegroup-arago-initramfs: Add e2fsprogs-mke2fs and dosfstools
Content-Language: en-US
To: <sabiya.d@mistralsolutions.com>, <meta-arago@lists.yoctoproject.org>
CC: Dasnavis Sabiya <sabiya.d@ti.com>
References: <20231101092855.101794-1-sabiya.d@ti.com>
 <20231101092855.101794-2-sabiya.d@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231101092855.101794-2-sabiya.d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Nov 2023 13:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14986



On 11/1/2023 4:28 AM, sabiya.d@mistralsolutions.com wrote:
> From: Dasnavis Sabiya <sabiya.d@ti.com>
> 
> Add e2fsprogs-mke2fs and dosfstools for mkfs.ext4 and mkfs.vfat


Right now the only image that is using this package group is the tiny 
image.  And part of the goal of the tiny image is to remain as small as 
possible.

The intent of the tiny image is to support the initial wakeup efforts. 
During this time the various hardware settings are not fully known and 
so external memory and other things do not work.  The initramfs is meant 
to provide the bare minimal OS needed to fit into the on-chip SRAM to 
figure out those settings.  Once those settings are figured out, we 
never go back to the tiny image.

So what is the need for the mkfs tools in the tiny image?  Why not use a 
bigger image that has these tools in it?



> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-initramfs.bb        | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
> index 380cc0e3..10412784 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
> @@ -1,4 +1,13 @@
>   
>   require recipes-core/packagegroups/packagegroup-core-boot.bb
>   
> +ARAGO_FSTOOLS = "\
> +    e2fsprogs-mke2fs \
> +    dosfstools \
> +    "
> +
>   RDEPENDS:${PN}:remove = "grub-efi kernel"
> +
> +RDEPENDS:${PN}:append = "\
> +    ${ARAGO_FSTOOLS} \
> +    "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

