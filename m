Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F5EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 21:04:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1374.1687295081105516968
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 14:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TcZsuFYP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KL4bmo128588;
	Tue, 20 Jun 2023 16:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687295077;
	bh=EXW7XqI6NkilicLwh8S+J0jvzf/TVGOZ+1tE/SnL6VU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TcZsuFYPgBA8azt2Gsf9koJ34TN060PHiXveK3FVMYfYSNVbfzqc/89/mCnGuwrOD
	 kvO9xN+qBsCDyJD24gp9kqmMZwUSyV7aLwUi0OmWjSiCwfKUXnDWcYfUnahBBqt84m
	 p9R4L2mzDPuyIWDcB1wpXfO+8ECW/YLNS23Vyf84=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KL4bZI014299
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 16:04:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 16:04:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 16:04:37 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KL4bAJ004531;
	Tue, 20 Jun 2023 16:04:37 -0500
Message-ID: <f5162a42-1855-b00c-c461-5bdb7c6cd504@ti.com>
Date: Tue, 20 Jun 2023 16:04:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [DISCUSSION] Flutter Enablement - Meta-Arago vs PSDK
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <937ef202-c3dc-6e5b-963f-def28a4d130b@ti.com>
 <9ef1f6e6-6ee6-e6dd-8b1d-08188a71cc5e@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <9ef1f6e6-6ee6-e6dd-8b1d-08188a71cc5e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 21:04:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14662

On 6/20/23 14:07, Andrew Davis wrote:
> On 6/20/23 1:44 PM, Randolph Sapp wrote:
>> Hey,
>>
>> People keep asking about flutter and I know there has been effort to 
>> explicitly enable it for 9.0.
>>
>> Should it belong in meta-arago or meta-processor-sdk?
>>
>> I can see an argument for both, it essentially being another widget 
>> based UI toolkit, it should belong in the same layer that enables and 
>> adds dependencies for Qt. On the other hand, it's a higher level tool 
>> with some interesting dependencies that not every SDK may want to 
>> inherit.
>>
>> What do we think?
>>
> 
> Do we need any device specific fixups to enable this on our hardware? If
> so then meta-ti is the place (I'd argue the Qt fixups belonged there too 
> given
> they where specific to our GPU and without them (for instance Poky on 
> meta-ti)
> things did not work correctly).
> 
> If not, then no harm in enabling it in meta-arago, will help with
> build test coverage.
> 
> Andrew

I've been told there are no device specific patches required. Should 
just be adding a new layer to oe-layersetup and new package for the 
meta-arago graphics package group.

