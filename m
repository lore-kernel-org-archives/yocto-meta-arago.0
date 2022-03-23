Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3BDC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 19:10:15 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.1335.1648062612533367131
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 12:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=an7ajXm1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NJAAI9129225;
	Wed, 23 Mar 2022 14:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648062610;
	bh=z4gHNV5fUmyc7LdyYEAF0P9rB+GsjgkfVxr0TfJ1qUw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=an7ajXm15LJSOPWmL1+LpivcXnQ/EKAmq9PQr394Ekv7iOBINujw5s+U2a6DHND87
	 dtFiHW1CmVEO777/xlZrQHIhZiuU/EwsJpgMtfJCUesrK8Y8Y7clEh6Yp8Y2cOj6xs
	 7CYu8BAjEywv8ENLgfTLaV/aLehjoYhxs0ucCaSY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NJAAH8062262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 14:10:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 14:10:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 14:10:10 -0500
Received: from [10.250.32.71] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NJA94s125246;
	Wed, 23 Mar 2022 14:10:09 -0500
Message-ID: <59028b26-9d05-645a-a81b-a40057f006b8@ti.com>
Date: Wed, 23 Mar 2022 14:10:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][dunfell][PATCH 3/3] busybox: Enable rtcwake
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220322193554.24404-1-reatmon@ti.com>
 <20220322193554.24404-4-reatmon@ti.com>
 <20220322205152.pv57ek6qm2tc4aux@coffee>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220322205152.pv57ek6qm2tc4aux@coffee>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 19:10:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13728



On 3/22/2022 15:51, Nishanth Menon wrote:
> On 14:35-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Nishanth Menon <nm@ti.com>
>>
>> This is esp useful for testing low power states with a minimal system.
>>
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/busybox/busybox/defconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>> index 65470bc7..351b80d4 100644
>> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>> @@ -583,7 +583,7 @@ CONFIG_PIVOT_ROOT=y
>>   CONFIG_RDATE=y
>>   # CONFIG_RDEV is not set
>>   # CONFIG_READPROFILE is not set
>> -# CONFIG_RTCWAKE is not set
>> +CONFIG_RTCWAKE=y
>>   # CONFIG_SCRIPT is not set
>>   # CONFIG_SCRIPTREPLAY is not set
>>   # CONFIG_SETARCH is not set
> 
> OR we could use base-image cpio
> ..
> 

Are you saying we don't need this patch and do it it a different way?  I 
can drop this patch for now...


-- 
Ryan Eatmon
reatmon@ti.com

