Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEF8C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 17:34:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.10641.1665509654674221180
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 10:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f8dRhk9x;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BHY4RQ060540;
	Tue, 11 Oct 2022 12:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665509644;
	bh=cjyVuHfmT4ebYyzFeSogFcfH8GVfSmf5wxARfS4Ht7g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f8dRhk9xLIW4g2YTVfs/rExOh5HHCrRdhNGGgV/FzSJGPqUlt27KOyfDtfQqnEYJ/
	 KVt+YI0AcE/6/4nw54kwjs1Cqp0+OJnJ7kUpaP2tdDjT6oAIm1Li2fec/ft2MaKN70
	 V0x+/6GoO4i+NgRmB13eorRfS8K7Zb8hE2wIuIMk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BHY4YV021711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 12:34:04 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 12:34:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 12:34:04 -0500
Received: from [10.250.35.37] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BHY4SR017362;
	Tue, 11 Oct 2022 12:34:04 -0500
Message-ID: <17c22760-c873-ff4c-093f-6ea77f0bb9c7@ti.com>
Date: Tue, 11 Oct 2022 12:34:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-arago][master/kirkstone][PATCH 7/7] meta-arago: Use new J7
 SoC names over specific board names
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20221006150628.17044-1-afd@ti.com>
 <20221006150628.17044-7-afd@ti.com> <20221007201014.GA30861@denix.org>
 <e6d2ae4c-9684-98b1-c8a6-ad28ecc4f49d@ti.com>
 <20221011013533.GE30861@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221011013533.GE30861@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 17:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14068

On 10/10/22 8:35 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 10, 2022 at 08:26:26AM -0500, Andrew Davis wrote:
>> On 10/7/22 3:10 PM, Denys Dmytriyenko wrote:
>>> On Thu, Oct 06, 2022 at 10:06:28AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>>>> Now that we have SoC names, we can avoid adding features based on the
>>>> board name. We expect folks to create their own boards based on these
>>>> SoCs, and so using the TI made EVM board name everywhere adds extra churn
>>>> when adding a new board. Plus it is more correct for most of these
>>>> features as they depend on the SoC, not on the EVM board.
>>>>
>>>> One other thing we do here is to not use the generic "j7" name,
>>>> the current and future J7 devices are far to feature diverse
>>>> to group at this level. Grouping like that will lead to the wrong
>>>> things getting enabled as new J7 SoCs are added.
>>>
>>> Hmm, this second part is rather backwards (IMO) in some places, see below.
>>>
>>>
>>>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>>> index 3c31ba18..296eef7a 100644
>>>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>>>> @@ -24,7 +24,9 @@ DTB_FILTER:am57xx-hs-evm = "${DTB_FILTER:am57xx-evm}"
>>>>   DTB_FILTER:ti43x = "am43"
>>>>   DTB_FILTER:omapl138 = "da850"
>>>>   DTB_FILTER:am65xx = "am65"
>>>> -DTB_FILTER:j7 = "j721e"
>>>> +DTB_FILTER:j721e = "j721e"
>>>> +DTB_FILTER:j7200 = "j7200"
>>>> +DTB_FILTER:j721s2 = "j721s2"
>>>
>>> Yes, here it does make perfect sense.
>>>
>>>
>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>>> index f4e72a89..c01e9497 100644
>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>>> @@ -61,9 +61,9 @@ UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
>>>>   UTILS:append:am62xx = " ti-rtos-firmware"
>>>>   #UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
>>>>   UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
>>>> -UTILS:append:j7 = " ti-rtos-firmware"
>>>> -UTILS:append:j721e-evm = " pru-icss"
>>>> -UTILS:append:j721e-hs-evm = " pru-icss"
>>>> +UTILS:append:j721e = " ti-rtos-firmware pru-icss"
>>>> +UTILS:append:j7200 = " ti-rtos-firmware"
>>>> +UTILS:append:j721s2 = " ti-rtos-firmware"
>>>
>>> Here - not so much. ti-rtos-firmware is applicable to all j7. So, I'd leave
>>> that line alone and only replace adding pru-icss to specific EVMs to adding it
>>> to j721e SoC family.
>>>
>>> Or go even further - ti-rtos-firmware is common to all k3 platforms, so all
>>> the individual am65xx, am64xx and am62xx, along with j7, could be replaced
>>> with one line:
>>>
>>> UTILS:append:k3 = " ti-rtos-firmware"
>>>
>>> And then add pri-icss or other extra FW to specific SoC families only.
>>>
>>
>> If you want I can make this re-arrangement in a follow up patch.
>>
>>>
>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>>>> index e16e4d51..e6e0b915 100644
>>>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>>>> @@ -19,7 +19,9 @@ ANALYTICS = ""
>>>>   #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
>>>>   #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
>>>>   #"
>>>> -ANALYTICS:j7 = ""
>>>> +ANALYTICS:j721e = ""
>>>> +ANALYTICS:j7200 = ""
>>>> +ANALYTICS:j721s2 = ""
>>>
>>> Well, this is probably completely wrong by now, anyway.
>>>
>>
>> Yes it probably is, but then my point in this patch was to
>> not make any changes to functionality (or as few as possible).
>> So if it is broken now, it was broken just the same before.
>>
>>>
>>>>   ANALYTICS:omapl138 = ""
>>>>   RDEPENDS:${PN} = "\
>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>>>> index 99a6cc82..5f56f8be 100644
>>>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>>>> @@ -78,7 +78,15 @@ ARAGO_TI_TEST:append:k3 = " \
>>>>       k3conf \
>>>>   "
>>>> -ARAGO_TI_TEST:append:j7 = " \
>>>> +ARAGO_TI_TEST:append:j721e = " \
>>>> +    ufs-utils \
>>>> +"
>>>> +
>>>> +ARAGO_TI_TEST:append:j7200 = " \
>>>> +    ufs-utils \
>>>> +"
>>>> +
>>>> +ARAGO_TI_TEST:append:j721s2 = " \
>>>>       ufs-utils \
>>>>   "
>>>
>>> ufs-utils is quite generic and should probably be added to k3 or maybe even
>>> all platforms...
>>>

Looks like UFS is only supported on J721e today, so when "j7" was
used above, they only meant "j721e". Will fix.

>>
>> Same as above, would you like this done in a follow up patch? This patch only
>> fans out the name keeping the same functionality as before. If that exposes
>> existing issues or opportunities for cleanup, then I can make those next.
> 
> It would have been fine to do further cleanup/optimization/collapsing of the
> code in a followup patch, if you weren't first expanding it here...
> 
> In other words, it seems replacing "j7" override with more specific
> "j721e/j7200/j721s2" overrides only makes sense for DTB_FILTER case and
> should be left alone in other 3 places.
> 

I'll break the other ones out into patches fixing as suggested.

The goal is to remove the name "j7" everywhere, grouping for
the "J7" family is not useful, there is nothing common today
to all J7 devices that is not also common to all K3. It is
an unneeded level of grouping that is now causing issues and
mistakes when adding new platforms.

Andrew

