Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448D5C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 16:07:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.43524.1656346041736660619
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 09:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YbqCMocE;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25RG7IDa121968;
	Mon, 27 Jun 2022 11:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656346038;
	bh=zjJNazkw8YxU9b4RnLRatNxyqIkUqRGYeC7bVercZ70=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=YbqCMocEKYdZYtnHLpMmFnamS3TajJ4kTh4Jr4svaISUd3gGTxadYg2BwbqAdRNvx
	 1j7sNYglUSZKnCYhQRXllel7dlsSxSd25/WAX+lze1nZVksaH9G2Z2pg+M1GvMmAPb
	 CnkF/Ol/re3hG4TPHj/E0/O69RmtJMEJwTi+PRFs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25RG7IM2020069
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jun 2022 11:07:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Jun 2022 11:07:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Jun 2022 11:07:18 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25RG7I5i041210;
	Mon, 27 Jun 2022 11:07:18 -0500
Message-ID: <9da0eb07-d8c4-d3c5-572c-db4e57436de8@ti.com>
Date: Mon, 27 Jun 2022 11:07:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove
 uEnv.txt for k3
Content-Language: en-US
To: "Humphreys, Jonathan" <j-humphreys@ti.com>,
        "meta-arago@lists.yoctoproject.org"
 <meta-arago@lists.yoctoproject.org>,
        "Denys Dmytriyenko (denis@denix.org)" <denis@denix.org>
References: <20220609170520.31162-1-afd@ti.com>
 <16989.1655137101944524297@lists.yoctoproject.org>
 <ae85101ccf564b72adcd54a83965af3a@ti.com>
 <e2701861-a955-dee9-3234-2ec160fecd8c@ti.com>
 <ab8c4f5585f144a680686130e65010bf@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ab8c4f5585f144a680686130e65010bf@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Jun 2022 16:07:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13918


Not this one, but there are a number of other patches in line before it 
that might be.


On 6/27/2022 11:02, Humphreys, Jonathan wrote:
> I don't think the layer changes will have any impact on it.
> 
> +Denys
> 
> 
> -----Original Message-----
> From: Eatmon, Ryan <reatmon@ti.com>
> Sent: Monday, June 27, 2022 11:00 AM
> To: Humphreys, Jonathan <j-humphreys@ti.com>; meta-arago@lists.yoctoproject.org
> Subject: Re: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
> 
> 
> It is not applied in master yet.  I have not had time to keep it in sync with dunfell given all of the layer changes.  I believe Denys will be doing another sync up soon.
> 
> 
> 
> On 6/26/2022 15:18, Humphreys, Jonathan wrote:
>> Ryan, I do not see this patch applied to master.  Can you check?
>>
>> Thanks
>> Jon
>>
>> -----Original Message-----
>> From: meta-arago@lists.yoctoproject.org
>> <meta-arago@lists.yoctoproject.org> On Behalf Of Jonathan Humphreys
>> via lists.yoctoproject.org
>> Sent: Monday, June 13, 2022 11:18 AM
>> To: meta-arago@lists.yoctoproject.org
>> Subject: Re: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv:
>> remove uEnv.txt for k3
>>
>> On Thu, Jun  9, 2022 at 10:05 AM, Andrew Davis wrote:
>>
>>>
>>> This fixup should have been done in u-boot and not in a uEnv.txt file.
>>> It is not correct for all K3 anymore either. Remove it.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>
>>> Changes from v1:
>>>    - Subject s/tiusdk-uenv/tisdk-uenv
>>>
>>>    .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
>>>    1 file changed, 19 deletions(-)
>>>    delete mode 100644
>>> meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>>>
>>> diff --git
>>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>>> b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>>> deleted file mode 100644
>>> index 80ea34f5..00000000
>>> ---
>>> a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>>> +++ /dev/null
>>> @@ -1,19 +0,0 @@
>>> -# This uEnv.txt file can contain additional environment settings
>>> that you -# want to set in U-Boot at boot time.  This can be simple
>>> variables such -# as the serverip or custom variables.  The format of this file is:
>>> -#    variable=value
>>> -# NOTE: This file will be evaluated after the bootcmd is run and the
>>> -#       bootcmd must be set to load this file if it exists (this is the
>>> -#       default on all newer U-Boot images.  This also means that some
>>> -#       variables such as bootdelay cannot be changed by this file since
>>> -#       it is not evaluated until the bootcmd is run.
>>> -
>>
>> Shouldn't we keep the above, as this is generic information about how to use uEnv.txt and when it is invoked?
>>
>>> -# The specific board is not able to be automatically detected. The
>>> below is a -# workaround to set a sane default incase the user has
>>> not manually configured -# a specific board.
>>> -def_board_name="am65x"
>>> -
>>> -# Check if using default board_name when name_overlays is not set
>>> -check_for_board=if test $name_overlays; then echo "Using board_name
>>> = $board_name"; else setenv board_name $def_board_name; fi
>>> -
>>> -uenvcmd=run check_for_board; run findfdt
>>> --
>>> 2.36.1
>>>
>>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#13896):
>> https://lists.yoctoproject.org/g/meta-arago/message/13896
>> Mute This Topic: https://lists.yoctoproject.org/mt/91650730/3617106
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub
>> [j-humphreys@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

