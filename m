Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65A8C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 20:01:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6271.1707422471697311984
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 12:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qcqmdzwk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418K1A7K056548;
	Thu, 8 Feb 2024 14:01:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707422470;
	bh=QXm91bkvCOsLxjo4jropGj8eBUWMqhhbogvu73jBlBI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=qcqmdzwkm1OceSLPEh+zw6zOlJS5k1ejusoqmqcJYC8//tf6l3boKu/wQ45Bjec+V
	 pJeRX6rpF1RGT0Dst3kV+IIOndQ1haBlqdgiAdfkBvyInFbHV0aSjUdpN8M+1DyL0S
	 BuCGDV+CmML8Yu6mX60pvAB8ELcUN7/ZvOzqzkEE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418K1A9r107195
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 14:01:10 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 14:01:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 14:01:09 -0600
Received: from [128.247.81.107] (lt5cg1254qm7.dhcp.ti.com [128.247.81.107])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418K194K015263;
	Thu, 8 Feb 2024 14:01:09 -0600
Message-ID: <7d784426-4f11-41ee-ac5f-2425ae902fe5@ti.com>
Date: Thu, 8 Feb 2024 14:01:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup: configs: add
 meta-clang into the kirkstone configs
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Randolph Sapp <rs@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20240208191412.1382-1-detheridge@ti.com>
 <c6d4d07a-baef-47dd-ae92-d9b0dabefad2@ti.com>
 <beef5446-3df9-4162-85e5-cef5a46cf63d@ti.com>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <beef5446-3df9-4162-85e5-cef5a46cf63d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 418K1A7K056548
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 20:01:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15142

On 2/8/2024 1:40 PM, Ryan Eatmon wrote:
>=20
>=20
> On 2/8/2024 1:34 PM, Randolph Sapp wrote:
>> On 2/8/24 13:14, detheridge@ti.com wrote:
>>> From: Darren Etheridge <detheridge@ti.com>
>>>
>>> Add meta-clang into the 3 kirkstone configs.=C2=A0 meta-clang is pinn=
ed to
>>> the kirkstone-clang12 branch because this is what we will be using fo=
r
>>> the chromium v111 browser build.
>>>
>>> We want to pull meta-clang into all kirkstone builds even without
>>> chromium so that we find any integration problems that clang might
>>> introduce even before we start doing the much larger chromium builds.
>>>
>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>> ---
>>> =C2=A0 configs/arago-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
>>> =C2=A0 configs/arago-kirkstone-next-config.txt | 2 +-
>>> =C2=A0 configs/arago-kirkstone-wip-config.txt=C2=A0 | 2 +-
>>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/configs/arago-kirkstone-config.txt=20
>>> b/configs/arago-kirkstone-config.txt
>>> index ceb8d74..43a8a0b 100644
>>> --- a/configs/arago-kirkstone-config.txt
>>> +++ b/configs/arago-kirkstone-config.txt
>>> @@ -9,7 +9,7 @@=20
>>> meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,H
>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-f=
ilesystems
>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=3D=
meta-ti-extras:meta-ti-bsp
>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3D=
meta-arm:meta-arm-toolchain
>>> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
=3D
>>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD=
,layers=3D
>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD=
,layers=3Dmeta
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>> diff --git a/configs/arago-kirkstone-next-config.txt=20
>>> b/configs/arago-kirkstone-next-config.txt
>>> index dcf935d..9d173df 100644
>>> --- a/configs/arago-kirkstone-next-config.txt
>>> +++ b/configs/arago-kirkstone-next-config.txt
>>> @@ -17,7 +17,7 @@=20
>>> meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,H
>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-f=
ilesystems
>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,laye=
rs=3Dmeta-ti-extras:meta-ti-bsp
>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3D=
meta-arm:meta-arm-toolchain
>>> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
=3D
>>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD=
,layers=3D
>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD=
,layers=3Dmeta
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>> diff --git a/configs/arago-kirkstone-wip-config.txt=20
>>> b/configs/arago-kirkstone-wip-config.txt
>>> index 9dd72ab..dfe8bd6 100644
>>> --- a/configs/arago-kirkstone-wip-config.txt
>>> +++ b/configs/arago-kirkstone-wip-config.txt
>>> @@ -9,7 +9,7 @@=20
>>> meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,H
>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,HEAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-f=
ilesystems
>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layer=
s=3Dmeta-ti-extras:meta-ti-bsp
>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=3D=
meta-arm:meta-arm-toolchain
>>> -#meta-clang,https://github.com/kraj/meta-clang,kirkstone,HEAD,layers=
=3D
>>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone-clang12,HEAD=
,layers=3D
>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD=
,layers=3Dmeta
>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>>
>> Just a heads up, not sure if this can be picked up as is because of=20
>> legacy devices having issues with meta-clang. It may not be a problem=20
>> anymore but I remember that was what provoked the initial removal of=20
>> meta-clang back around 9.1. Darren's running some tests.
>=20
> I was going to ask if these had been addressed yet...
>=20
>=20
Well I guess this was exactly the reason for introducing this layer back=20
in.  I'll run some builds on legacy and see what happens.  If it really=20
is broken on legacy maybe this is something we fix on master and just=20
drop this on kirkstone for now and just pull meta-clang layer in for the=20
chromium builds on non-legacy devices.




