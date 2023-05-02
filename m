Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26945C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:26:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4913.1683066394546916561
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 May 2023 15:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yoxRFvIA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342MQUk1046385;
	Tue, 2 May 2023 17:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683066390;
	bh=6/x2OhXiSKfNRtWaR4obZhluoFYSJw1DyqpRKQnY8yo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yoxRFvIAQbBndDqeNMYbP9TRsHGFyh3JdHOvx4kino+8C5+n1By99spy9CuVs/Ocs
	 Scv+yUZnAjHvPAzI3h3mv9MKvuAaTsfufEH3Q3otfP4/VS76uH0a912RA7xa8fTSEz
	 mPf60P78L1py8N+uQD0PpuxPx/chXkwFvhv2JlTs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342MQUId015080
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 17:26:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 17:26:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 17:26:30 -0500
Received: from [10.247.31.254] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342MQTGF030532;
	Tue, 2 May 2023 17:26:30 -0500
Message-ID: <c6f14f60-a3e5-650f-b15f-42cb540ac041@ti.com>
Date: Tue, 2 May 2023 17:26:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-arago][kirkstone/master][PATCH] branding-ltsprep: add the
 gpu back in
To: <rs@ti.com>, <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230502212547.1754704-1-rs@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230502212547.1754704-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 May 2023 22:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14391



On 5/2/2023 4:25 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> The required kernel and recipe changes are present. The GPU swrast
> override can now be safely removed.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
> 
> Please let me know if you would like to keep the GPU disabled for "next"
> and "mainline" brands or if I can go ahead and enable it for those as
> well. At this point everything should build and run fine, but I don't
> know if there are ideals behind these tags that I'll be disrupting.
> 
>   meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> index ee8761f9..6136561e 100644
> --- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> @@ -4,11 +4,6 @@ PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
>   PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
>   PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
>   
> -# GPU support requires out-of-tree SGX and RGX drivers not available in until
> -# LTS prep is complete.  fall back to software rendering
> -MACHINE_FEATURES:remove = "gpu"
> -PREFERRED_PROVIDER_virtual/gpudriver = ""
> -
>   # GC320 support requires out-of-tree drivers not available in until LTS prep is
>   # complete. Disable for now.
>   MACHINE_FEATURES:remove = "gc320"

