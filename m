Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADD1C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:24:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1580.1686093866911127624
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aIqWIFbR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356NOMBP003349;
	Tue, 6 Jun 2023 18:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686093862;
	bh=jZJMnc4RX1otXys1nYsoa5vRbKNdyk0Zkov6UP/EAZU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aIqWIFbRhMS3rHjLBOHJsvjbuCvhiSREZ6fF0yPoWKez6LadgKWRaIjJkXgE6CBRS
	 XQpGjyLaUx11yhj1QBfYnH3bA12dC+EpvKCBqLeLmP76T3Pkkp2SgTbhxzipGpt4nJ
	 tCxJSfSvGQyR5UKx7dwAtPoF5v59moHsQZKIHefM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356NOM7s020307
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 18:24:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 18:24:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 18:24:22 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356NOM0a019782;
	Tue, 6 Jun 2023 18:24:22 -0500
Message-ID: <69dd6db5-136b-1b60-ad33-df21a8c2391b@ti.com>
Date: Tue, 6 Jun 2023 18:24:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone][PATCH]
 arago-image.inc: fix the default systemd target
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <afd@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230606230320.2678321-1-rs@ti.com>
 <20230606232055.GY9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230606232055.GY9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:24:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14513

On 6/6/23 18:20, Denys Dmytriyenko wrote:
> On Tue, Jun 06, 2023 at 06:03:20PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> SYSTEMD_DEFAULT_TARGET is dynamically set based on the contents of
>> IMAGE_FEATURES. Would you like to know what doesn't get updated when we
>> use a bunch of package groups to dictate what is present in the image?
>>
>> This makes systemd actually start graphical applications if the opengl
>> distro feature is set. It assumes the distro is using weston though. I'm
> 
> Why check for "opengl" and not "wayland" in DISTRO_FEATURES?
> 

Fair enough. Forgot that was a distro feature.
V2 inbound

> 
>> sure that will eventually be invalid when the package group contents
>> drift.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/images/arago-image.inc | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
>> index d00c1f70..7104d87c 100644
>> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
>> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
>> @@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
>>   
>>   IMAGE_FEATURES += "package-management splash"
>>   
>> +# this is required to make sure the proper systemd default target gets set
>> +IMAGE_FEATURES += " \
>> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'weston', '',d)} \
>> +"
>> +
>>   # 4KB per 1 inode should be enough
>>   EXTRA_IMAGECMD:ext2.gz += "-i 4096"
>>   
>> -- 
>> 2.40.1


