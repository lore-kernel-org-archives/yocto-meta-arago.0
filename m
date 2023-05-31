Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674BBC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:58:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2755.1685559498440484738
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 31 May 2023 11:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FU13j9k2;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34VIwE15066038;
	Wed, 31 May 2023 13:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685559494;
	bh=ACWyOioHPoorTgiK/FB6Nndms703iAvoSfK0Xi5iKZ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FU13j9k2qrQnSjsT77V/xd7g0R6NUy/ijp+xL+bgzzphd38w3j1H+BRdvoyMOJohZ
	 HafD6wfyShGUNzR434DXqUStmIefRI9FG5KQQ7/Vm+8Ie2CklEkqB61eaHjA0UBuOH
	 JvPXpbwyRgo7JG/9a++9r+6fc6kg0NORrj8ysHzg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34VIwEFB033953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 May 2023 13:58:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 31
 May 2023 13:58:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 31 May 2023 13:58:14 -0500
Received: from [10.24.69.76] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34VIwB21088192;
	Wed, 31 May 2023 13:58:12 -0500
Message-ID: <a1395765-09ae-5872-8cf8-871edc180222@ti.com>
Date: Thu, 1 Jun 2023 00:28:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <j-choudhary@ti.com>, <a-bhatia1@ti.com>, <b-brnich@ti.com>,
        <devarsht@ti.com>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
 <20230518180151.GS9226@denix.org>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20230518180151.GS9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 31 May 2023 18:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14484

Hi Denys,

On 18/05/23 23:31, Denys Dmytriyenko wrote:
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
> FWIW, corresponding bbappend also sets this option, but it needs updating to
> the current gstreamer version:
>
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%25.bbappend#n3

Since the gst-plugins-bad bbappend is to be removed as per the 
discussion in below thread
https://lists.yoctoproject.org/g/meta-arago/message/14441
Can this patch be merged

>>   # Disable pulseaudio routing in alsa by default
>>   PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>>   RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
>> -- 
>> 2.17.1

Regards

Rahul T R


