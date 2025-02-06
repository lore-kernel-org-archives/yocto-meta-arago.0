Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFE4C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:54:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.44910.1738857287716515496
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 07:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AsU+mI4L;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516FskT83653501
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Feb 2025 09:54:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738857287;
	bh=kUE0g/D/DJsDXGnR+Znmc2MXNt4s8SOXTVn/PrUsHk4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AsU+mI4LqwcPyx8qLSxvhU6u0Rwuq/hJGCPNk8yKaw9KZxPp1MHqG/Dq5o126t0VE
	 0TzMh9A+epbM/qEp9HtYvGsscehOFSIB91g7GlfdwvdHTgwM+Rq3kCg33It1puoWMP
	 JeraqKAvGgigkHvhtg6BLSpRAZygiyO5G57OjH/g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Fsk4Q057050
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Feb 2025 09:54:46 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 09:54:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 09:54:46 -0600
Received: from [10.249.32.100] ([10.249.32.100])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Fsk8R034826;
	Thu, 6 Feb 2025 09:54:46 -0600
Message-ID: <b8ea56a3-ae73-4750-9256-0dfcabf06917@ti.com>
Date: Thu, 6 Feb 2025 09:54:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] meta-arago-test: opencl-headers version
 v2023.12.14->v2024.05.08
To: <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250205200411.686617-1-a-christidis@ti.com>
 <20250205200411.686617-4-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250205200411.686617-4-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 15:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15825



On 2/5/2025 2:04 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>
> 
> This version of the headers is required for OpenCl-CTS.
> 
> Carry this bbappend, as a version pump wasn't possible on the upstream meta-oe
> layer. As per the LTS process.
> 
> Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../recipes-extended/opencl/opencl-headers_%.bbappend            | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
> 
> diff --git a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
> new file mode 100644
> index 00000000..4dff02d9
> --- /dev/null
> +++ b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
> @@ -0,0 +1 @@
> +SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"


This is problematic.

We are working to move at least meta-arago-test to be be yocto compliant 
and bare .bbappends that change things like this are considered bad form.

Here is an example of an upcoming patch that I will be sending to adress 
this same issue with the piglit package:

https://git.ti.com/cgit/arago-project/meta-arago/commit/?id=ecc08cf6204f9f935f39fe5308efbb537b99824e


Part of the log term plan has been to move meta-arago-test over to 
meta-ti-test in the meta-ti repo.  And that repository is yocto 
compliant and we want to always keep it.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

