Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED476C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 19:42:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2019.1684438943846378278
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 12:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=K4VV799T;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IJgJgT112138;
	Thu, 18 May 2023 14:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684438940;
	bh=vbSnYd60tohB09EQUbvVY94c67jezv1Cmcfn6H6tQUY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=K4VV799TDEMKYR5uSB26tIp3m5dGOhKV463n6ARCzr2ibdbu+x/fD2HxiSZ5q0T0P
	 u9lAY7iPJ+6UJlNWKeQBba0vMyUhvCeaxCzsRDZP19mymxMY8v358pJrF7QHD8Yshr
	 MktMvDYZlZk6K4X5otqOTCeTuup2cpFE5RVsE6b8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IJgJSN006265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 14:42:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 14:42:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 14:42:19 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IJgJCD058103;
	Thu, 18 May 2023 14:42:19 -0500
Message-ID: <1cd2c743-c752-02b4-b7aa-84bbf62eea69@ti.com>
Date: Thu, 18 May 2023 14:42:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
To: Denys Dmytriyenko <denis@denix.org>, <r-ravikumar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <j-choudhary@ti.com>,
        <a-bhatia1@ti.com>, <b-brnich@ti.com>, <devarsht@ti.com>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
 <20230518180151.GS9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230518180151.GS9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 19:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14421



On 5/18/2023 1:01 PM, Denys Dmytriyenko wrote:
> On Thu, May 18, 2023 at 06:56:36PM +0530, Rahul T R via lists.yoctoproject.org wrote:
>> Enable building kmssink plugin in gstreamer1.0-plugins-bad
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/arago.conf | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 379b1d44..e32259a9 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -113,6 +113,9 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
>>   # Enable GST_TRACER logging in gstreamer
>>   PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
>>   
>> +# Enable kmssink in gstreamer
>> +PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
> 
> FWIW, corresponding bbappend also sets this option, but it needs updating to
> the current gstreamer version:
> 
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%25.bbappend#n3

Agreed.  This patch does not add much since the settings it already in 
place in the targetted recipe in arago.

The real issue is that the recipe that adds the kms setting is not being 
used because of the outdated version.  We really need to get the 
gstreamer stuff updated in order for this to work.


>>   # Disable pulseaudio routing in alsa by default
>>   PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>>   RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

