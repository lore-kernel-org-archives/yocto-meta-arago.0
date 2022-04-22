Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03240C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.816.1650650174585635895
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 10:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xeMonDtX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23MHu98b068134;
	Fri, 22 Apr 2022 12:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650650169;
	bh=7IGla0VJGJnuyY8aEbmTR5+UnYwpPhFtI+Xs1y1o3MY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xeMonDtXf+Kfz4VvaIBeN7Q2MKZoOLkddEChCl+j1FSzlYReNflVK6i2Z9+lT5//S
	 AD7vH85V3bqZVbKlrfwcM18YScGGDUWWCdg7ZIBK8BX9gaaEozZb32sVmo05bN45t1
	 8EABLPhHbdq6550O4YG212K95Iwib34ziP2Wmi+E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23MHu94Z111882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 22 Apr 2022 12:56:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 12:56:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 12:56:09 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23MHu9bx009665;
	Fri, 22 Apr 2022 12:56:09 -0500
Message-ID: <be6c5270-d898-1aa1-57b5-5593c3782adc@ti.com>
Date: Fri, 22 Apr 2022 12:56:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][dunfell][PATCH] statcol: Update to latest for VTM
 driver scripts
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <karthik.ramanan@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20220422164742.20194-1-karthik.ramanan@ti.com>
 <20220422165238.GE12993@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220422165238.GE12993@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13783



On 4/22/2022 11:52, Denys Dmytriyenko wrote:
> On Fri, Apr 22, 2022 at 10:17:42PM +0530, Karthik Ramanan via lists.yoctoproject.org wrote:
>> Signed-off-by: Karthik Ramanan <karthik.ramanan@ti.com>
>> ---
>>   meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> index ee2b12d2..bda532eb 100644
>> --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>>   
>>   PROTOCOL = "git"
>>   BRANCH = "master"
>> -SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
>> +SRCREV = "2dac74a233dd489d9bb48a50153c4a1360361b62"
>>   SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>>   
>>   DEPENDS = "ti-rpmsg-char websocketd"
>> @@ -19,6 +19,6 @@ do_install() {
>>   	DESTDIR=${D} make install
>>   }
>>   
>> -PR:append = "_3"
>> +PR:append = "_4"
> 
> This doesn't look like dunfell...

Agreed.  This a patch against master.  You need to either fix the 
subject and resubmit a v2, or rebase the patch against dunfell and 
resubmit a v2.


>>   INSANE_SKIP:${PN} = "ldflags"
>> -- 
>> 2.17.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13782): https://lists.yoctoproject.org/g/meta-arago/message/13782
> Mute This Topic: https://lists.yoctoproject.org/mt/90632364/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

