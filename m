Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CA3C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 12:19:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.3394.1652357979759685795
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 05:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VG7vSdyE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CCJc5v077067
	for <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 07:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652357978;
	bh=UApo6/Iz6PjK/y2JmK6Pe7M2YormhTsakOp8kXu7ZJw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VG7vSdyEI02/GXg9XqzIWJjJQXbVjM1ELmWq8llmu22SBtB87l0VnU9BFSMgP26qO
	 DPt41gndYP4N8E6kkKZlZ/VSuvEp83VHpRH+cilXUfe4DMhV/vEibLfm3awXXoUM/g
	 ep+TSE9yT5eRSLnVwjoZFUwnsVlWkvzG0sK7Batg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CCJcVU008616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 07:19:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 07:19:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 07:19:37 -0500
Received: from [172.24.152.130] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CCJZbD120725;
	Thu, 12 May 2022 07:19:36 -0500
Message-ID: <d2aabff7-f5aa-4c16-7ccb-0cab7b503e24@ti.com>
Date: Thu, 12 May 2022 17:49:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][dunfell][PATCH] qtbase-conf: Unset fixed HDMI mode
Content-Language: en-US
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <a-m1@ti.com>
References: <20220512100143.12268-1-s-adivi@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20220512100143.12268-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 12:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13848


On 12/05/22 15:31, Sai Sree Kartheek Adivi wrote:
> HDMI mode is set to 1024x768 in eglfs_kms_cfg.json. This needs to be
> unset since not all devices use the same resolution display.
>
> When mode is not defined, the system's preferred mode is chosen.
> Ref: https://doc.qt.io/qt-5/embedded-linux.html#display-output
>
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json            | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
> index 61b834be..ac19b8ec 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
> @@ -8,8 +8,7 @@
>         "mode": "off"
>       },
>       {
> -      "name": "HDMI1",
> -      "mode": "1024x768"
> +      "name": "HDMI1"
>       }
>     ]
> -}
> \ No newline at end of file
> +}

