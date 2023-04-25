Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3BFC6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 14:18:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.80308.1682432335612363094
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 07:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lzjskbx4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PEIsa9056366
	for <meta-arago@lists.yoctoproject.org>; Tue, 25 Apr 2023 09:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682432334;
	bh=CGYZBiPDhIWdYXteoE82tySvyyV8AF32NEyIpGfcq8w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lzjskbx4bTF+r2x87JY+t7xJUctSjWDrI8SV0zHXGPHCQQAR9D0WSEKaE0FFvzDBw
	 XZqELUSm67tK2GWal4IzhnY05sloIsXJWWUe2wZbUPXl+V5GJY1qRswwHZEt0hZpwq
	 YBX36FNdWTY/TaXCTXynUFvMqYOny7s13Nbb1Ack=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PEIsBX110203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 25 Apr 2023 09:18:54 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 09:18:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 09:18:54 -0500
Received: from [10.250.34.43] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PEIsjd103344;
	Tue, 25 Apr 2023 09:18:54 -0500
Message-ID: <b6ae7dc7-8d11-6cd0-496f-95faa5d32b99@ti.com>
Date: Tue, 25 Apr 2023 09:18:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [kirkstone][PATCH] meta-arago-distro: Add Jailhouse support for
 am62xx
To: paresh-ti <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20230425104241.31410-1-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230425104241.31410-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Apr 2023 14:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14345



On 4/25/2023 5:42, paresh-ti wrote:
> - Update arago conf to add support for jailhouse in am62xx.
> - Update package group to add support for jailhouse for am62xx.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Signed-off-by: paresh-ti <p-bhagat@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf                       | 3 +++
>   meta-arago-distro/conf/distro/include/arago-prefs.inc          | 3 +++
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 2 ++
>   3 files changed, 8 insertions(+)
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
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 34c3c539..c632e111 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -19,3 +19,6 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
>   #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
>   #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
>   #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
> +
> +CREATE_SRCIPK:pn-jailhouse ?= "1"
> +SRCIPK_INSTALL_DIR:pn-jailhouse ?= "board-support/extra-drivers/${PN}-${PV}"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 8d8a36f6..271c05ab 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -52,6 +52,7 @@ UTILS:append:omap-a15 = " mmc-utils \
>   UTILS:append:k3 = " mmc-utils \
>                       switch-config \
>                       irqbalance \
> +                    jailhouse \

You appear to the be adding jailhouse to ALL k3 ...

>                       ti-rpmsg-char \
>                       ti-rpmsg-char-examples \
>                       statcol \
> @@ -59,6 +60,7 @@ UTILS:append:k3 = " mmc-utils \
>   
>   UTILS:append:k3 = " ti-rtos-firmware"
>   UTILS:append:am64xx = " pru-icss"
> +UTILS:append:am62xx = " pru-icss jailhouse"

... and then adding it again for just am62xx.

One of those two lines should be removed.  Either it's for all 
platforms, or it is just am62xx.  Based on the commit message, I think 
the first one is what you want to remove.


>   UTILS:append:am65xx = " pru-icss"
>   UTILS:append:j721e = " pru-icss"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

