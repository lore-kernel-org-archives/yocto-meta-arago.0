Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39779C2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 11:24:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.45036.1718882667594427631
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 04:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XAVuy4oE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KBOOQ2057739;
	Thu, 20 Jun 2024 06:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718882664;
	bh=Cb/DQsCprqD98qqN8+4RKYT9HCDEOOxyx0NyXuhBmcA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XAVuy4oExkTsY4mHOj06ehQ1/6rYuF4o66OOqhZ4RULXqyZx1DBm94zKyANWO+oqV
	 jP461q+zoHJYx+p5wsb7bZSFQ5xzD510tJlVyegjleVPE7QnzAX88jMFx+b6PI7BDB
	 UkfRtbcKGHHcn8VD8vLQhX/N8hi31oDEu/Lsixxk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KBOO5d013751
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 06:24:24 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 06:24:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 06:24:24 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KBOL1w080913;
	Thu, 20 Jun 2024 06:24:22 -0500
Message-ID: <75147072-9cb3-42a8-9d0c-96de38b923cc@ti.com>
Date: Thu, 20 Jun 2024 16:54:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH] ti-test: Add media-ctl for camera
 testing
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Aradhya Bhatia
	<a-bhatia1@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240620111957.3733312-1-j-luthra@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240620111957.3733312-1-j-luthra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Jun 2024 11:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15406

Hi Jai,
On 20/06/24 16:49, Jai Luthra wrote:
> The media-ctl utility is required to configure formats and routes in
> embedded v4l2 camera pipelines.
>
> It was automatically packaged in older v4l-utils recipe, but with
> v1.26 onwards it needs to be explicitly enabled.
>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 8cb27f21..914a40c4 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -29,6 +29,7 @@ TI_TEST_BASE = "\
>       linuxptp \
>       lmbench \
>       lsof \
> +    media-ctl \
>       memtester \
>       mstpd \
>       mtd-utils \

