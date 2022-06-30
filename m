Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65074C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:59:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.23158.1656583143861025764
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 02:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Hnmcu+Q0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25U9x3XH086092;
	Thu, 30 Jun 2022 04:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656583143;
	bh=YvKWiU/5vvNkBeUQIXQbirFGokx0LWtym2b0fvmTAMI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hnmcu+Q0EX2XKZKAv6nANw7J+f2S8JNexJxSVJ1YOqoe/bz9+UmqTmstI9AjFyOvI
	 Hc+5OtHLB5mWCZfSgTN171MdJJ7UEBPTEC+Tq7RAn1vfq5iVjBGp5e3Xd8MZ8mHNw9
	 IELX3/x23EBvPanVl1dccZaNS8xJsnkJsjBCyDds=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25U9x3wh075233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 04:59:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 04:59:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 04:59:02 -0500
Received: from [10.250.232.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25U9wwHt061121;
	Thu, 30 Jun 2022 04:58:59 -0500
Message-ID: <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
Date: Thu, 30 Jun 2022 15:28:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build
 flag to enable GST_TRACERS
Content-Language: en-US
To: Aniket Limaye <a-limaye@ti.com>, <meta-arago@lists.yoctoproject.org>,
        "Mantena, Prasanth" <p-mantena@ti.com>,
        <prashanth.ka@pathpartnertech.com>
CC: <reatmon@ti.com>, <l-weaver@ti.com>
References: <20220629105304.15355-1-a-limaye@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220629105304.15355-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 09:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13922

Prashanth,Prasanth,

Please review.

On 6/29/2022 4:23 PM, Aniket Limaye wrote:
> Enables GST_TRACERS : an optional utility for profiling gstreamer applications

Aniket,

1. What is the impact of this with codec performance?
2. Why is this optional utility need to enabled?


> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   .../gstreamer/gstreamer1.0_1.16.%.bbappend                   | 5 +++++
>   1 file changed, 5 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> new file mode 100644
> index 00000000..d7bdaa04
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
> @@ -0,0 +1,5 @@
> +
> +PACKAGECONFIG_append = " tracer-hooks"
> +
> +PR_append = ".arago0"
> +

