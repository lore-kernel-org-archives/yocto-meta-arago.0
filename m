Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8185BC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:25:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.721.1651008323643757608
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JjF3gEua;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QLPLT2071338;
	Tue, 26 Apr 2022 16:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651008321;
	bh=rbTq+XkeDg12cFByN2AI51wIE0IMFRpK/yvOyJ6jg+k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JjF3gEuaX+4+Jm2WAnxj7Z4P9btwzJH1fw2ZX5T0ozCmZTVL4Lqib7hbI3LzKT3eK
	 lS/4NnWRt6zLATkDwE9WBBj01h06b0bFY+dQwLrNh1kcmdjHxx8lwEAfvm6ZJbdVnu
	 gLDNOBaHqSgeX2aslLw1JZ+ABiYBaekz5eQY5eAs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QLPLAs041752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 16:25:21 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 16:25:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 16:25:21 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QLPKVp030934;
	Tue, 26 Apr 2022 16:25:20 -0500
Message-ID: <595ed774-3623-9853-4874-de5c809648df@ti.com>
Date: Tue, 26 Apr 2022 16:25:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][oe-layersetup PATCH 5/6] Build Poky in a directory
 named poky-tmp vs arago-tmp
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-5-afd@ti.com> <20220426211423.GF9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426211423.GF9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13810

On 4/26/22 4:14 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2022 at 03:02:50PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
>> This also allows us to keep version of both should we need.
> 
> I'm fine with the change, although it's really a NOOP, as TMPDIR gets replaced
> by tisdk-build-scripts, Jenkins jobs and even a distro config... But for
> consistency, it's fine.
> 


I'm not a build script nor a Jenkins job :) so this *does* change the behavior
for me building on my local desktop. (Poky doesn't change this in distro config).

Andrew


> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   sample-files/local-poky-v2.conf.sample | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
>> index a958055..4bd0563 100644
>> --- a/sample-files/local-poky-v2.conf.sample
>> +++ b/sample-files/local-poky-v2.conf.sample
>> @@ -48,7 +48,7 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
>>   # where BitBake should place its temporary files and output. Keep in mind that
>>   # this includes the extraction and compilation of many applications and the toolchain
>>   # which can use Gigabytes of hard disk space.
>> -TMPDIR = "${OEBASE}/build/arago-tmp"
>> +TMPDIR = "${OEBASE}/build/poky-tmp"
>>   
>>   #
>>   # Machine Selection
>> -- 
>> 2.17.1

