Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27DFEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.10101.1688601001016376114
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 16:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QJw/sFpA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365NnsUx006855;
	Wed, 5 Jul 2023 18:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688600994;
	bh=3TyNbB0uK3noTVXz9tLGw/JBMEDxGZvMvpX2xjoaTE4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QJw/sFpA+fQi2kjudYm0ZvsWxlCkKhsbmWoGuMtvDR9TmayzCYrpN7IK9BDpcO5DI
	 ozY5dcU0qgmn7L5ka5zVqX4AhWvYCOdwSukt+zzZEiDSMSL20MJdHa7xHAMwu5hCxJ
	 Lc3E9bvCoG9NwTYk1bZSLaiy4icMqLPdZPgs70WE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365NnsH4011272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 18:49:54 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 18:49:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 18:49:54 -0500
Received: from [10.249.35.108] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365NnsBQ075916;
	Wed, 5 Jul 2023 18:49:54 -0500
Message-ID: <7b27d57b-6e41-2f17-b827-ce701426d8c7@ti.com>
Date: Wed, 5 Jul 2023 18:49:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH 2/3] libcamera: Add support
 for TI CSI-RX
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <j-luthra@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree Kartheek Adivi
	<s-adivi@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar
	<devarsht@ti.com>
References: <20230705130928.1201894-1-j-luthra@ti.com>
 <20230705130928.1201894-2-j-luthra@ti.com> <20230705231454.GA1518@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230705231454.GA1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 23:50:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14755



On 7/5/2023 6:14 PM, Denys Dmytriyenko wrote:
> On Wed, Jul 05, 2023 at 06:39:27PM +0530, Jai Luthra via lists.yoctoproject.org wrote:
>> TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
>> does not recognize it.
>>
>> Apply a patch to the simple pipeline so that it can recognize the media
>> entity for TI's CSI-RX driver.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> ---
>>   .../0001-simple-Support-TI-CSI-RX.patch       | 26 +++++++++++++++++++
>>   .../libcamera/libcamera_0.0.5.bb              |  1 +
>>   2 files changed, 27 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
>> new file mode 100644
>> index 00000000..66b94863
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
>> @@ -0,0 +1,26 @@
>> +From 2a82bce49ce4098ac17b4a654a9db5f2dee56415 Mon Sep 17 00:00:00 2001
>> +From: Jai Luthra <j-luthra@ti.com>
>> +Date: Thu, 23 Mar 2023 11:38:46 +0530
>> +Subject: [PATCH] simple: Support TI CSI-RX
> 
> Upstream-Status is missing here

Good catch.


> 
>> +Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> +---
>> + src/libcamera/pipeline/simple/simple.cpp | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
>> +index e1f8b989..520405a1 100644
>> +--- a/src/libcamera/pipeline/simple/simple.cpp
>> ++++ b/src/libcamera/pipeline/simple/simple.cpp
>> +@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
>> + 	{ "mxc-isi", {} },
>> + 	{ "qcom-camss", {} },
>> + 	{ "sun6i-csi", {} },
>> ++	{ "j721e-csi2rx", {} },
>> ++
>> + };
>> +
>> + } /* namespace */
>> +--
>> +2.41.0
>> +
>> diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
>> index 6ad376f2..b2eb5fac 100644
>> --- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
>> +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
>> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
>>   
>>   SRC_URI = " \
>>           git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
>> +        file://0001-simple-Support-TI-CSI-RX.patch \
>>   "
>>   
>>   SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
>> -- 
>> 2.41.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

