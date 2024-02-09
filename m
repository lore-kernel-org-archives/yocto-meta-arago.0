Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519C4C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:58:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15328.1707494289360534725
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 07:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LVKdnjSv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419Fw7lS000500;
	Fri, 9 Feb 2024 09:58:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707494287;
	bh=NiL+Gz5op3fyMGKI5w6Q8zEmessjT8tyk0+tve1htZs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LVKdnjSv6D0g6rbkMRMlILl8gZJasjEMGKg3a8IqHVisaQYO/+rfaKWxJHZEFXqG0
	 KuSksQwFAEdb3SaCcAuNWuCBVVdhYZ4psJK2cP3aWuh1DPkCnUHiZM/ivZk6McvlvI
	 q2us5fjAwM3fYBPAXqojSiyFP+AUat2KWwHUoWnQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419Fw7XI039340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 09:58:07 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 09:58:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 09:58:07 -0600
Received: from [10.249.43.59] ([10.249.43.59])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419Fw7AJ001583;
	Fri, 9 Feb 2024 09:58:07 -0600
Message-ID: <65841cb4-c84c-4174-911b-e23c399feb0a@ti.com>
Date: Fri, 9 Feb 2024 09:58:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup:
 configs: add meta-clang into the kirkstone configs
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <denys@konsulko.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240208191412.1382-1-detheridge@ti.com>
 <c6d4d07a-baef-47dd-ae92-d9b0dabefad2@ti.com>
 <beef5446-3df9-4162-85e5-cef5a46cf63d@ti.com>
 <7d784426-4f11-41ee-ac5f-2425ae902fe5@ti.com>
 <96b796e6-143a-4ae7-90fd-ee510c54b026@ti.com>
 <0325fa92-95d0-41a6-b58b-a0758a9241f1@ti.com>
 <09844214-d75e-49be-8a80-e7c94974d08f@ti.com>
 <ae48ea42-ddba-4ab4-a14b-e2e55e08c134@ti.com>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <ae48ea42-ddba-4ab4-a14b-e2e55e08c134@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 419Fw7lS000500
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 15:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15153



On 2/9/2024 9:56 AM, Ryan Eatmon wrote:
>=20
> On 2/9/2024 8:02 AM, Etheridge, Darren wrote:
>>
>>
>> On 2/9/2024 4:17 AM, Chirag Shilwant wrote:
>>>
>>> On 09/02/24 01:37, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> On 2/8/2024 2:=E2=80=8A01 PM, Etheridge, Darren wrote: > On 2/8/2024=
 1:=E2=80=8A40=20
