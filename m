Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C454C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:13:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1465.1686248014801645926
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GehGXj74;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358IDXRb032474;
	Thu, 8 Jun 2023 13:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686248013;
	bh=E2wLcZnd5ZqbI3G+Se1sKYHRP3WuWb4pXZJGhwAjXBs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GehGXj74gjZx36t5849aro7DqoRsqioEnf6rN/PWEHOi9cDEl8zCAJ0vfnB0C6qtB
	 1NVWUyYs0j8Aa8uG2XUmKr6AojSYR+gEizcWn00txvnoMG3WBAHSoJIlTrm+sp3kLR
	 BxidRxBLZstwY4Mt8KlADZyJHXLrLiCX3hqWWefk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358IDXOI093317
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 13:13:33 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 13:13:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 13:13:32 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358IDWZ4011769;
	Thu, 8 Jun 2023 13:13:32 -0500
Message-ID: <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
Date: Thu, 8 Jun 2023 13:13:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [oe-layersetup][PATCH 00/15] Sacrifice your first
 born to the linter
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230607200504.3810426-1-rs@ti.com>
 <20230608174829.GA9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230608174829.GA9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14545

On 6/8/23 12:48, Denys Dmytriyenko wrote:
> Do you need to correct From: and SoB: lines in all the patches?
> 

I don't know, do I? I did this work at home at 5AM with my personal 
machine, hence my personal account being the author, signer, and sender. 
If you need me to change it I can.

> 
> On Wed, Jun 07, 2023 at 03:04:49PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Last night someone in the beagle community reported some cryptic errors from
>> oe-layersetup so I took the time to address all of the issues reported
>> by Shellcheck and add some extra sanity checks.
>>
>> I tried to split it into reasonable segments.
>>
>> StaticRocket (15):
>>    oe-layertool-setup: prefer use of $() notation
>>    oe-layertool-setup: replace all x comparisons with -n/-z
>>    oe-layertool-setup: fix all the printf calls
>>    oe-layertool-setup: fix all quoting, switch eval to export
>>    oe-layertool-setup: only invoke read with -r
>>    oe-layertool-setup: check exit code directly
>>    oe-layertool-setup: guard all cd calls
>>    oe-layertool-setup: eliminate useless cat
>>    oe-layertool-setup: use subshell execution with redirect
>>    oe-layertool-setup: guard against invalid expression in case
>>    oe-layertool-setup: replace all calls to echo with printf
>>    oe-layertool-setup: drop unused variable
>>    oe-layertool-setup: add a path sanity check for oebase
>>    oe-layertool-setup: fix multi-line printfs
>>    oe-layertool-setup: add sanity check for layer names
>>
>>   oe-layertool-setup.sh | 435 +++++++++++++++++++++---------------------
>>   1 file changed, 220 insertions(+), 215 deletions(-)
>>
>> -- 
>> 2.40.1


