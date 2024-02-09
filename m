Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9D3C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:56:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.15278.1707494198696536453
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 07:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=OaxOC16o;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419Fub2H061528;
	Fri, 9 Feb 2024 09:56:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707494197;
	bh=fAoU9jLNEAuw3it3zpXs+Bb+MOXbV0H2JmoWyEojtiQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OaxOC16oAIXrHqWhsGfBi1y7N719R4kZi4U2jKBMWzCQD82q7jwk3ACGckX4i9GN8
	 QnjjI320p/qvumuzVTps72lIoT2yqUZZ1oDfiEnKeD5NkfDX44igXJdNsvl0wvLpWX
	 uVJc98h3NAVC5H/67rsC+mg0/RsEeVhAP6Uj7D9Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419Fub7D054516
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 09:56:37 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 09:56:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 09:56:36 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419FuahS130488;
	Fri, 9 Feb 2024 09:56:36 -0600
Message-ID: <ae48ea42-ddba-4ab4-a14b-e2e55e08c134@ti.com>
Date: Fri, 9 Feb 2024 09:56:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup:
 configs: add meta-clang into the kirkstone configs
Content-Language: en-US
To: "Etheridge, Darren" <detheridge@ti.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>, Randolph Sapp <rs@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <denys@konsulko.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240208191412.1382-1-detheridge@ti.com>
 <c6d4d07a-baef-47dd-ae92-d9b0dabefad2@ti.com>
 <beef5446-3df9-4162-85e5-cef5a46cf63d@ti.com>
 <7d784426-4f11-41ee-ac5f-2425ae902fe5@ti.com>
 <96b796e6-143a-4ae7-90fd-ee510c54b026@ti.com>
 <0325fa92-95d0-41a6-b58b-a0758a9241f1@ti.com>
 <09844214-d75e-49be-8a80-e7c94974d08f@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <09844214-d75e-49be-8a80-e7c94974d08f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 419Fub2H061528
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 15:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15152