>>>> PM, Ryan Eatmon wrote: >> >> >> On 2/8/2024 1:=E2=80=8A34 PM, Randol=
ph Sapp=20
>>>> wrote: >>> On 2/8/24 13:=E2=80=8A14, detheridge@=E2=80=8Ati.=E2=80=8A=
com wrote: >>>> From:=20
>>>> Darren
>>>> ZjQcmQRYFpfptBannerStart
>>>> This message was sent from outside of Texas Instruments.
>>>> Do not click links or open attachments unless you recognize the=20
>>>> source of this email and know the content is safe.
>>>> ZjQcmQRYFpfptBannerEnd
>>>> On 2/8/2024 2:01 PM, Etheridge, Darren wrote:
>>>> > On 2/8/2024 1:40 PM, Ryan Eatmon wrote:
>>>> >>
>>>> >>
>>>> >> On 2/8/2024 1:34 PM, Randolph Sapp wrote:
>>>> >>> On 2/8/24 13:14, detheridge@ti.com wrote:
>>>> >>>> From: Darren Etheridge <detheridge@ti.com>
>>>> >>>>
>>>> >>>> Add meta-clang into the 3 kirkstone configs.=C2=A0 meta-clang i=
s=20
>>>> pinned to
>>>> >>>> the kirkstone-clang12 branch because this is what we will be=20
>>>> using for
>>>> >>>> the chromium v111 browser build.
>>>> >>>>
>>>> >>>> We want to pull meta-clang into all kirkstone builds even witho=
ut
>>>> >>>> chromium so that we find any integration problems that clang mi=
ght
>>>> >>>> introduce even before we start doing the much larger chromium=20
>>>> builds.
>>>> >>>>
>>>> >>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>>> >>>> ---
>>>> >>>> =C2=A0 configs/arago-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
>>>> >>>> =C2=A0 configs/arago-kirkstone-next-config.txt | 2 +-
>>>> >>>> =C2=A0 configs/arago-kirkstone-wip-config.txt=C2=A0 | 2 +-
>>>> >>>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>>> >>>>
>>>> >>>> diff --git a/configs/arago-kirkstone-config.txt >>>>=20
>>>> b/configs/arago-kirkstone-config.txt
>>>> >>>> index ceb8d74..43a8a0b 100644
>>>> >>>> --- a/configs/arago-kirkstone-config.txt
>>>> >>>> +++ b/configs/arago-kirkstone-config.txt
>>>> >>>> @@ -9,7 +9,7 @@ >>>>=20
>>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctopro=
ject.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSS=
GBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6XtpQ=
4A$
>>>> >>>>=20
>>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembedd=
ed.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLTqz=
Q$
>>>> >>>>=20
>>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/met=
a-ti,kirkstone,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4ApZ-e=
TAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dS=
bfBAtmdwbBm1vewiA$
>>>> >>>>=20
>>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/me=
ta-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4Ap=
Z-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O=
4dSbfBAtmdwbCq1af67Q$
>>>> >>>>=20
>>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/met=
a-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwA=
cpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
>>>> >>>>=20
>>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta=
-clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6Ie=
g$
>>>> >>>>=20
>>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/ope=
nembedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4gm=
tSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD3R=
v3BOg$
>>>> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.s=
ample
>>>> >>>> diff --git a/configs/arago-kirkstone-next-config.txt >>>>=20
>>>> b/configs/arago-kirkstone-next-config.txt
>>>> >>>> index dcf935d..9d173df 100644
>>>> >>>> --- a/configs/arago-kirkstone-next-config.txt
>>>> >>>> +++ b/configs/arago-kirkstone-next-config.txt
>>>> >>>> @@ -17,7 +17,7 @@ >>>>=20
>>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctopro=
ject.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSS=
GBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6XtpQ=
4A$
>>>> >>>>=20
>>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembedd=
ed.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLTqz=
Q$
>>>> >>>>=20
>>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/met=
a-ti,kirkstone-next,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4=
ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk=
-O4dSbfBAtmdwbAMufQiNg$
>>>> >>>>=20
>>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/me=
ta-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4Ap=
Z-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O=
4dSbfBAtmdwbCq1af67Q$
>>>> >>>>=20
>>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/met=
a-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwA=
cpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
>>>> >>>>=20
>>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta=
-clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6Ie=
g$
>>>> >>>>=20
>>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/ope=
nembedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4gm=
tSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD3R=
v3BOg$
>>>> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.s=
ample
>>>> >>>> diff --git a/configs/arago-kirkstone-wip-config.txt >>>>=20
>>>> b/configs/arago-kirkstone-wip-config.txt
>>>> >>>> index 9dd72ab..dfe8bd6 100644
>>>> >>>> --- a/configs/arago-kirkstone-wip-config.txt
>>>> >>>> +++ b/configs/arago-kirkstone-wip-config.txt
>>>> >>>> @@ -9,7 +9,7 @@ >>>>=20
>>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctopro=
ject.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSS=
GBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6XtpQ=
4A$
>>>> >>>>=20
>>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembedd=
ed.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLTqz=
Q$
>>>> >>>>=20
>>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/met=
a-ti,kirkstone-wip,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4A=
pZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-=
O4dSbfBAtmdwbAQQJrVpA$
>>>> >>>>=20
>>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/me=
ta-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4Ap=
Z-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O=
4dSbfBAtmdwbCq1af67Q$
>>>> >>>>=20
>>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/met=
a-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwA=
cpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
>>>> >>>>=20
>>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta=
-clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6Ie=
g$
>>>> >>>>=20
>>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/ope=
nembedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4gm=
tSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD3R=
v3BOg$
>>>> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>>> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.s=
ample
>>>> >>>
>>>> >>> Just a heads up, not sure if this can be picked up as is because=
=20
>>>> of >>> legacy devices having issues with meta-clang. It may not be a=
=20
>>>> problem >>> anymore but I remember that was what provoked the=20
>>>> initial removal of >>> meta-clang back around 9.1. Darren's running=20
>>>> some tests.
>>>> >>
>>>> >> I was going to ask if these had been addressed yet...
>>>> >>
>>>> >>
>>>> > Well I guess this was exactly the reason for introducing this=20
>>>> layer back > in.=C2=A0 I'll run some builds on legacy and see what=20
>>>> happens.=C2=A0 If it really > is broken on legacy maybe this is some=
thing=20
>>>> we fix on master and just > drop this on kirkstone for now and just=20
>>>> pull meta-clang layer in for the > chromium builds on non-legacy=20
>>>> devices.
>>>>
>>>> We do not have a way to selectively pull in different layers based o=
n
>>>> platform.=C2=A0 All of the platforms are built with the same config.=
=C2=A0 So we
>>>> either need to fix the legacy code that is not working correctly wit=
h
>>>> clang.=C2=A0 Or we need to drop the legacy platforms.
>>>
>>> Dropping legacy platforms isn't a solution as a refresh release for=20
>>> all legacy devices
>>> is planned once a year by TI (atleast for SITARA legacy platforms)
>>>
>>> Fixing the legacy code to avoid build due to meta-clang OR=20
>>> maintaining a separate config for legacy devices by dropping=20
>>> meta-clang in it
>>> are the alternatives I can think of, with fixing the legacy code=20
>>> being the ideal choice.
>>>
>>> Maybe, let's wait until Darren gets back with the build status of=20
>>> legacy platforms with meta-clang.
>>>
>>
>> Well, I did builds of am335x, am437x and am57x - and a build of=20
>> am335x-rt with the meta-clang layer included.=C2=A0 All builds were=20
>> successful,=C2=A0 I don't have the boards immediately at hand to run t=
he=20
>> images - but Randolph indicated this was a build problem, not a=20
>> runtime problem.=C2=A0 Which based on my overnight builds seems to be =
gone=20
>> now.
>=20
> It was a runtime problem...=C2=A0 The tests failed because something be=
came=20
> incredibly slower with the clang build.=C2=A0 It's been a while and I c=
an't=20
> remember what it was...
>=20
> I guess if we need to we can turn clang back on and start debugging the=
=20
> issue from there again.
>=20

Sounds like that is what we need to do.


>=20
>>
>>>>
>>>> --=20
>>>> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
>>>> -----------------------------------------
>>>> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online=20
>>>> (#15143):https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/message/15143__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9=
umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbDtL4lQBA$
>>>> Mute This=20
>>>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/=
104245171/7030289__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKA=
HuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbA4pCf2wQ$
>>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.o=
rg/g/meta-arago/unsub__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-=
KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbDitwU5tg$=C2=A0 [c-shilwa=
nt@ti.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>
>=20

