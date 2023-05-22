Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53DAC7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 06:09:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15893.1684735780416483492
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 21 May 2023 23:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vxS938aY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34M69a3d082262;
	Mon, 22 May 2023 01:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684735776;
	bh=NkUsO6CChA+QtCqALpKljPpvOttf+a/ToVRQPE+1icQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vxS938aYFdo2sp7QUCm5n9enprivOhMlGlFzO0Fpz5oOwWiFRA0LJHjnIO7ada8ag
	 iLlfdAPA+U22ZzY8xotMG/OFMzOUgj8IThKW4MeSTxcg1VmCFVYQ1k2c5znmjwoDs5
	 bUIuABqcOFi9OAHvfTKPtFwREbgfH5wTkBZ7oSXY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34M69aJ9099142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 01:09:36 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 01:09:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 01:09:35 -0500
Received: from [172.24.145.199] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34M69Vvo023847;
	Mon, 22 May 2023 01:09:32 -0500
Message-ID: <eee47b3a-1431-1955-2f95-0c685816f2b3@ti.com>
Date: Mon, 22 May 2023 11:39:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <r-ravikumar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        <j-choudhary@ti.com>, <a-bhatia1@ti.com>, <b-brnich@ti.com>,
        "Nori, Sekhar"
	<nsekhar@ti.com>, <g-gupta@ti.com>,
        Andrew Davis <afd@ti.com>, Nishanth Menon
	<nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Sai Sree Kartheek Adivi
	<s-adivi@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
 <20230518180151.GS9226@denix.org>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20230518180151.GS9226@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 06:09:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14426

Hi Denys,

We have a query on location of gstreamer bbappends actually as below :

As I understand meta-ti is TI's BSP layer and meta-arago is arago distro
layer, if someone want to use TI's BSP with some other distro in place of
arago like poky, then I assume they should be able to take meta-ti and poky
yocto layers. In that case to give them same base, shouldn't the gstreamer
bbappends be present in meta-ti layer itself ?

Could you please share your opinion on this.

Regards
Devarsh

On 18/05/23 23:31, Denys Dmytriyenko wrote:
> On Thu, May 18, 2023 at 06:56:36PM +0530, Rahul T R via lists.yoctoproject.org wrote:
>> Enable building kmssink plugin in gstreamer1.0-plugins-bad
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> ---
>>  meta-arago-distro/conf/distro/arago.conf | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 379b1d44..e32259a9 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -113,6 +113,9 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
>>  # Enable GST_TRACER logging in gstreamer
>>  PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
>>  
>> +# Enable kmssink in gstreamer
>> +PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
> 
> FWIW, corresponding bbappend also sets this option, but it needs updating to 
> the current gstreamer version:
> 
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%25.bbappend#n3
> 
> 
>>  # Disable pulseaudio routing in alsa by default
>>  PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
>>  RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
>> -- 
>> 2.17.1

