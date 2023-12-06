Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA19C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:11:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.34032.1701875478029022104
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P0c3tXmX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6FBGKA127481;
	Wed, 6 Dec 2023 09:11:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701875476;
	bh=+jCWaXXQoUD1zyaqqgW/f9pS4G8GJZDnPXYZX9fAhpk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P0c3tXmXpfTN1BALRYM84gEGHu+4sqQgRrDIWUAaN+4E2BXXe1ssORa6M5eiLqb3X
	 yf1Ey+DN8fMWG1HS/1xCtdx9kfLROO1/y3ZvC/QHC0JOPP4cSxsy5mZ0FvDx3Sv4Xr
	 8kTo1xwB1rFd9xRdEFiIGl9VvgjYoatt+lfu0cVk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6FBGmD035062
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Dec 2023 09:11:16 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 09:11:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 09:11:16 -0600
Received: from [10.249.36.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6FBFQq090232;
	Wed, 6 Dec 2023 09:11:15 -0600
Message-ID: <3d7635f6-6ac7-4ec8-ae02-ab5d5e9b22d4@ti.com>
Date: Wed, 6 Dec 2023 09:11:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [kirkstone] [PATCH] receipes-multimedia: gstreamer:
 Add patches for AM62P
To: Devarsh Thakkar <devarsht@ti.com>, <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <rs@ti.com>, <k-bhargav@ti.com>,
        <a-limaye@ti.com>, <shyam.jagannathan@ti.com>, <r-ravikumar@ti.com>,
        <vijayp@ti.com>, <detheridge@ti.com>
References: <20231206144822.3194663-1-devarsht@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231206144822.3194663-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:11:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15039

On 12/6/23 8:48 AM, Devarsh Thakkar wrote:
> Add patches to prefer contiguous video format and supporting
> dmabuf-import mode for video decoder.
> 
> This is to support use-cases involving video codec with other components
> viz. GPU, Camera e.t.c.
> 

Why does this "support use-cases"? What is wrong with the default formats?
Are these posted upstream to upstream gstreamer, if not why? Or should we
instead fix the consuming software to handle the default non-contiguous
formats better..

Andrew

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   .../gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend       | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> index a36c9760..e14a3c93 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend
> @@ -20,4 +20,8 @@ SRC_URI:append:am62axx = " \
>       file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
>   "
>   
> +SRC_URI:append:am62pxx = " \
> +    file://0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
> +    file://0002-v4l2-Give-preference-to-contiguous-format-if-support.patch \
> +"
>   PR:append = ".arago0"

