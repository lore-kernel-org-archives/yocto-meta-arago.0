Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215A0C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:36:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6068.1648557407989149321
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EzUsp56o;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TCajFh099035;
	Tue, 29 Mar 2022 07:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648557405;
	bh=BnG8JJOKOYOVomlG/JFFpMl0HkTIn8nQ6F1JEqEzIRk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EzUsp56oEDZNPmdpezgTOWIrQtMLNU3Pxvu6TSQooJwD5de07v2NXobj4rOfDdXzT
	 S8GssahVY3fW0xmnRjrAppsqKEthp7q8psS65HJeqH/k21iNgbYXLSXnbVCP4EREZU
	 mLJ6eWwaUwjJydsEae/8mBKNNjhE0j6tZAp3OOKc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TCaj8E004138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 07:36:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 07:36:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 07:36:44 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TCaim1080069;
	Tue, 29 Mar 2022 07:36:44 -0500
Message-ID: <e62a8cb4-a6e1-f41a-710d-f690d4d701ea@ti.com>
Date: Tue, 29 Mar 2022 07:36:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][master][PATCH 2/2] arago-prefs: only the j721e SoC
 is currently supported
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220325184615.17398-1-afd@ti.com>
 <20220325184615.17398-2-afd@ti.com> <20220329045124.GS23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220329045124.GS23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13762



On 3/28/2022 11:51 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 01:46:15PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> There are now three SoCs in the J7 family, but only the j721e variant
>> is currently supported. Be specific here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Applied patch to master.

-- 
Ryan Eatmon    Texas Instruments, Inc.    reatmon@ti.com
--------------------------------------------------------
Analog EDA     -    Simulation Development    -     MGTS

