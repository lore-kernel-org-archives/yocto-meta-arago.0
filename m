Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE69C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 17:00:29 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.14627.1744477218761576402
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 12 Apr 2025 10:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P6sW6iPf;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53CH0Hao1806069
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 12:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744477217;
	bh=obGS1R0EXZYS8BvDCnx48R5yhKOeXLehsfhN1i9oqaI=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=P6sW6iPfLZ5wp+N7nUhGXc3BMOlA0uE3L1h0tU8gP+zPwaQpuc+1JCMM/OMXAAfCD
	 UHsZUawiGqYOxg0kCnUpThc2bXWMYwPCMJQXI08y4w95ShfpLyZgea1UrklkaipBDI
	 ksm5Vff3GnHHMT12Qvwvah72OimnFYVqA2Q24TGI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53CH0Hl1029673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 12:00:17 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 12:00:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 12:00:17 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53CH0F7j019435;
	Sat, 12 Apr 2025 12:00:16 -0500
Message-ID: <797859ae-8101-4833-a941-23dac48d8738@ti.com>
Date: Sat, 12 Apr 2025 22:30:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] hwspinlocktest: Fix build
 against latest kernel
To: Praneeth Bajjuri <praneeth@ti.com>
References: <20250411192050.22024-1-reatmon@ti.com>
Content-Language: en-US
CC: <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250411192050.22024-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 12 Apr 2025 17:00:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16167

Hi Praneeth,

On 12/04/25 00:50, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change in the kernel removed a function that this test was
> calling.  This patch removes the calls to that function and modifies the
> flow to not need it.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---

<snip>

> +SRC_URI = "\
> +    git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \



What's preventing us to move this repository under [0] or [1] ?


[0]: https://github.com/TexasInstruments/

[1]: https://git.ti.com/cgit/

--
Chirag



> +    file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
> +    file://0002-Add-support-for-AM62-SoCs.patch \
> +    file://0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch \
> +"
> +
>   SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
>   
>   S = "${WORKDIR}/git"

