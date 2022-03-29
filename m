Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9B0C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:36:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.6019.1648557402077289966
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U3gesSgn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TCaXjj127581;
	Tue, 29 Mar 2022 07:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648557393;
	bh=rtFwPYRdA1n/lOyusD3Z24ce7kzoqRRc+hsellVq+Lo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U3gesSgnh9AlnJTCuz1WWhOTX50Tu8/lgJxMVsjMhmL/ICHDdohBn3O+U7HjY8HRx
	 +LlrY2guO5HyqRtTOEwBZ9cDYK4k4DhQqfiS/FKvNQnEWF6uY1MS9yzXA1pduBaVTi
	 D26Xmqt7IFKRaPKGjwnxVTDOUumAAjGkklxH39bg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TCaXTn003741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Mar 2022 07:36:33 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 07:36:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 07:36:33 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TCaXQk046439;
	Tue, 29 Mar 2022 07:36:33 -0500
Message-ID: <76692209-c6ce-2c57-d963-a290a1531496@ti.com>
Date: Tue, 29 Mar 2022 07:36:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][master][PATCH 1/2] meta-arago: rename j7-evm to
 j721e-evm
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Darren Etheridge
	<detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220325184615.17398-1-afd@ti.com>
 <20220329045112.GR23554@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220329045112.GR23554@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:36:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13761



On 3/28/2022 11:51 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 25, 2022 at 01:46:14PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> In many places we use "j7" the family when we should be using a
>> specific SoC or EVM and vice-versa. For instance when including
>> graphics drivers we add for all "j7" family, but what we really
>> want is only for some specific j7 SoC.
>>
>> First step in untangling this is to make it clear that there is
>> no SoC called j7. There is a SoC called j721e with a j721e-evm.
>>
>> Fix up this naming here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> Tested-by: Denys Dmytriyenko <denys@konsulko.com>

Applied patch to master.


-- 
Ryan Eatmon    Texas Instruments, Inc.    reatmon@ti.com
--------------------------------------------------------
Analog EDA     -    Simulation Development    -     MGTS