On 2/9/2024 8:02 AM, Etheridge, Darren wrote:
>=20
>=20
> On 2/9/2024 4:17 AM, Chirag Shilwant wrote:
>>
>> On 09/02/24 01:37, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> On 2/8/2024 2:=E2=80=8A01 PM, Etheridge, Darren wrote: > On 2/8/2024 =
1:=E2=80=8A40=20
>>> PM, Ryan Eatmon wrote: >> >> >> On 2/8/2024 1:=E2=80=8A34 PM, Randolp=
h Sapp=20
>>> wrote: >>> On 2/8/24 13:=E2=80=8A14, detheridge@=E2=80=8Ati.=E2=80=8A=
com wrote: >>>> From:=20
>>> Darren
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the=20
>>> source of this email and know the content is safe.
>>> ZjQcmQRYFpfptBannerEnd
>>> On 2/8/2024 2:01 PM, Etheridge, Darren wrote:
>>> > On 2/8/2024 1:40 PM, Ryan Eatmon wrote:
>>> >>
>>> >>
>>> >> On 2/8/2024 1:34 PM, Randolph Sapp wrote:
>>> >>> On 2/8/24 13:14, detheridge@ti.com wrote:
>>> >>>> From: Darren Etheridge <detheridge@ti.com>
>>> >>>>
>>> >>>> Add meta-clang into the 3 kirkstone configs.=C2=A0 meta-clang is=
=20
>>> pinned to
>>> >>>> the kirkstone-clang12 branch because this is what we will be=20
>>> using for
>>> >>>> the chromium v111 browser build.
>>> >>>>
>>> >>>> We want to pull meta-clang into all kirkstone builds even withou=
t
>>> >>>> chromium so that we find any integration problems that clang mig=
ht
>>> >>>> introduce even before we start doing the much larger chromium=20
>>> builds.
>>> >>>>
>>> >>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>>> >>>> ---
>>> >>>> =C2=A0 configs/arago-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
>>> >>>> =C2=A0 configs/arago-kirkstone-next-config.txt | 2 +-
>>> >>>> =C2=A0 configs/arago-kirkstone-wip-config.txt=C2=A0 | 2 +-
>>> >>>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
>>> >>>>
>>> >>>> diff --git a/configs/arago-kirkstone-config.txt >>>>=20
>>> b/configs/arago-kirkstone-config.txt
>>> >>>> index ceb8d74..43a8a0b 100644
>>> >>>> --- a/configs/arago-kirkstone-config.txt
>>> >>>> +++ b/configs/arago-kirkstone-config.txt
>>> >>>> @@ -9,7 +9,7 @@ >>>>=20
>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproj=
ect.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6XtpQ4=
A$
>>> >>>>=20
>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGB=
xuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLTqzQ=
$
>>> >>>>=20
>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/meta=
-ti,kirkstone,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4ApZ-eT=
AnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSb=
fBAtmdwbBm1vewiA$
>>> >>>>=20
>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/met=
a-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4ApZ=
-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4=
dSbfBAtmdwbCq1af67Q$
>>> >>>>=20
>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta=
-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAc=
pVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
>>> >>>>=20
>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta-=
clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGB=
xuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6Ieg=
$
>>> >>>>=20
>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/open=
embedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmt=
SSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD3Rv=
3BOg$
>>> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sa=
mple
>>> >>>> diff --git a/configs/arago-kirkstone-next-config.txt >>>>=20
>>> b/configs/arago-kirkstone-next-config.txt
>>> >>>> index dcf935d..9d173df 100644
>>> >>>> --- a/configs/arago-kirkstone-next-config.txt
>>> >>>> +++ b/configs/arago-kirkstone-next-config.txt
>>> >>>> @@ -17,7 +17,7 @@ >>>>=20
>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproj=
ect.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6XtpQ4=
A$
>>> >>>>=20
>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGB=
xuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLTqzQ=
$
>>> >>>>=20
>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/meta=
-ti,kirkstone-next,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4A=
pZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-=
O4dSbfBAtmdwbAMufQiNg$
>>> >>>>=20
>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/met=
a-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4ApZ=
-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4=
dSbfBAtmdwbCq1af67Q$
>>> >>>>=20
>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta=
-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAc=
pVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
>>> >>>>=20
>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta-=
clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGB=
xuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6Ieg=
$
>>> >>>>=20
>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/open=
embedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmt=
SSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD3Rv=
3BOg$
>>> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sa=
mple
>>> >>>> diff --git a/configs/arago-kirkstone-wip-config.txt >>>>=20
>>> b/configs/arago-kirkstone-wip-config.txt
>>> >>>> index 9dd72ab..dfe8bd6 100644
>>> >>>> --- a/configs/arago-kirkstone-wip-config.txt
>>> >>>> +++ b/configs/arago-kirkstone-wip-config.txt
>>> >>>> @@ -9,7 +9,7 @@ >>>>=20
>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproj=
ect.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSG=
BxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6XtpQ4=
A$
>>> >>>>=20
>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGB=
xuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLTqzQ=
$
>>> >>>>=20
>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/meta=
-ti,kirkstone-wip,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4Ap=
Z-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O=
4dSbfBAtmdwbAQQJrVpA$
>>> >>>>=20
>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/met=
a-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4ApZ=
-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4=
dSbfBAtmdwbCq1af67Q$
>>> >>>>=20
>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta=
-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAc=
pVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
>>> >>>>=20
>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta-=
clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGB=
xuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6Ieg=
$
>>> >>>>=20
>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/open=
embedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmt=
SSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD3Rv=
3BOg$
>>> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>>> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sa=
mple
>>> >>>
>>> >>> Just a heads up, not sure if this can be picked up as is because=20
>>> of >>> legacy devices having issues with meta-clang. It may not be a=20
>>> problem >>> anymore but I remember that was what provoked the initial=
=20
>>> removal of >>> meta-clang back around 9.1. Darren's running some test=
s.
>>> >>
>>> >> I was going to ask if these had been addressed yet...
>>> >>
>>> >>
>>> > Well I guess this was exactly the reason for introducing this layer=
=20
>>> back > in.=C2=A0 I'll run some builds on legacy and see what happens.=
=C2=A0 If=20
>>> it really > is broken on legacy maybe this is something we fix on=20
>>> master and just > drop this on kirkstone for now and just pull=20
>>> meta-clang layer in for the > chromium builds on non-legacy devices.
>>>
>>> We do not have a way to selectively pull in different layers based on
>>> platform.=C2=A0 All of the platforms are built with the same config.=C2=
=A0 So we
>>> either need to fix the legacy code that is not working correctly with
>>> clang.=C2=A0 Or we need to drop the legacy platforms.
>>
>> Dropping legacy platforms isn't a solution as a refresh release for=20
>> all legacy devices
>> is planned once a year by TI (atleast for SITARA legacy platforms)
>>
>> Fixing the legacy code to avoid build due to meta-clang OR maintaining=
=20
>> a separate config for legacy devices by dropping meta-clang in it
>> are the alternatives I can think of, with fixing the legacy code being=
=20
>> the ideal choice.
>>
>> Maybe, let's wait until Darren gets back with the build status of=20
>> legacy platforms with meta-clang.
>>
>=20
> Well, I did builds of am335x, am437x and am57x - and a build of=20
> am335x-rt with the meta-clang layer included.=C2=A0 All builds were=20
> successful,=C2=A0 I don't have the boards immediately at hand to run th=
e=20
> images - but Randolph indicated this was a build problem, not a runtime=
=20
> problem.=C2=A0 Which based on my overnight builds seems to be gone now.

It was a runtime problem...  The tests failed because something became=20
incredibly slower with the clang build.  It's been a while and I can't=20
remember what it was...

I guess if we need to we can turn clang back on and start debugging the=20
issue from there again.


>=20
>>>
>>> --=20
>>> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
>>> -----------------------------------------
>>> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online=20
>>> (#15143):https://urldefense.com/v3/__https://lists.yoctoproject.org/g=
/meta-arago/message/15143__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9u=
mR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbDtL4lQBA$
>>> Mute This=20
>>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1=
04245171/7030289__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAH=
uXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbA4pCf2wQ$
>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.or=
g/g/meta-arago/unsub__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-K=
UKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbDitwU5tg$=C2=A0 [c-shilwan=
t@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

