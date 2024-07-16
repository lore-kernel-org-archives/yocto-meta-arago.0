Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63EDC3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 19:46:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5962.1721159205814723668
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 12:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HU7HHQAa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46GJkeCX119032;
	Tue, 16 Jul 2024 14:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721159200;
	bh=GdG9TwFf+gPys9if1V2VEHOH+pu7CuEt7J6/NufsGFE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HU7HHQAar7kYEJxOY7QB5DntmyPNQbh/6xPyZK9dZDIrb+eOC2up2ThXPeq7R1vdV
	 5Ozs8eflcb9rnC2NzhO3UuIF9BT9r52Vh+XiQkE0uQ4cfqZP9tFB+lmX0x/3Wgy6pc
	 2EZJadu+KVygj+e3SagbOYHAC6SXl4VjXrr92MSo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46GJkeTf124549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 14:46:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 14:46:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 14:46:40 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46GJkdqu108053;
	Tue, 16 Jul 2024 14:46:39 -0500
Message-ID: <b71b5d25-8ad8-49bc-be8c-4c4dcb4460de@ti.com>
Date: Tue, 16 Jul 2024 14:46:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] gnutls: Add INSANE_SKIP for
 incompatible-license
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240715193729.28404-1-reatmon@ti.com>
 <20240716182314.GA17572@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240716182314.GA17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 19:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15451


Thank god.  I didn't like my solution.  Especially since there was a 
little push back on the oe-core mailing list for my patch over there.


On 7/16/2024 1:23 PM, Denys Dmytriyenko wrote:
> Actually, this is not needed - see my patch.
> 
> 
> On Mon, Jul 15, 2024 at 02:37:29PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent change in master has promoted a lot more warnings into errors.
>> Set the INSANE_SKIP variable since we are using INCOMPATIBLE_LICENSE.
>>
>> This patch is dependent on a patch in oe-core:
>>
>> https://lists.openembedded.org/g/openembedded-core/message/201943
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: Added the oe-core patch reference.
>>
>>   meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
>> index 4ad4f70a..44d1e3fa 100644
>> --- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
>> +++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
>> @@ -3,3 +3,5 @@ PR:append = ".arago0"
>>   # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
>>   # version of gettext.
>>   INCOMPATIBLE_LICENSE = "GPL-3.0*"
>> +
>> +INSANE_SKIP:${PN} += "incompatible-license"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

