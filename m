Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4CDC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:00:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.20221.1683122428736785278
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 May 2023 07:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OR4vadR4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 343E0S6M014292
	for <meta-arago@lists.yoctoproject.org>; Wed, 3 May 2023 09:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683122428;
	bh=pxuL/W4/AjfNYy+D/ngQB0AjgquAViOTShEduFLlI6E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OR4vadR4GFrfy1fruqkidryn65vspFNZa2CXHKQuaqEQGiSkU7wKrlUGeXlxE0zy6
	 wNJMWBJzMq4Au1BW8TQrLq63OJopkJpbU6L+R+bvcrhz5JRwV4eGXsEuy/0BQJ83Ml
	 GpZzpbtXXSgJIwe7g5EIzExomROzIeE3/dHo64pw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 343E0Stq117962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 3 May 2023 09:00:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 May 2023 09:00:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 May 2023 09:00:27 -0500
Received: from [10.249.32.181] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 343E0Rjo036163;
	Wed, 3 May 2023 09:00:27 -0500
Message-ID: <176dafa9-c4ce-2e1a-82e9-b71c48652cc6@ti.com>
Date: Wed, 3 May 2023 09:00:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [kirkstone][PATCH v5] meta-arago-distro: Add Jailhouse support
 for am62xx
Content-Language: en-US
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>,
        <dannenberg@ti.com>
References: <20230503133437.10469-1-p-bhagat@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230503133437.10469-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 May 2023 14:00:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14395



On 5/3/2023 8:34, Paresh Bhagat wrote:
> Update arago conf to add support for jailhouse in am62xx.
> Update package group to add support for jailhouse for am62xx.
> Optionally build jailhouse for am62xx if JAILHOUSE_ENABLE is set to 1.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf                      | 3 +++
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 094e67da..3e4c4644 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -121,6 +121,9 @@ PACKAGECONFIG:append:pn-cairo = " egl glesv2"
>   PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>   RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
>   
> +# Configure RAMFS for jailhouse linux-demo
> +JH_RAMFS_IMAGE = "tisdk-tiny-image"
> +
>   # Enable UI and scripting for perf
>   PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
>   
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 8d8a36f6..f3e45bb2 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -59,6 +59,10 @@ UTILS:append:k3 = " mmc-utils \
>   
>   UTILS:append:k3 = " ti-rtos-firmware"
>   UTILS:append:am64xx = " pru-icss"
> +
> +JAILHOUSE_ENABLE ?= "0"
> +UTILS:append:am62xx = " ${@oe.utils.conditional("JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
> +

I would prefer this variable to follow the same pattern that the other 
variables have...  Please change this to ARAGO_JAILHOUSE_ENABLE.

>   UTILS:append:am65xx = " pru-icss"
>   UTILS:append:j721e = " pru-icss"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

