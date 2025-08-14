Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EABBCA0EE0
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 00:30:58 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.11566.1755131457513268586
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 17:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GR7KW30z;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57E0UucR1762071
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 19:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755131456;
	bh=rLeUQDxOvIBLgwqogG5+ZuzTTBJDgjDitVITqFq073U=;
	h=Date:To:From:Subject;
	b=GR7KW30zq/YSxeddWVqKzdVrZz7Okt2hr0nLTOERcVyAoYZ0m4QlJkVOWwk1zA0ke
	 AxH0tnXBcRZIgQ9YuUtsfP/02TrxCPin07J+eQjDvUnRhvknbBd5AeDBDZpf0e8t3K
	 nAV25SjaOUSvoeXhq1vJqpjp9LfgT/riX3AwqgjU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57E0UuAq440340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 19:30:56 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 19:30:56 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Wed, 13 Aug
 2025 19:30:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 19:30:56 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57E0Ut6h2784761
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 19:30:56 -0500
Message-ID: <2ef0165c-b102-468c-a066-693b96f90712@ti.com>
Date: Wed, 13 Aug 2025 19:30:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: Apologies
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Aug 2025 00:30:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16469


I'm not sure why the PRC script did that.  The logs show no good reason 
for it to have sent all those messages.  I have added some additional 
checking code to try and prevent this in the future.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

