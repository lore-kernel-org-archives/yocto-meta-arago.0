Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE412C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 07:43:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.16525.1667461418768235334
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 00:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Xn60GYhY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A37hbOu010825
	for <meta-arago@lists.yoctoproject.org>; Thu, 3 Nov 2022 02:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667461417;
	bh=/bMF2eLLwc1kuB3H5Slc4ilihtdrVKYEDwoAQqb04So=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Xn60GYhYj7TDApZH8lIU9hPIL5h9B3p7R7WqwBMfgJ8g7uCmqg0hkwCfwS532QnCa
	 yHWR574VPcKirRqoIifH4Sy3xABVeQdequ78MbPXRdWIzqWpkhd+WlBIXudjM2kTrp
	 04Ct+7pBf9sCE+Yl8ZIa3LONA/un5Y9OYfGLpi+Y=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A37hb9b053227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 3 Nov 2022 02:43:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 3 Nov
 2022 02:43:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 3 Nov 2022 02:43:37 -0500
Received: from [10.250.232.255] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A37hZBZ014608
	for <meta-arago@lists.yoctoproject.org>; Thu, 3 Nov 2022 02:43:36 -0500
Message-ID: <c72ebc8b-99a7-c3f7-7214-37091c385775@ti.com>
Date: Thu, 3 Nov 2022 13:13:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [meta-arago][PATCH dunfell] irqbalance: Update to v1.8.0
To: <meta-arago@lists.yoctoproject.org>
References: <171D08FE46790359.20882@lists.yoctoproject.org>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <171D08FE46790359.20882@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Nov 2022 07:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14094



On 11/10/22 7:38 pm, Vignesh Raghavendra via lists.yoctoproject.org wrote:
> irqbalance has fixes for ARM64 systems especially for when CONFIG_NUMA
> is disabled, hence upgrade to v1.8.0 to take advantage of IRQ load
> balancing on K3 SoCs
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../recipes-extended/irqbalance/irqbalance_git.bbappend       | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> 
> diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> new file mode 100644
> index 000000000000..e87a65d65f47
> --- /dev/null
> +++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> @@ -0,0 +1,4 @@
> +SRCREV = "99ae256d02b35778b406e598beedc8d827cdac18"
> +PV = "1.8.0"
> +
> +PR_append = ".arago3"

Gentle ping?

