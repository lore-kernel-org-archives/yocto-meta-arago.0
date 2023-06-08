Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9816DC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 13:56:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9757.1686232599179363058
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 06:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kzqxkg+I;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358DuaTU075023;
	Thu, 8 Jun 2023 08:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686232596;
	bh=excz1IBrGhQiyuRipcJoATsSLiE1vdv9emTx162tjGg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Kzqxkg+I1/u4gSE6oOFXs1/p0hV6AT3fe8e26BcU0D2+XDly1QBHqB151CkqIjMJA
	 rCRABrwwY/JqCn+K8tYuYDCb4O4MRpqAKfJ6Y7DZ/Iijs96Ff2pcfqCqfy6AtKGwt8
	 mXKQkkHKk9oW1y647MQQjVxr3tCG4EYvmmhzBSBc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Dua57019958
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 08:56:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 08:56:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 08:56:35 -0500
Received: from [10.250.37.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358DuZkJ111554;
	Thu, 8 Jun 2023 08:56:35 -0500
Message-ID: <5ef5af6f-f3ec-c07a-d1fd-7c762e14d062@ti.com>
Date: Thu, 8 Jun 2023 08:56:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][kirkstone/master][RFC] Enable sudo in meta-arago
Content-Language: en-US
To: <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230608130356.341469-1-c-shilwant@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230608130356.341469-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 13:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14538

On 6/8/23 8:03 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> We plan to add sudo in meta-arago as weston will now launch with normal user. sudo is required for
> Demo Store which runs on top of weston and will need sudo to set some docker proxies before actually starting the
> application.

Are you sure you need sudo for this? Sounds like you might be working around using proper
owner/permissions on files. Could you give more details on what you want to run with
root permissions?

https://www.redhat.com/sysadmin/sysadmins-dont-sudo

Andrew

> 
> I see openembedded-core provides sudo under meta/recipes-extended but needed comments/opinion
> regarding this topic to add "sudo" before actually starting to work on it.
> 
> --
> Chirag Shilwant
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14537): https://lists.yoctoproject.org/g/meta-arago/message/14537
> Mute This Topic: https://lists.yoctoproject.org/mt/99406119/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

