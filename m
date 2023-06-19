Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0858AEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 04:34:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1168.1687149260017463981
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 18 Jun 2023 21:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aVF3wzon;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35J4YG4A058581;
	Sun, 18 Jun 2023 23:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687149256;
	bh=82hnmr0e7BR7NVyi60wiIClizudWZOOohSlrKivQwjE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aVF3wzonYwjqB5JWTzHc571DGMCEUNAeJaYBUMtkLGGVu9sM5GTBhribeNn7dU8Dd
	 OF6eujlRqQLfP7ij2Rt5lpsmPi6DBRFtNTvhT5YU5AjK1WKBBl4rosNzuiCNayhlUz
	 3uGsIUhBkc8sXxDgy3rSmm1iCMWTdSPAOCiujMf0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35J4YGER007280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 18 Jun 2023 23:34:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 18
 Jun 2023 23:34:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 18 Jun 2023 23:34:15 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35J4YDu4068143;
	Sun, 18 Jun 2023 23:34:14 -0500
Message-ID: <2c6142f3-a4f5-99d7-9738-65560e10e18c@ti.com>
Date: Mon, 19 Jun 2023 10:04:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe-layersetup PATCH] configs: Update Kirkstone config for
 sysrepo
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <g-gupta@ti.com>
References: <20230616084538.10530-1-r-gunasekaran@ti.com>
 <20230616194834.GG1518@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230616194834.GG1518@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Jun 2023 04:34:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14651

Denys,

On 6/17/23 1:18 AM, Denys Dmytriyenko wrote:
> On Fri, Jun 16, 2023 at 02:15:38PM +0530, Ravi Gunasekaran wrote:
>> NETCONF/YANG is implemented through netopeer2/sysrepo.
>> A Yocto project for sysrepo is available in public domain[1].
>>
>> [1] is compatible only with Yocto Honister branch. So update
>> the config with [2] which is fork of [1] for Kirkstone.
>>
>> [1] - https://github.com/sartura/meta-sysrepo
>> [2] - https://github.com/ravig07/meta-sysrepo
> 
> So, you are bumping many of the recipes in that layer, plus updating to the 
> new override syntax and setting compatibility with kirkstone. The PR has been 
> setting open since May 4 w/o any comments, so it's probably safe to assume the 
> layer is abandoned. Why not move the recipes to an active layer? At least to 
> meta-arago, or even better work on upstreaming them to meta-openembedded?
> 
> Regardless, the changes for kirkstone appear to be safe to langdale and 
> mickledore - that would allow including the change in master builds too.

Yes, the PR has been open since quite some time. 
I did think of adding the recipes to meta-arago, but since the recipes already
exists in the public domain, I felt moving them to meta-arago might not be the
right way. 

> 
> 
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>> I have sent a Pull Request for [2]. Once it gets merged, then the URI
>> in the config.txt can be replaced with it.
>>
>>  configs/arago-kirkstone-config.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
>> index c2524a4..e80ab80 100644
>> --- a/configs/arago-kirkstone-config.txt
>> +++ b/configs/arago-kirkstone-config.txt
>> @@ -10,6 +10,7 @@ meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,
>>  meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
>>  meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
>>  oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
>> +meta-sysrepo,https://github.com/ravig07/meta-sysrepo,kirkstone,HEAD,layers=
>>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>  OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
>>  BITBAKE_INCLUSIVE_VARS=yes
>> -- 
>> 2.17.1

-- 
Regards,
Ravi

