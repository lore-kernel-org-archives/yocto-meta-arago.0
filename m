Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD46C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 20:07:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6298.1707422846354446372
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 12:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=A/7cZTol;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418K7PJj066217;
	Thu, 8 Feb 2024 14:07:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707422845;
	bh=yEilbLKWan9Nn8vY1+D9KRTqZRcJ7EmrDedg1dQqpek=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=A/7cZTolXYxmxUL4reRv2tAPwcCbjtW1GqF7kCeqZEm9qzINUGGrFZbZ13srRvOJj
	 DZpP/VMbGopNvqbbPm4UuEpcGrMsnzAfsKLmWh/mleCfINtZvGnJjrRg9K84sbRCWe
	 iOXaZSji7QqBs4/7CJ15eNkt32Mfp4qcmV3A4nMk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418K7PBQ123478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 14:07:25 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 14:07:24 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 14:07:24 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418K7Oq1092726;
	Thu, 8 Feb 2024 14:07:24 -0600
Message-ID: <96b796e6-143a-4ae7-90fd-ee510c54b026@ti.com>
Date: Thu, 8 Feb 2024 14:07:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup: configs: add
 meta-clang into the kirkstone configs
Content-Language: en-US
To: "Etheridge, Darren" <detheridge@ti.com>, Randolph Sapp <rs@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20240208191412.1382-1-detheridge@ti.com>
 <c6d4d07a-baef-47dd-ae92-d9b0dabefad2@ti.com>
 <beef5446-3df9-4162-85e5-cef5a46cf63d@ti.com>
 <7d784426-4f11-41ee-ac5f-2425ae902fe5@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <7d784426-4f11-41ee-ac5f-2425ae902fe5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 418K7PJj066217
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 20:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15143



On 2/8/2024 2:01 PM, Etheridge, Darren wrote:
> On 2/8/2024 1:40 PM, Ryan Eatmon wrote:
>>
>>
>> On 2/8/2024 1:34 PM, Randolph Sapp wrote:
>>> On 2/8/24 13:14, detheridge@ti.com wrote:
>>>> From: Darren Etheridge <detheridge@ti.com>
>>>>
>>>> Add meta-clang into the 3 kirkstone configs.=C2=A0 meta-clang is pin=
ned to
>>>> the kirkstone-clang12 branch because this is what we will be using f=
or
>>>> the chromium v111 browser build.
>>>>
>>>> We want to pull meta-clang into all kirkstone builds even without
>>>> chromium so that we find any integration problems that clang might
>>>> introduce even before we start doing the much larger chromium builds.
>>>>
>>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>>> ---
>>>> =C2=A0 configs/arago-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
>>>> =C2=A0 configs/arago-kirkstone-next-config.txt | 2 +-
>>>> =C2=A0 configs/arago-kirkstone-wip-config.txt=C2=A0 | 2 +-
>>>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/configs/arago-kirkstone-config.txt=20
>>>> b/configs/arago-kirkstone-config.txt
>>>> index ceb8d74..43a8a0b 100644
>>>> --- a/configs/arago-kirkstone-config.txt
>>>> +++ b/configs/arago-kirkstone-config.txt
>>>> @@ -9,7 +9,7 @@=20
>>>> meta-virtualization,https://git.yoctoproject.org/meta-virtualization=
,kirkstone,H
>>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kir=
kstone,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-=
filesystems
>>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=3D=
meta-ti-extras:meta-ti-bsp
>>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=
=3Dmeta-arm:meta-arm-toolchain
>>>> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layer=
s=3D
>>>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEA=
D,layers=3D
>>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEA=
D,layers=3Dmeta
>>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>>> diff --git a/configs/arago-kirkstone-next-config.txt=20
>>>> b/configs/arago-kirkstone-next-config.txt
>>>> index dcf935d..9d173df 100644
>>>> --- a/configs/arago-kirkstone-next-config.txt
>>>> +++ b/configs/arago-kirkstone-next-config.txt
>>>> @@ -17,7 +17,7 @@=20
>>>> meta-virtualization,https://git.yoctoproject.org/meta-virtualization=
,kirkstone,H
>>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kir=
kstone,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-=
filesystems
>>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,lay=
ers=3Dmeta-ti-extras:meta-ti-bsp
>>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=
=3Dmeta-arm:meta-arm-toolchain
>>>> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layer=
s=3D
>>>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEA=
D,layers=3D
>>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEA=
D,layers=3Dmeta
>>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>>> diff --git a/configs/arago-kirkstone-wip-config.txt=20
>>>> b/configs/arago-kirkstone-wip-config.txt
>>>> index 9dd72ab..dfe8bd6 100644
>>>> --- a/configs/arago-kirkstone-wip-config.txt
>>>> +++ b/configs/arago-kirkstone-wip-config.txt
>>>> @@ -9,7 +9,7 @@=20
>>>> meta-virtualization,https://git.yoctoproject.org/meta-virtualization=
,kirkstone,H
>>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kir=
kstone,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-=
filesystems
>>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,laye=
rs=3Dmeta-ti-extras:meta-ti-bsp
>>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=
=3Dmeta-arm:meta-arm-toolchain
>>>> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layer=
s=3D
>>>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEA=
D,layers=3D
>>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEA=
D,layers=3Dmeta
>>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>>
>>> Just a heads up, not sure if this can be picked up as is because of=20
>>> legacy devices having issues with meta-clang. It may not be a problem=
=20
>>> anymore but I remember that was what provoked the initial removal of=20
>>> meta-clang back around 9.1. Darren's running some tests.
>>
>> I was going to ask if these had been addressed yet...
>>
>>
> Well I guess this was exactly the reason for introducing this layer bac=
k=20
> in.=C2=A0 I'll run some builds on legacy and see what happens.=C2=A0 If=
 it really=20
> is broken on legacy maybe this is something we fix on master and just=20
> drop this on kirkstone for now and just pull meta-clang layer in for th=
e=20
> chromium builds on non-legacy devices.

We do not have a way to selectively pull in different layers based on=20
platform.  All of the platforms are built with the same config.  So we=20
either need to fix the legacy code that is not working correctly with=20
clang.  Or we need to drop the legacy platforms.

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

