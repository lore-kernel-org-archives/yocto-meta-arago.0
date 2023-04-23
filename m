Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC54C6FD18
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 18:49:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.33611.1682275736834684853
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 23 Apr 2023 11:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cQk+Wqjr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33NImplk004668;
	Sun, 23 Apr 2023 13:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682275731;
	bh=SFAtxlzis+4IxAiXOUCv7guuGiFvGtolhQQd3nXR6CI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cQk+Wqjr4b4JxG+GMSmUJ+AV3sw5VQO82p+ySijwFnn6lTjzLJFULgerPhLW8R39B
	 IjM/QIahyEIkNzBNMjGV+Y0EW0Rd7fn8iPorB+9iIe9+JhcQ8zKKc63s+ULtvRjZO+
	 YVOVBLZvj4pQjY3l9ycGT8x+nHUbvpp1QSzbVOag=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33NImouf005675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 23 Apr 2023 13:48:50 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 23
 Apr 2023 13:48:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sun, 23 Apr 2023 13:48:49 -0500
Received: from [10.249.32.24] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33NImnVk006068;
	Sun, 23 Apr 2023 13:48:49 -0500
Message-ID: <0d1c1491-a9fe-b0a3-ad2b-bc6c859d402a@ti.com>
Date: Sun, 23 Apr 2023 13:48:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arago][master/kirkstone][PATCH v3 0/2] Add support for
 ltp-ddt_20230127
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230422225555.12772-1-reatmon@ti.com>
 <20230423000832.GF9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230423000832.GF9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 23 Apr 2023 18:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14341


Yes.  The patch to the 2021 version is already on Kirkstone.  But we are 
planning on removing that version completely once we get our LTS 
migration finished.  The 2023 version is what will live long term on 
kirkstone/master.

So, I had already merged the "bad" patch with the missing space to 
kirkstone for 2021.  I did that so that I could pick up Andrew's patch 
about removing the libc headers.

If the space is something that causes any down stream problems before we 
get to removing the ltp-ddt 2021 version then we can patch it. 
Otherwise, my testing did not show an issue with the patch as it is.


On 4/22/2023 19:08, Denys Dmytriyenko wrote:
> I'm a bit confused - I see the original patch is already merged to kirkstone
> and master:
> 
> https://git.yoctoproject.org/meta-arago/log/
> https://git.yoctoproject.org/meta-arago/log/?h=kirkstone
> 
> 
> On Sat, Apr 22, 2023 at 05:55:53PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> The internal testing team would like to move to this version as the
>> basis for our internal ltp-ddt.  So we need to capture the recipe
>> settings for this version from oe-core master and provide a new version
>> for us to overload.
>>
>> v3: Put the space in the correct place...
>> v2: Add missing space to :append line in ltp-ddt_20230127.bb
>>
>> Ryan Eatmon (2):
>>    ltp: Add version 20230127 from oe_core master
>>    ltp-ddt: Add support for version 20230127
>>
>>   .../ltp-ddt/ltp-ddt_20230127.bb               |  47 ++++++
>>   ...002-Remove-OOM-tests-from-runtest-mm.patch |  35 +++++
>>   .../ltp/ltp/disable_hanging_tests.patch       |  27 ++++
>>   .../recipes-extended/ltp/ltp_20230127.bb      | 140 ++++++++++++++++++
>>   4 files changed, 249 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>>   create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
>>   create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
>>   create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
>>
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

