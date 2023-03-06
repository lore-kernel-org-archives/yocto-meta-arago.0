Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F2CC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 21:43:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2374.1678139023737344753
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 Mar 2023 13:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UHKWod3l;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 326LhdPT102006;
	Mon, 6 Mar 2023 15:43:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678139019;
	bh=5GZyVFJo2ZA1xQSHWFfSvNVxMPTT98HVE1Sbk6dROuM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=UHKWod3ly7pZXkUwBlymuukMsnmBdcaxCa7A7ypSRjRUNiHp6aJI3Eb0v2kXXs/j8
	 FQ9xBgs2PT9NugPF9l54IXhuiZ7U8WOSTvHt0jBRgMCOnFIJbAg/RZgMtJpq1ztxAd
	 283l9JRgdFlsqfqEsGoeJHpuXRjn+GeGldMwMqNg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 326LhdH9034131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Mar 2023 15:43:39 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 6
 Mar 2023 15:43:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 6 Mar 2023 15:43:38 -0600
Received: from [10.249.33.79] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 326LhcWS004920;
	Mon, 6 Mar 2023 15:43:38 -0600
Message-ID: <4c561521-e7ba-6a90-6860-6904133bfd22@ti.com>
Date: Mon, 6 Mar 2023 15:43:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH] all: unbreak populate_sdk
 task (again)
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
References: <17474F7B5189B28F.29542@lists.yoctoproject.org>
 <20230306210233.GV22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230306210233.GV22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 Mar 2023 21:43:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14252


Checking now.


On 3/6/2023 15:02, Denys Dmytriyenko wrote:
> Ping.
> 
> 
> On Sun, Feb 26, 2023 at 07:32:51AM +0000, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Being able to run populate_sdk task against minimal and base images
>> has always been supported by Arago, though needed to get fixed once
>> in a while, e.g.:
>> https://git.yoctoproject.org/meta-arago/commit/?id=d47710c8219e036cb7005bc0a22099e63c5e1901
>>
>> This time around the issue is due to upstream packages lmbench and
>> mbedtls both installing /usr/bin/hello binary and causing a conflict
>> when the files collide in the sysroot.
>>
>> The fix has been submitted upstream to meta-oe and meta-networking
>> layers of the meta-openembedded repo:
>> https://patchwork.yoctoproject.org/project/oe/list/?series=10748
>>
>> For now add local bbappends with the same fix, which can be removed
>> when the fix is merged upstream and backported to kirkstone.
>>
>> While at it, also look into the conflict caused by matrix launcher
>> packaging function being reused by multiple subpackages, resulting
>> in lots of file conflicts between them. There's a lot of rework
>> required for the matrix (and it might get moved to another layer
>> altogether), but for now just cutoff the reverse dependency from
>> development -dev packages.
>>
>> With this simple change it is now possible to run populate_sdk task
>> even against the default full/graphics tisdk-default-image.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   .../recipes-benchmark/lmbench/lmbench_%.bbappend              | 2 ++
>>   .../recipes-connectivity/mbedtls/mbedtls_%.bbappend           | 4 ++++
>>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc     | 3 +++
>>   3 files changed, 9 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>>   create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>> new file mode 100644
>> index 00000000..96dd2010
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>> @@ -0,0 +1,2 @@
>> +ALTERNATIVE:${PN} += "hello"
>> +ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
>> diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
>> new file mode 100644
>> index 00000000..f3c16796
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
>> @@ -0,0 +1,4 @@
>> +inherit update-alternatives
>> +
>> +ALTERNATIVE:${PN}-programs += "hello"
>> +ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
>> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
>> index 2bcc908b..adb998e1 100644
>> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
>> @@ -38,3 +38,6 @@ do_install:append(){
>>       # other appends.
>>       cd -
>>   }
>> +
>> +RDEPENDS:${PN}-dev = ""
>> +RRECOMMENDS:${PN}-dev = ""
>> -- 
>> 2.25.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14251): https://lists.yoctoproject.org/g/meta-arago/message/14251
> Mute This Topic: https://lists.yoctoproject.org/mt/97241511/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/leave/10828727/6551054/1636163090/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

