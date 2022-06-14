Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED18AC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 14:57:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.7180.1655218673449518907
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 07:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RWDcg0wO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25EEvqYR031545
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 09:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655218672;
	bh=y3QQYOgRtqvuT6ajRpAw03vypTU6zPydQEiXO16S3s0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RWDcg0wOELlIyk91nhdr+9350OF3qb2oGr186OqmW40nXKfOyXt50JQ/nGaBd9l2g
	 10cmfAPmmAMuYyHgHM5PFwXHJSkgVPTlhojnf0vws0vp7SSgjZ7OykXxvVsVNvOKIG
	 FIJOXCI6aaL+X+X5YVTB+6iDPqyDvABnXWc3szYk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25EEvqQJ018334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 09:57:52 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Jun 2022 09:57:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Jun 2022 09:57:51 -0500
Received: from [10.250.33.138] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25EEvp1v077761;
	Tue, 14 Jun 2022 09:57:51 -0500
Message-ID: <ac372b05-4637-5565-cd1c-29f1313cd143@ti.com>
Date: Tue, 14 Jun 2022 09:57:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [dunfell/master][PATCH] conf: arago: Add j721s2 hs platform
 support
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>
References: <20220614092547.1988217-1-j-choudhary@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220614092547.1988217-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 14:57:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13898

On 6/14/22 4:25 AM, Jayesh Choudhary wrote:
> Add kernel type for j721s2 hs platform
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index eb380c63..0e2f7ef1 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -55,6 +55,7 @@ KERNEL_IMAGETYPES_am65xx-hs-evm = "Image fitImage"
>   KERNEL_IMAGETYPES_am64xx-hs-evm = "Image fitImage"
>   KERNEL_IMAGETYPES_j7-hs-evm = "Image fitImage"
>   KERNEL_IMAGETYPES_j7200-hs-evm = "Image fitImage"
> +KERNEL_IMAGETYPES_j721s2-hs-evm = "Image fitImage"
>   


The master branch seems to do things differently, this is only for
dunfell, on master you'll need KERNEL_CLASSES also. Anyway,

Acked-by: Andrew Davis <afd@ti.com>


>   KERNEL_IMAGETYPES_k2e-hs-evm = "zImage fitImage"
>   INITRAMFS_IMAGE_k2e-hs-evm = "k2-fw-initrd"

