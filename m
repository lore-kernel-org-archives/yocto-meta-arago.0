Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F72C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:33:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.34357.1701876813748163960
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hzJjB8n8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6FXWUX016752;
	Wed, 6 Dec 2023 09:33:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701876812;
	bh=daKXOCCaePFS3YRlX4xzm8iWPyoPw/iEJGQUhlMgjWU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hzJjB8n8pDXCYvIIlQVvopVmWZeoNQTod+gFeFa9YfupJOi06uNr6gTUR1FTJ2jgV
	 vNbtsOS0BnaX8p7DQg1V77dzy4iTUNLhlcK4y7cvgqbjiZJNj4Eed9jly0+5vklKyb
	 J+w8jPSLNDG+ssMu9a+/yNjGCe/SdnzvTKW6UcMw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6FXWr7017623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 09:33:32 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 09:33:31 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 09:33:31 -0600
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6FXVG3036360;
	Wed, 6 Dec 2023 09:33:31 -0600
Message-ID: <8851630a-004c-4cfa-8ded-a96a07f8c72f@ti.com>
Date: Wed, 6 Dec 2023 09:33:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][krikstone][PATCH RFC 2/4] gst-plugins-ti: Enable
 network task flag for do_configure
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <denys@konsulko.com>,
        <praneeth@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <u-kumar1@ti.com>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20231206143618.27770-1-sinthu.raja@ti.com>
 <20231206143618.27770-3-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231206143618.27770-3-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15040



On 12/6/2023 8:36 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The Ducati and VPE gst plugins requires network during the do_configure task
> so, enable the network task flag for the same.

Why does it require network?  Can you elaborate a little more?


> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb           | 2 ++
>   .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb              | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> index 1ff2dfb0..99a5615c 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
> @@ -18,4 +18,6 @@ SRC_URI = " \
>       file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
>   "
>   
> +do_configure[network] = "1"
> +
>   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> index 237031b1..25d4d9c2 100644
> --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
> @@ -15,3 +15,5 @@ SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
>   SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
>              file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
>   "
> +
> +do_configure[network] = "1"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

