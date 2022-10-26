Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83389C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 15:57:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.9179.1666799849864664143
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 08:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AZ5Tyy+C;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29QFvOJl108066;
	Wed, 26 Oct 2022 10:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666799844;
	bh=16qZdLXo5DSfZqm/dDGa+eHBdhdh/rviHyxgrm6j5Hk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AZ5Tyy+C3zhEoyo+t9pToRdgJ5dscGfiyAKlUIZYnydGmMFJnHKcrO7gsO5f7R0go
	 iP2ypExKBOHtov8Ak9bZ7BFofJOPFAslWwJRlDhe0YhF6+XiN9Lrjq7+/kbPE4Dp30
	 TDcIedvgU2w5xzK4nQRd8CkMJAxTSAk7j838jr8Q=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29QFvOFU100799
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Oct 2022 10:57:24 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 26
 Oct 2022 10:57:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 26 Oct 2022 10:57:24 -0500
Received: from [10.250.34.50] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29QFvNef004694;
	Wed, 26 Oct 2022 10:57:23 -0500
Message-ID: <2609d2ed-47dc-9c64-3ad8-0763d8eaac62@ti.com>
Date: Wed, 26 Oct 2022 10:57:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-arago][master/kirkstone][PATCH] net-snmp: Remove broken
 net-snmp recipe
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20221025142235.12400-1-afd@ti.com>
 <20221025213020.GY22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221025213020.GY22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Oct 2022 15:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14092

On 10/25/22 4:30 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 25, 2022 at 09:22:35AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> This bbappend is not functional on the latest net-snmp. The additional
>> patches are ~61k lines, half the entire size of meta-arago. This extra
>> functionality should have been added to a forked repo and that is how we
>> should add this back if ever needed again. Remove this recipe.
> 
> I'm fine with removing these patches, since they break the latest snmp and
> it's been disabled in default images since Kirkstone.
> 
> But I'm not so sure about promoting forked repo concept...
> 
> The best approach, of course, is to get the patches submitted, reviewed and
> accepted upstream (snmp in this case).
> 
> Making changes with patches, instead of a forked repo, has this benefit - when
> updating layer to a new release/LTS and these patches start breaking, it gets
> noticed right away. It forces a decision - either someone is tasked with
> updating the patches and fixing the breakage, or they get removed/disabled at
> least.
> 

That's fair. I'd say we also start to reduce our wildcard bbappends, if the
package moves forward underneath, then we should re-evaluate anyway.

> Using a forked repo has a high possibility of a stale and outdated component,
> collecting security vulnerabilities, unfixed bugs, etc.
> 

I'd normally agree, but at some point the amount of change justifies the fork.
This would certainly be such a case.

Andrew

