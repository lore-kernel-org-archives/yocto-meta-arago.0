Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3E6EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 22:05:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.20461.1687212296650440227
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 15:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zfmj+xgW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35JM4qax057737;
	Mon, 19 Jun 2023 17:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687212292;
	bh=s8sK2efycgzp7gVysPv78QnIxwBxs4+ngkPR3Yipudk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Zfmj+xgWjmGzQb4NWVgrVDoiGlxuLzHnLL+peQN99eRp8IGPIgDlufmGDNSZ+Y4at
	 ++xz6Ekb8tC37VvPFCHEQvzD8mm5jFzK577ThXxSlKOPcg+zqyalMoCQflRBIqhhBo
	 AeG3zW1FaL97cicH6HI99Ad1plowgve31d3AXZS8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35JM4qDH112763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 17:04:52 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 17:04:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 17:04:51 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35JM4pfK036327;
	Mon, 19 Jun 2023 17:04:51 -0500
Message-ID: <be4894a1-47c6-d2dc-a95c-8fd028a147a0@ti.com>
Date: Mon, 19 Jun 2023 17:04:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe-layersetup PATCH] configs: Update Kirkstone config for
 sysrepo
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <g-gupta@ti.com>
References: <20230616084538.10530-1-r-gunasekaran@ti.com>
 <20230616194834.GG1518@denix.org>
 <2c6142f3-a4f5-99d7-9738-65560e10e18c@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <2c6142f3-a4f5-99d7-9738-65560e10e18c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Jun 2023 22:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14655



On 6/18/2023 11:34 PM, Ravi Gunasekaran wrote:
> Denys,
> 
> On 6/17/23 1:18 AM, Denys Dmytriyenko wrote:
>> On Fri, Jun 16, 2023 at 02:15:38PM +0530, Ravi Gunasekaran wrote:
>>> NETCONF/YANG is implemented through netopeer2/sysrepo.
>>> A Yocto project for sysrepo is available in public domain[1].
>>>
>>> [1] is compatible only with Yocto Honister branch. So update
>>> the config with [2] which is fork of [1] for Kirkstone.
>>>
>>> [1] - https://github.com/sartura/meta-sysrepo
>>> [2] - https://github.com/ravig07/meta-sysrepo
>>
>> So, you are bumping many of the recipes in that layer, plus updating to the
>> new override syntax and setting compatibility with kirkstone. The PR has been
>> setting open since May 4 w/o any comments, so it's probably safe to assume the
>> layer is abandoned. Why not move the recipes to an active layer? At least to
>> meta-arago, or even better work on upstreaming them to meta-openembedded?
>>
>> Regardless, the changes for kirkstone appear to be safe to langdale and
>> mickledore - that would allow including the change in master builds too.
> 
> Yes, the PR has been open since quite some time.
> I did think of adding the recipes to meta-arago, but since the recipes already
> exists in the public domain, I felt moving them to meta-arago might not be the
> right way.

We should pull any needed recipes into meta-arago and not in a forked 
repo of meta-sysrepo...

Are you signing up to maintain your forked copy of meta-sysrepo for all 
time?  If not, then we should migrate your required changes into 
meta-arago-extras and just deal with the fact that we as TI need to 
maintain them.


>>
>>
>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>> ---
>>> I have sent a Pull Request for [2]. Once it gets merged, then the URI
>>> in the config.txt can be replaced with it.
>>>
>>>   configs/arago-kirkstone-config.txt | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
>>> index c2524a4..e80ab80 100644
>>> --- a/configs/arago-kirkstone-config.txt
>>> +++ b/configs/arago-kirkstone-config.txt
>>> @@ -10,6 +10,7 @@ meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,
>>>   meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
>>>   meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
>>>   oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>>> +meta-sysrepo,https://github.com/ravig07/meta-sysrepo,kirkstone,HEAD,layers=
>>>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
>>>   BITBAKE_INCLUSIVE_VARS=yes
>>> -- 
>>> 2.17.1
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

