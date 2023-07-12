Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82BEEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 13:37:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7562.1689169033988742456
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Jul 2023 06:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DyV/haxm;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36CDbCbP016668;
	Wed, 12 Jul 2023 08:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689169032;
	bh=B6ejDbLpLoYTD/2ESsfNfuEwYmmBGXzpgaFajcliqiQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DyV/haxmsDDkX4qt8aMng/HZu/CiPic7OnHvLj+koyYcSRJyJ+IpaO5Z6i6bkQBZs
	 +azs0tUt1VRQotU280+LoThpttcMIrlivVYSShC/xkT358Nx4t4a5q1DpDbMvcGpfF
	 VAawO2wM9XgTmZdf7tWuqyHRdFsrIuiBijULU37E=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36CDbCQI126788
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jul 2023 08:37:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jul 2023 08:37:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Jul 2023 08:37:12 -0500
Received: from [10.24.69.154] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36CDb6jI040437;
	Wed, 12 Jul 2023 08:37:07 -0500
Message-ID: <cc88ff89-01c3-dd82-24b1-1384b9aad14a@ti.com>
Date: Wed, 12 Jul 2023 19:07:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago] [kirkstone] [PATCH] arago.conf: Enable coretracers
 in gstreamer1.0
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>, <a-limaye@ti.com>, <shyam.jagannathan@ti.com>,
        <g-gupta@ti.com>, <vijayp@ti.com>, <detheridge@ti.com>,
        <r-ravikumar@ti.com>
References: <20230711154731.3270458-1-devarsht@ti.com>
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20230711154731.3270458-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Jul 2023 13:37:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14796

On 11/07/23 21:17, Devarsh Thakkar wrote:

> Enable coretracers packageconfig
> for gstreamer1.0 package to include gstreamer
> coretracers such as latency tracer, leak tracer
> e.t.c in base gstreamer package
>
> Without this change, the gstreamer tracers
> were not getting included.
>
> Fixes: 1fbb3fb3 ("conf: arago: Adding tracer-hooks build flag to gstreamer1.0")
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index bb074478..43553678 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -123,7 +123,7 @@ PACKAGECONFIG:append:pn-libsdl2 = " kmsdrm"
>   PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
>   
>   # Enable GST_TRACER logging in gstreamer
> -PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
> +PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks coretracers"

Reviewed-by: Rahul T R <r-ravikumar@ti.com>

Regards
Rahul T R

>   
>   # Enable kmssink in gstreamer
>   PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"

