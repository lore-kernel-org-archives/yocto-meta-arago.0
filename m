Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F340C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 22:16:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.24633.1737670590391927139
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 14:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NP9DOI/s;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NMGSHF1272101
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 16:16:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737670588;
	bh=F6x4/kesSRTdxIyynki5ZXak9wU3wD+IbpynNjwfxwc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NP9DOI/siuId6hpVqulfkid6ttAVWpeU0p+SlieA4MJ7orQ1MdTH1uNPWEzitrvMN
	 2LIMpIuXupJe54mVmT7xomnAWmyJYGSqx/0d5H3pyUte1Q9j+TBxK7U3g61f7rA4nM
	 2NI+zpImVz/Kf6Yb2+kzyfgZdGD5ApwXjKK89/Ek=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NMGSx0000594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 16:16:28 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 16:16:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 16:16:27 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NMGRAL016754;
	Thu, 23 Jan 2025 16:16:27 -0600
Message-ID: <15576ead-29f2-46e0-b07f-15746d55e446@ti.com>
Date: Thu, 23 Jan 2025 16:16:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] arago.conf: enable opencl distro
 feature
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>
References: <20250123202259.2846410-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250123202259.2846410-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 22:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15751

On 1/23/25 2:22 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> The GPU (for rogue devices) is now capable of supplying required OpenCL
> libraries. Additional tests for this feature will be pulled in later.
> 
> This was previously disabled due to an outdated opencl library on legacy
> devices. The offending library has since been removed.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Been testing with this enabled locally for a while now and so far
has been working great,

Acked-by: Andrew Davis <afd@ti.com>

>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 79d2208d..178b43d3 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -48,7 +48,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
>   # Add additional distro features
>   DISTRO_FEATURES:append = " pam wayland opengl"
>   DISTRO_FEATURES:remove = "x11"
> -#DISTRO_FEATURES:append = " opencl"
> +DISTRO_FEATURES:append = " opencl"
>   DISTRO_FEATURES:append = " vulkan"
>   
>   # Normally target distro features will not be applied to native builds:

