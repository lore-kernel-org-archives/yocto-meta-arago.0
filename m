Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCB9C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 13:26:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.6216.1665408391263158517
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BZMdqyYI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29ADQRD4097217;
	Mon, 10 Oct 2022 08:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665408387;
	bh=E+eIuO9aQAGJP6Z1UwclXdoAXdkp2zI1cb2vsX4dRcA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BZMdqyYIAN0uf4Z6x4XqjQg5EAe+A+k1rscDvihcNWp1CwFUi5B6t3onJ+6RXecrm
	 nywfWv3CFadukrjW09UczvHbW28wTQagLVm0P+KwWHBhSb4/Swy9OrN2wKrJCrdt8I
	 GNhSBbDfw8Bqo7/PvFkpLa2BfsuChMMedmAVAAaQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29ADQRgd020768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Oct 2022 08:26:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 08:26:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 08:26:26 -0500
Received: from [10.250.35.37] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29ADQQvc085530;
	Mon, 10 Oct 2022 08:26:26 -0500
Message-ID: <e6d2ae4c-9684-98b1-c8a6-ad28ecc4f49d@ti.com>
Date: Mon, 10 Oct 2022 08:26:26 -0500
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
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221007201014.GA30861@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 13:26:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14062

On 10/7/22 3:10 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 06, 2022 at 10:06:28AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> Now that we have SoC names, we can avoid adding features based on the
>> board name. We expect folks to create their own boards based on these
>> SoCs, and so using the TI made EVM board name everywhere adds extra churn
>> when adding a new board. Plus it is more correct for most of these
>> features as they depend on the SoC, not on the EVM board.
>>
>> One other thing we do here is to not use the generic "j7" name,
>> the current and future J7 devices are far to feature diverse
>> to group at this level. Grouping like that will lead to the wrong
>> things getting enabled as new J7 SoCs are added.
> 
> Hmm, this second part is rather backwards (IMO) in some places, see below.
> 
> 
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> index 3c31ba18..296eef7a 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
>> @@ -24,7 +24,9 @@ DTB_FILTER:am57xx-hs-evm = "${DTB_FILTER:am57xx-evm}"
>>   DTB_FILTER:ti43x = "am43"
>>   DTB_FILTER:omapl138 = "da850"
>>   DTB_FILTER:am65xx = "am65"
>> -DTB_FILTER:j7 = "j721e"
>> +DTB_FILTER:j721e = "j721e"
>> +DTB_FILTER:j7200 = "j7200"
>> +DTB_FILTER:j721s2 = "j721s2"
> 
> Yes, here it does make perfect sense.
> 
> 
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> index f4e72a89..c01e9497 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>> @@ -61,9 +61,9 @@ UTILS:append:am64xx = " ti-rtos-firmware pru-icss"
>>   UTILS:append:am62xx = " ti-rtos-firmware"
>>   #UTILS:append:am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
>>   UTILS:append:am65xx = " ti-rtos-firmware pru-icss"
>> -UTILS:append:j7 = " ti-rtos-firmware"
>> -UTILS:append:j721e-evm = " pru-icss"
>> -UTILS:append:j721e-hs-evm = " pru-icss"
>> +UTILS:append:j721e = " ti-rtos-firmware pru-icss"
>> +UTILS:append:j7200 = " ti-rtos-firmware"
>> +UTILS:append:j721s2 = " ti-rtos-firmware"
> 
> Here - not so much. ti-rtos-firmware is applicable to all j7. So, I'd leave
> that line alone and only replace adding pru-icss to specific EVMs to adding it
> to j721e SoC family.
> 
> Or go even further - ti-rtos-firmware is common to all k3 platforms, so all
> the individual am65xx, am64xx and am62xx, along with j7, could be replaced
> with one line:
> 
> UTILS:append:k3 = " ti-rtos-firmware"
> 
> And then add pri-icss or other extra FW to specific SoC families only.
> 

If you want I can make this re-arrangement in a follow up patch.

> 
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>> index e16e4d51..e6e0b915 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
>> @@ -19,7 +19,9 @@ ANALYTICS = ""
>>   #    ${@['','qt-opencv-opencl-opengl-multithreaded'][oe.utils.all_distro_features(d, 'opencv opencl opengl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'gpu dsp', True, False, d)]} \
>>   #    ${@['','barcode-roi'][oe.utils.all_distro_features(d, 'opencv', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
>>   #"
>> -ANALYTICS:j7 = ""
>> +ANALYTICS:j721e = ""
>> +ANALYTICS:j7200 = ""
>> +ANALYTICS:j721s2 = ""
> 
> Well, this is probably completely wrong by now, anyway.
> 

Yes it probably is, but then my point in this patch was to
not make any changes to functionality (or as few as possible).
So if it is broken now, it was broken just the same before.

> 
>>   ANALYTICS:omapl138 = ""
>>   
>>   RDEPENDS:${PN} = "\
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>> index 99a6cc82..5f56f8be 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
>> @@ -78,7 +78,15 @@ ARAGO_TI_TEST:append:k3 = " \
>>       k3conf \
>>   "
>>   
>> -ARAGO_TI_TEST:append:j7 = " \
>> +ARAGO_TI_TEST:append:j721e = " \
>> +    ufs-utils \
>> +"
>> +
>> +ARAGO_TI_TEST:append:j7200 = " \
>> +    ufs-utils \
>> +"
>> +
>> +ARAGO_TI_TEST:append:j721s2 = " \
>>       ufs-utils \
>>   "
> 
> ufs-utils is quite generic and should probably be added to k3 or maybe even
> all platforms...
> 

Same as above, would you like this done in a follow up patch? This patch only
fans out the name keeping the same functionality as before. If that exposes
existing issues or opportunities for cleanup, then I can make those next.

Andrew


