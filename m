Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360CCC48260
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 22:38:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8104.1707172718646427576
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 14:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GkI5kAJg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415McYv6005571;
	Mon, 5 Feb 2024 16:38:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707172714;
	bh=xFPTovfBgx7Zh2UP4fGxkoSFHveQ3YtOUzMcrOORNt4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GkI5kAJgwpZN+Ov3PQqgzA0Zh1RTgiYSdvfNl7+0OBrzVFRxpqMOPY3abkhx2AHCI
	 xPXxrQMVJYxnoMBlZ4dL9qyujaN5xbmeXmEJmSiRRxkquanaBHiJ0aJcA3xO9Qr57Z
	 0gX9jRBc9mHtOjkj2MhBNVUvliXKv2HLviPt7phY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415McYjW127342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 16:38:34 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 16:38:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 16:38:34 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415McY4G023178;
	Mon, 5 Feb 2024 16:38:34 -0600
Message-ID: <48d5572f-fbe0-49c6-aca8-6bcd31b9b111@ti.com>
Date: Mon, 5 Feb 2024 16:38:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] recipes-devtools: mtd-utils:
 Switch to infraroot.at for https over git protocol
Content-Language: en-US, en-US-large
To: <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240129095834.77985-1-c-shilwant@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20240129095834.77985-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Feb 2024 22:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15111

On 1/29/24 03:58, Chirag Shilwant via lists.yoctoproject.org wrote:
> - In past, there have been issues in do_fetch from infradead.org over git protocol in proxy based network [1].
> 
> - As per the latest release announcement from mtd-utils, infraroot.at is the official mirror for infradead.org [2].
> 
> - Since infradead.org has fetch failures over git, start using infraroot.at over https in SRC_URI.
> 
> Reference
> ---------
> [1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/962170/processor-sdk-am65x-how-to-resolve-the-fetch-error-that-occurs-when-executing-bitbake
> [2] https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   .../recipes-devtools/mtd/mtd-utils_git.bbappend           | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
> index aec6a1ac..341d0600 100644
> --- a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
> +++ b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
> @@ -1,4 +1,10 @@
> -PR:append = ".arago1"
> +PR:append = ".arago2"
> +
> +SRC_URI:remove = "git://git.infradead.org/mtd-utils.git;branch=master \
> +"
> +
> +SRC_URI:prepend = "git://git.infraroot.at/mtd-utils.git;branch=master;protocol=https \
> +"
>   
>   BBCLASSEXTEND += "nativesdk"
>   

This could be simplified as just:
MIRRORS += "git://git.infradead.org/.* 
git://git.infraroot.at/PATH;protocol=https"

Which could be upstreamable since I imagine this has been hitting a few 
people and oe-core already has a few packages that update the MIRROR var.

