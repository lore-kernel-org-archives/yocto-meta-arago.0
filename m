Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8755C6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:56:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.24446.1677682605098550889
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 06:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VehZaPAz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321EufY7042837;
	Wed, 1 Mar 2023 08:56:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677682601;
	bh=Ix1GS/nypm6oSzqXX059VsKsU0YZ75yxYFwQnQRTD3g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VehZaPAzcg0i4vmQjrsuAD94ulbHdT1rVKyT5IsrH6rP17eYjrnnJDGnjX+8lAnfL
	 A2PnH81hrvLlid+FHE3I2bQ/HRX6iYZ+MM60BXC+HctWBkf+ozJq8mQw9J7KQFpYes
	 +df8dj7ZKit26kTcmvPZjZpGLFyAbo20ahyShjZA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321EufpU020309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Mar 2023 08:56:41 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 08:56:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 08:56:40 -0600
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321EueDk027954;
	Wed, 1 Mar 2023 08:56:40 -0600
Message-ID: <c9c0b95f-4b61-a74d-aef9-f0656790c128@ti.com>
Date: Wed, 1 Mar 2023 08:56:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH 2/2] weston: drop patch
 reverting GL_EXT_unpack_subimage requirement
To: Denys Dmytriyenko <denis@denix.org>, Andrew Davis <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230224101240.4132411-1-denis@denix.org>
 <20230224101240.4132411-2-denis@denix.org>
 <a328ae4f-51af-000d-17d8-8e2889462ee2@ti.com>
 <20230228232943.GM22689@denix.org>
 <654a4a43-ece4-feb2-85ac-b0ce5cf38211@ti.com>
 <20230301001519.GO22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230301001519.GO22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Mar 2023 14:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14241



On 2/28/2023 6:15 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 28, 2023 at 05:57:40PM -0600, Andrew Davis wrote:
>> On 2/28/23 5:29 PM, Denys Dmytriyenko wrote:
>>> On Fri, Feb 24, 2023 at 08:16:25AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>>>> On 2/24/23 4:12 AM, Denys Dmytriyenko wrote:
>>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>>
>>>>> With the updated graphics recipes in meta-ti this hack is no longer needed.
>>>>
>>>> Did you test that? What board and with what program?
>>>
>>> If I remember correctly, there was a build failure in the past with newer
>>> Weston complaining that the extenstion does not exist in the old binary DDK.
>>> Since I haven't seen this failure with the updated Mesa-based graphics stack,
>>> I assumed that is now resolved.
>>>
>>> My testing was mostly with Rogue and I see in the commit log that this is
>>> specific to SGX, which currently builds full software-rendering stack w/o any
>>> HW acceleration.
>>>
>>> Is this extension a pure software implementation in Mesa or does it require
>>> corresponding HW support? If the latter, then we definitely still need this
>>> revert and my patch removing it can be dropped.
>>>
>>
>> Unfortunately it needs to be handled in the GPU driver on the UM side, so
>> not something Mesa can fix for us. And the error only shows up as a runtime
>> issue when you try to start Weston and it sees the extension is not available.
>>
>> We will need to keep this patch until someone can add the software emulation
>> of this function inside the SGX UM driver. It is on my todo list for someday..
> 
> Andrew,
> 
> Thanks for confirming.
> 
> Ryan,
> 
> We still need Andrew's revert, please drop my patch from the queue. Thanks.

Roger that.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

