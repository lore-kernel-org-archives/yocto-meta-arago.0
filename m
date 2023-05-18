Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC53C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 21:14:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4395.1684444467758141293
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 14:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pA2zO5SB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ILENFO089909;
	Thu, 18 May 2023 16:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684444463;
	bh=BQ/sE0t69C2k97U3iQkkovvhNa0VeG4pPLMcEQEfwas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pA2zO5SBKrX9Nb2qaNgccO3VfMtmPNGlFsCRBAjNVZs49/Qa+cOJJwipaJXhpBIEn
	 lHa1s54EYx/gFd+ojWvceQRz53wvuoX4VPCWG6BLPWrPn8/AeuWot6c+hoL5zRiV2a
	 USopXOzVzXfyjnAtJOxuuT0WbFAJbZCTiPr4JXqo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ILENro070582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 16:14:23 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 16:14:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 16:14:22 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ILEM4j004130;
	Thu, 18 May 2023 16:14:22 -0500
Message-ID: <8aa3efaf-8f2d-188b-8f2c-6cd2aa113ae5@ti.com>
Date: Thu, 18 May 2023 16:14:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] meta-arago-extras:
 recipes-devtools: statcol: Bump SRCREV to fix rpmsg_char APIs
To: Denys Dmytriyenko <denis@denix.org>, <r-ravikumar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vigneshr@ti.com>, <praneeth@ti.com>
References: <20230518132044.17273-1-r-ravikumar@ti.com>
 <20230518175510.GR9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230518175510.GR9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 21:14:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14422



On 5/18/2023 12:55 PM, Denys Dmytriyenko wrote:
> On Thu, May 18, 2023 at 06:50:44PM +0530, Rahul T R via lists.yoctoproject.org wrote:
>> There has been some update in ti-rpmsg-char library APIs, New commits aligns
>> with this update
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> ---
>>   Requires: https://lists.yoctoproject.org/g/meta-ti/message/16556
>>
>>   meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> index 5cae05d7..2968ac83 100644
>> --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>>   
>>   PROTOCOL = "https"
>>   BRANCH = "master"
>> -SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
>> +SRCREV = "279bf455bc3dec69f374d46a8225687935f4323a"
>>   SRC_URI = "git://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>>   
>>   DEPENDS = "ti-rpmsg-char websocketd"
>> @@ -19,6 +19,6 @@ do_install() {
>>   	DESTDIR=${D} make install
>>   }
>>   
>> -PR:append = "_3"
>> +PR:append = "_4"
> 
> This is a standalone recipe, should set PV instead.
> 

Rahul,
   I cannot apply the change in meta-ti for changing the version of 
ti-rpmsg-char because this patch is required for the builds to work.

Can you get us a v2 that removes the PR:append lines and replaces it 
with something like:

   PV = "1.0.4+git${SRCPV}"

Or whatever version string makes sense?



>>   INSANE_SKIP:${PN} = "ldflags"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

