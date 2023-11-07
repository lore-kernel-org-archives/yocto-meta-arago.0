Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A43C0018C
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:18:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.8842.1699359513992481638
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 04:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Hh5HQZv4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7CIXic040664
	for <meta-arago@lists.yoctoproject.org>; Tue, 7 Nov 2023 06:18:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699359513;
	bh=9RAYhnqiLPFZvgOY4vnJyg/7+tYm/IiscgYBQd0+4Fw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hh5HQZv4cIA3L7ctoW9mPbIKFWxP/OgXTuoDebLdM0pQc28vCvJqnT7TNuVCCh/4L
	 OSPJ1rs78rTV85gRJX9SIB+yNs1XjGHkUMk8mW41ggWTXFSP0kj7g7BtVxlEPKIAGj
	 NKn9R70ecdcS4rKHVhE76YWhtMtz0Zyuxi653ttw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7CIXx8075184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 7 Nov 2023 06:18:33 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 06:18:32 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 06:18:32 -0600
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7CIUml065568;
	Tue, 7 Nov 2023 06:18:31 -0600
Message-ID: <fc090511-e36f-4414-a91b-7f6adadd784d@ti.com>
Date: Tue, 7 Nov 2023 17:48:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] arago.conf : Change jailhouse inmate ramfs to
 tisdk-tiny-initramfs
Content-Language: en-US
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>
CC: <khasim@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20231107114031.2318323-1-p-bhagat@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20231107114031.2318323-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Nov 2023 12:18:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15000


On 07/11/23 17:10, Paresh Bhagat wrote:
> Change the inmate ramfs which is used for jailhouse linux demo
> to use a smaller and dedicated tisdk-tiny-initramfs instead of
> tisdk-tiny-image.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>


Reviewed-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 8232ca27..3735ed93 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -137,7 +137,7 @@ PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>   RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
>   
>   # Configure RAMFS for jailhouse linux-demo
> -JH_RAMFS_IMAGE = "tisdk-tiny-image"
> +JH_RAMFS_IMAGE = "tisdk-tiny-initramfs"
>   
>   # Enable UI and scripting for perf
>   PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"

