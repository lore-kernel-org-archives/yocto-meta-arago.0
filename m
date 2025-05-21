Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674CDC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 18:44:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.6580.1747853045886183839
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 May 2025 11:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OzXdP2YC;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54LIi4qi1575280;
	Wed, 21 May 2025 13:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747853045;
	bh=MF6fndz/blAuM+C3itj2+MSBBdlmwrm3kaWzmmowafs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=OzXdP2YClGRBfUKYxcz5m3pDjkOGRZUDYe10pbWe33MWorXlZRF7jMRem5NtndYuK
	 3PvZDv4fy1wGy2fGjCW/uXtrApVRBPDTncGTumADDWK5aRAwufrzeXL/Q+RXPzpkyo
	 3lSw5uPGnfQNkGfYAb3P/i25yxydq/1tgjXHe2bM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54LIi4Zp910706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 13:44:04 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 13:44:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 13:44:04 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54LIi4GI159364;
	Wed, 21 May 2025 13:44:04 -0500
Message-ID: <84933375-bd13-4756-884d-03d8a3a4eaf6@ti.com>
Date: Wed, 21 May 2025 13:44:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] sbc: Fix for gcc 15 compile error
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <184192F43A4056D7.22209@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <184192F43A4056D7.22209@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 May 2025 18:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16237



On 5/21/2025 10:01 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> With the move to gcc 15, the code is not generating a compile error.

It was pointed out on oe-core mailing list that I meant "now" and not 
"not".  I have fixed this in the repo.


> ../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
>     error: too many arguments to function 'sbc_analyze_eight_armv6';
>        expected 0, have 3
> 
> Simple fix is to drop the C standard down to gnu17 to avoid this new
> error.
> 
> I am going to submit a better patch to oe-core, but we need this in
> the interim to get our builds working again.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc  | 1 +
>   meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend | 4 ++++
>   2 files changed, 5 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
>   create mode 100644 meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc b/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
> new file mode 100644
> index 00000000..39725139
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
> @@ -0,0 +1 @@
> +CFLAGS += "-std=gnu17"
> diff --git a/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend b/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
> new file mode 100644
> index 00000000..295b58a4
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
> @@ -0,0 +1,4 @@
> +SBC_ARAGO = ""
> +SBC_ARAGO:arago = "sbc-arago.inc"
> +
> +require ${SBC_ARAGO}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

