Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C23C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:02:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4529.1682542932767915234
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J8jH9ice;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QL2CSB069946
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 16:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682542932;
	bh=/DXkSNXVGoD4nVq6CbNbgLbSrDX8LcBC0ph8ac30ZsA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=J8jH9icetRjSvMvubGMb+yQZzLeHEeWTIprYaZeWJFfQmjRXS8cTwzTzQ5medmJkk
	 TF3YAm/Vc5HbvpHgqC/A/GK0qySNAdI5v5C6dEQQOY5ft1AuaCzw3sEpZOXKwqbP08
	 u8LAVWuWY3m/9VO2CEuwHH/84qVgaEuh9VdUwo/g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QL2Cdu061766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 16:02:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 16:02:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 26 Apr 2023 16:02:10 -0500
Received: from [10.249.32.181] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QL2ACO092950;
	Wed, 26 Apr 2023 16:02:10 -0500
Message-ID: <6eef0b06-f63a-4bfa-886f-d1c7496f822e@ti.com>
Date: Wed, 26 Apr 2023 16:02:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [kirkstone][PATCH v2] meta-arago-distro: Add Jailhouse support
 for am62xx
Content-Language: en-US
To: paresh-ti <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20230426093533.14848-1-p-bhagat@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230426093533.14848-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14347



On 4/26/2023 4:35, paresh-ti wrote:
> - Update arago conf to add support for jailhouse in am62xx.
> - Update package group to add support for jailhouse for am62xx.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Signed-off-by: paresh-ti <p-bhagat@ti.com>

You are supposed to sign-off with your legal name.

See: https://wiki.linuxfoundation.org/dco


> ---
>   meta-arago-distro/conf/distro/arago.conf                       | 3 +++
>   meta-arago-distro/conf/distro/include/arago-prefs.inc          | 3 +++
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 1 +
>   3 files changed, 7 insertions(+)
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
> index 8d8a36f6..66fa6451 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -59,6 +59,7 @@ UTILS:append:k3 = " mmc-utils \
>   
>   UTILS:append:k3 = " ti-rtos-firmware"
>   UTILS:append:am64xx = " pru-icss"
> +UTILS:append:am62xx = " pru-icss jailhouse"
>   UTILS:append:am65xx = " pru-icss"
>   UTILS:append:j721e = " pru-icss"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

