Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315A8C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 14:27:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22454.1748528844363683343
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 May 2025 07:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nct0NaQ7;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TERK853542709;
	Thu, 29 May 2025 09:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748528840;
	bh=vr+PlK+InBR35Qcm5VwrOMOWLUhsBJww4+oPZd/hx2Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nct0NaQ71KICpeZJmzBUFGqrlPRgi1q2x3RqSUMEE4DTwKo5YOP02LGEQOFxKbx34
	 u+FD+KhzwuwVliT1j8us2gi60Ev9ktFAcI2lk1RnixkKvlslItLNDE2Mh+KkiU/Lwc
	 ZWKfBbCa7yY2E0+m3WVS/TQq+V11SDyFn4jFtluk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TERJ1W092087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 09:27:20 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 09:27:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 09:27:19 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TERJOP1658983;
	Thu, 29 May 2025 09:27:19 -0500
Message-ID: <6fed1700-8ad2-454c-b3d8-48e5e0d76bed@ti.com>
Date: Thu, 29 May 2025 09:27:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-distro: packagegroups:
 Add additional libraries for audio
To: <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>, <denis@denix.org>,
        <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250528102948.327229-1-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250528102948.327229-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 May 2025 14:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16240

On 5/28/25 5:29 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add fftw and libsndfile1 libraries in multimedia package group, which are
> used for signal processing and audio manipulation. Update corresponding
> sdk target file to package header files and libraries for development.
> 
> Also add rpmsg DMA library for all k3 platforms and DSP offload example
> for am62dxx-evm.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 2 ++
>   .../packagegroup-arago-tisdk-multimedia-sdk-target.bb       | 6 ++++++
>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb    | 6 ++++++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 0d39907a..84ae1303 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -53,6 +53,7 @@ UTILS:append:omap-a15 = " mmc-utils \
>   UTILS:append:k3 = " mmc-utils \
>                       switch-config \
>                       irqbalance \
> +                    ti-librpmsg-dma \
>                       ti-rpmsg-char \
>                       ti-rpmsg-char-examples \
>                       statcol \
> @@ -61,6 +62,7 @@ UTILS:append:k3 = " mmc-utils \
>   UTILS:append:k3 = " ti-rtos-echo-test-fw"
>   UTILS:append:am64xx = " pru-icss"
>   UTILS:append:am62xx = " pru-icss"
> +UTILS:append:am62dxx = " ti-librpmsg-dma-example"
>   
>   ARAGO_JAILHOUSE_ENABLE ?= "0"
>   UTILS:append:am62xx = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> index 95939c09..73dc48e6 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> @@ -13,7 +13,13 @@ MULTIMEDIA:append:dra7xx = " \
>       hevc-arm-decoder-staticdev \
>   "
>   
> +AUDIO = " \
> +    fftw-dev \
> +    libsndfile1-dev \

The -dev packages are not needed unless one wants to compile
programs on the target, which we usually do not do by default.

The libraries themselves will be pulled in by programs that
use them, so in this case adding `ti-librpmsg-dma-example`
should do that.

Andrew

> +"
> +
>   RDEPENDS:${PN} = "\
> +    ${AUDIO} \
>       ${MULTIMEDIA} \
>       packagegroup-arago-gst-sdk-target \
>   "
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index 3aa1a051..6b0397b3 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -11,6 +11,11 @@ MULTIMEDIA = " \
>       libcamera-gst \
>   "
>   
> +AUDIO = " \
> +    fftw \
> +    libsndfile1 \
> +"
> +
>   MULTIMEDIA:append:arago = " ffmpeg mpv"
>   
>   MULTIMEDIA:omapl138 = ""
> @@ -31,6 +36,7 @@ ACCEL_MM:append:omap-a15 = " \
>   "
>   
>   RDEPENDS:${PN} = "\
> +    ${AUDIO} \
>       packagegroup-arago-gst \
>       ${MULTIMEDIA} \
>       ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \

