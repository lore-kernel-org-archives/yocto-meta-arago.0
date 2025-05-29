Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F9AC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 15:27:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.23909.1748532435275071660
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 May 2025 08:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IKsqNl8v;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TFRCfB3552767;
	Thu, 29 May 2025 10:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748532432;
	bh=XF6n91U42GR0EaRjNVHQB7QEW488hVqmksJf2Nnk0Pg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IKsqNl8vMHslFr/Qy3UegFAzXjAb8qpqRb32z47S72CKmLChjorLxts0rG6HiA1SR
	 WzncjfhSmOYUEuDR05pQqKzmCEqrKt2UHcWUtixjsP5YXQjBd72eERt0A4ThwDsBHN
	 jfakjA3pMVEt2bqNSfOqPkZVmCGFi9Ghopd/QU60=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TFRCSZ125050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 10:27:12 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 10:27:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 10:27:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TFRB6x1722708;
	Thu, 29 May 2025 10:27:11 -0500
Message-ID: <97bcdc74-0474-4420-a15c-14b5bfec1298@ti.com>
Date: Thu, 29 May 2025 10:27:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-distro: packagegroups:
 Add additional libraries for audio
To: Denys Dmytriyenko <denis@denix.org>
CC: <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>
References: <20250528102948.327229-1-p-bhagat@ti.com>
 <6fed1700-8ad2-454c-b3d8-48e5e0d76bed@ti.com>
 <20250529145742.GS18383@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250529145742.GS18383@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 May 2025 15:27:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16242

On 5/29/25 9:57 AM, Denys Dmytriyenko wrote:
> On Thu, May 29, 2025 at 09:27:19AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> On 5/28/25 5:29 AM, Paresh Bhagat via lists.yoctoproject.org wrote:
>>> Add fftw and libsndfile1 libraries in multimedia package group, which are
>>> used for signal processing and audio manipulation. Update corresponding
>>> sdk target file to package header files and libraries for development.
>>>
>>> Also add rpmsg DMA library for all k3 platforms and DSP offload example
>>> for am62dxx-evm.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>>   .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 2 ++
>>>   .../packagegroup-arago-tisdk-multimedia-sdk-target.bb       | 6 ++++++
>>>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb    | 6 ++++++
>>>   3 files changed, 14 insertions(+)
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>> index 0d39907a..84ae1303 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>> @@ -53,6 +53,7 @@ UTILS:append:omap-a15 = " mmc-utils \
>>>   UTILS:append:k3 = " mmc-utils \
>>>                       switch-config \
>>>                       irqbalance \
>>> +                    ti-librpmsg-dma \
>>>                       ti-rpmsg-char \
>>>                       ti-rpmsg-char-examples \
>>>                       statcol \
>>> @@ -61,6 +62,7 @@ UTILS:append:k3 = " mmc-utils \
>>>   UTILS:append:k3 = " ti-rtos-echo-test-fw"
>>>   UTILS:append:am64xx = " pru-icss"
>>>   UTILS:append:am62xx = " pru-icss"
>>> +UTILS:append:am62dxx = " ti-librpmsg-dma-example"
>>>   ARAGO_JAILHOUSE_ENABLE ?= "0"
>>>   UTILS:append:am62xx = " ${@oe.utils.conditional("ARAGO_JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
>>> index 95939c09..73dc48e6 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
>>> @@ -13,7 +13,13 @@ MULTIMEDIA:append:dra7xx = " \
>>>       hevc-arm-decoder-staticdev \
>>>   "
>>> +AUDIO = " \
>>> +    fftw-dev \
>>> +    libsndfile1-dev \
>>
>> The -dev packages are not needed unless one wants to compile
>> programs on the target, which we usually do not do by default.
>>
>> The libraries themselves will be pulled in by programs that
>> use them, so in this case adding `ti-librpmsg-dma-example`
>> should do that.
> 
> No, the change is correct, as it is for the -sdk-target packagegroup.
> 
> This is specifically targeting the linux-devkit (host side SDK) in order to
> install the headers and other development pieces for cross-compiling on the
> host. This is also mentioned in the commit message above.
> 

I thought we called those packagegroups "-sdk-host"? I'm probably just confused
here then.

Side question then, how do we determine what packages should have their -dev packages
installed in the host SDK? Could we instead make this automatic so it simply includes
all the target libraries' -dev packages in the host SDK?

> The corresponding rootfs side of the change is down below w/o -dev packages.
> 

My comment about letting the dependent libraries be pulled in by the
application that uses them still applies to the below then.

Andrew

> 
>> Andrew
>>
>>> +"
>>> +
>>>   RDEPENDS:${PN} = "\
>>> +    ${AUDIO} \
>>>       ${MULTIMEDIA} \
>>>       packagegroup-arago-gst-sdk-target \
>>>   "
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
>>> index 3aa1a051..6b0397b3 100644
>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
>>> @@ -11,6 +11,11 @@ MULTIMEDIA = " \
>>>       libcamera-gst \
>>>   "
>>> +AUDIO = " \
>>> +    fftw \
>>> +    libsndfile1 \
>>> +"
>>> +
>>>   MULTIMEDIA:append:arago = " ffmpeg mpv"
>>>   MULTIMEDIA:omapl138 = ""
>>> @@ -31,6 +36,7 @@ ACCEL_MM:append:omap-a15 = " \
>>>   "
>>>   RDEPENDS:${PN} = "\
>>> +    ${AUDIO} \
>>>       packagegroup-arago-gst \
>>>       ${MULTIMEDIA} \
>>>       ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \

