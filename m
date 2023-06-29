Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393FEEB64DD
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 04:09:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1330.1688011759314451237
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 21:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t0ojVNF3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35T49Gke037549;
	Wed, 28 Jun 2023 23:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688011756;
	bh=NJFQqB5HNqe3ZS5jjEMAw41osjWi06Vxpt52dfw/AsY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=t0ojVNF3kwaYl0oJbqoYk53RbnYxxfbDfmp554Bq0LDlXlJRw855v2dopzsby8Z2I
	 y2ICghC5dyCXMl2ZRemmE+ePlIArC5omAZgrp9wYy7ZT/sbu1wSNbJQgNOPygWYTFs
	 GuSgZdh8TIPBgHFyjtSyLDUPlrH+hHFZauTLTac4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35T49Gsw086854
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 23:09:16 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 23:09:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 23:09:15 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35T49DBG054967;
	Wed, 28 Jun 2023 23:09:14 -0500
Message-ID: <09096e56-63b5-1d4e-f504-8a7ac545a9f1@ti.com>
Date: Thu, 29 Jun 2023 09:39:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v4 1/8] meta-arago-extras: sysrepo:
 Update checksum for nw-configurator
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <praneeth@ti.com>, <afd@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-2-r-gunasekaran@ti.com>
 <20230628170756.GU1518@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230628170756.GU1518@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 04:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14733



On 6/28/23 10:37 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 27, 2023 at 08:12:42PM +0530, Ravi Gunasekaran wrote:
>> Instead of using the source file to compute the license checksum,
>> use the license text only from source file.
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>
>> Changes since v3:
>> ----------------
>> No change
>>
>> Changes since v2:
>> ----------------
>> 1) Corrected the license type
>> 2) License checksum calculated based on the license header instead of the 
>> entire source file
>>
>> Changes since v1:
>> ---------------
>> No change
>>
>>  .../recipes-sysrepo/nw-configurator/nw-configurator.bb       | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>> index 5a152017..c5d9a86b 100644
>> --- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>> +++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>> @@ -1,6 +1,7 @@
>> -LICENSE="GPLv2"
>>  DESCRIPTION = "Sysrepo based repo to configure EST"
>> -LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
>> +
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf9bfb8372347877ad393660fa"
> 
> Thanks, this is a move in the right direction!
> 
> However, you also changed the LICENSE identifier w/o explaining the reason in 
> the commit message! This is rather critical... I checked the nw-configurator.c 
> and indeed GPLv2 was totally wrong, but you have to explain the change anyway. 
> Going forward there will be a new requirement for Yocto compliance to properly 
> explain license changes like that and there's a new field "License-Update:"
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describing_license_changes
> 

Noted. In future, I will add such reasoning in the commit message itself.

> 
>>  SRC_URI = "file://nw-configurator.c"

-- 
Regards,
Ravi

