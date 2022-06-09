Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC65EC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 17:07:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.16003.1654794424711594146
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 10:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Rv5zx9mN;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 259H70Fp037694;
	Thu, 9 Jun 2022 12:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654794420;
	bh=cwEtcnkmoTpeYazIvFZ4awB+2IcJqHFdtkYZVRrekUY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Rv5zx9mNYd3ipmlNKLqnQkQeVYTqzXhAQokM6AL8MGSmgY2pu0CiYGh+Shvmpuj1Z
	 xZ8j1xMZ+k1WPP2eAbp0q8x1Tom8ulrjWbunMND/bnkgNFrOiIgKGFCec1vEoHFKGh
	 9KhCMyfFZX070jeY3ILrDArpCew/fGYyb/ZDcUVo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 259H70X6023224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jun 2022 12:07:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Jun 2022 12:06:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Jun 2022 12:06:59 -0500
Received: from [10.250.32.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 259H6xEb103587;
	Thu, 9 Jun 2022 12:06:59 -0500
Message-ID: <df97d992-83ea-2bfc-5dd6-54046655bc14@ti.com>
Date: Thu, 9 Jun 2022 12:06:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-arago][dunfell/master][PATCH] tiusdk-uenv: remove uEnv.txt
 for k3
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220603160300.28387-1-afd@ti.com>
 <20220603210100.GM9834@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220603210100.GM9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Jun 2022 17:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13895

On 6/3/22 4:01 PM, Denys Dmytriyenko wrote:
> There's a typo in the subject - tiusdk-uenv
> 


Looks like the same typo was in the patch that introduced this
uEnv.txt file, copy/paste, v2 sent.

Andrew


> 
> On Fri, Jun 03, 2022 at 11:03:00AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
>> This fixup should have been done in u-boot and not in a uEnv.txt
>> file. It is not correct for all K3 anymore either. Remove it.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
>>   1 file changed, 19 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>> deleted file mode 100644
>> index 80ea34f5..00000000
>> --- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -# This uEnv.txt file can contain additional environment settings that you
>> -# want to set in U-Boot at boot time.  This can be simple variables such
>> -# as the serverip or custom variables.  The format of this file is:
>> -#    variable=value
>> -# NOTE: This file will be evaluated after the bootcmd is run and the
>> -#       bootcmd must be set to load this file if it exists (this is the
>> -#       default on all newer U-Boot images.  This also means that some
>> -#       variables such as bootdelay cannot be changed by this file since
>> -#       it is not evaluated until the bootcmd is run.
>> -
>> -# The specific board is not able to be automatically detected. The below is a
>> -# workaround to set a sane default incase the user has not manually configured
>> -# a specific board.
>> -def_board_name="am65x"
>> -
>> -# Check if using default board_name when name_overlays is not set
>> -check_for_board=if test $name_overlays; then echo "Using board_name = $board_name"; else setenv board_name $def_board_name; fi
>> -
>> -uenvcmd=run check_for_board; run findfdt
>> -- 
>> 2.36.1

