Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A43AE77188
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 00:08:19 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.119117.1734566889105450845
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 16:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VaBtkWZ0;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJ0878e3699884
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 18:08:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734566887;
	bh=uSVDwIaemQVWCNab72FxnyyISEjoMit+D8LInXtVny8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VaBtkWZ0GUKKF4UAM3BB+yCJihUxAnloBJwOsxSA/uid6Dc0tF1IX5EP3plsUQqVu
	 1Rtll29ayArwjTxRsHC0zH1D2LaOcl/YKHto6mRGC8NLWtnoVTVMhcqz5aKJ78bM7n
	 itNoE08BzaQEl5jOYQL++GrZIhe1qaVPn/0TOUIk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJ0871D025089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Dec 2024 18:08:07 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 18:08:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 18:08:06 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ0868B102431;
	Wed, 18 Dec 2024 18:08:06 -0600
Message-ID: <3c39705c-fbcb-4ab7-8298-d569ecbeb700@ti.com>
Date: Wed, 18 Dec 2024 18:08:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 1/3] ti-demos: Add
 pdm-anomaly-detection for all platforms
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20241217210206.47052-1-afd@ti.com>
 <20241218214202.GJ23825@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241218214202.GJ23825@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Dec 2024 00:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15671

On 12/18/24 3:42 PM, Denys Dmytriyenko wrote:
> On Tue, Dec 17, 2024 at 03:02:04PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> There is nothing in this demo that makes it specific to any board.
>> Enable this for all devices.
> 
> Why fix up ti-demos.bb here and completely remove it in the next patch of the
> series?
> 

Felt better to do this in two steps, especially when each step could break
something different :)

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../recipes-core/packagegroups/ti-demos.bb             | 10 +---------
>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>> index 7bccb4de..91e469e7 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
>> @@ -1,17 +1,9 @@
>>   SUMMARY = "TI World packagegroup"
>>   LICENSE = "MIT"
>>   
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>>   inherit packagegroup
>>   
>> -PDM_ANOMALY_PKG = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
>> -
>> -PDM_ANOMALY = ""
>> -PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
>> -PDM_ANOMALY:ti43x = "${PDM_ANOMALY_PKG}"
>> -PDM_ANOMALY:omap-a15 = "${PDM_ANOMALY_PKG}"
>> -PDM_ANOMALY:am65xx = "${PDM_ANOMALY_PKG}"
>> +PDM_ANOMALY = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
>>   
>>   RDEPENDS:${PN} = "\
>>       ${PDM_ANOMALY} \
>> -- 
>> 2.39.2

