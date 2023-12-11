Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E0BC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 20:09:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1503.1702325365816694477
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 12:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a8sZee1l;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BBK9OPg080199;
	Mon, 11 Dec 2023 14:09:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702325364;
	bh=/qQBYOtMClGKqV7g2CbDt4WYG+nLLkS/shBl1LKBDXo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=a8sZee1lmyPB3MxM3TgozfOFs5Qv65pREm9Fq+CKtPAd7yib7i1Mtg6dt5L686mMs
	 Tupd0fpNOXB1LaN/XbgM5RP7hLuDOF76V6auzWejE1uZwV+B4gx/SsxCuTs05WmDff
	 QhrxNXSllDJbRxHwmlGowsYCyCXg8RNrB05wleWI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BBK9OHO104302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Dec 2023 14:09:24 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Dec 2023 14:09:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Dec 2023 14:09:23 -0600
Received: from [10.247.22.48] (lt5cg925bjv2.dhcp.ti.com [10.247.22.48])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BBK9NJE074272;
	Mon, 11 Dec 2023 14:09:23 -0600
Message-ID: <b9393dd7-c7d8-4d93-871f-15c1e475037d@ti.com>
Date: Mon, 11 Dec 2023 14:09:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] branding-ltsprep: Move to kernel 6.6
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231211193312.27583-1-reatmon@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231211193312.27583-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Dec 2023 20:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15055



On 12/11/2023 1:33 PM, Ryan Eatmon wrote:
> Move the kernel version overrides to 6.6 for the next LTS prep.  uboot
> is not currently ready so leave it at 2023.04 for the time being.

thanks for kickstart on this.

created branch based on 2024.01-rc4 tag.
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?h=ti-u-boot-2024.01

update the PREFERRED_VERSION for uboot in ltsprep brand as well.

Thanks

> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/conf/distro/include/branding-ltsprep.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> index fb831225..397ad7b5 100644
> --- a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> @@ -1,7 +1,7 @@
>   
> -PREFERRED_VERSION_linux-ti-staging = "6.1%"
> -PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
> -PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
> +PREFERRED_VERSION_linux-ti-staging = "6.6%"
> +PREFERRED_VERSION_linux-ti-staging-rt = "6.6%"
> +PREFERRED_VERSION_linux-ti-staging-systest = "6.6%"
>   PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
>   
>   # Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18

