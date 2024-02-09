Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26E9C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 10:17:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8517.1707473830200018006
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 02:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nN6PKm/G;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419AH8wq113834;
	Fri, 9 Feb 2024 04:17:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707473828;
	bh=9tKIsA2FLYkRbASrIgvLrWSPhcGNYKMiQ+8xiNeE5uA=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=nN6PKm/G0K0WPGCid1psKuP27NODJY3WCHs9gwFiTWh+YXFYyk9LloboyiQiWpAUC
	 yBAleOiY0LPe4D1D/FE+KrnsJdmi4NrFCuwfUn/wey1oLktzwSXVZ6avOFDxBl/eGT
	 qdLZT8MDc3jwFo/LhcgvaDwyiXXrc4SAjnCGBjUo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419AH8LR080239
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 04:17:08 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 04:17:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 04:17:08 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419AH5db001933;
	Fri, 9 Feb 2024 04:17:06 -0600
Message-ID: <0325fa92-95d0-41a6-b58b-a0758a9241f1@ti.com>
Date: Fri, 9 Feb 2024 15:47:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][oe-layersetup][PATCH] oe-layersetup:
 configs: add meta-clang into the kirkstone configs
To: <reatmon@ti.com>, "Etheridge, Darren" <detheridge@ti.com>,
        Randolph Sapp
	<rs@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <denys@konsulko.com>
References: <20240208191412.1382-1-detheridge@ti.com>
 <c6d4d07a-baef-47dd-ae92-d9b0dabefad2@ti.com>
 <beef5446-3df9-4162-85e5-cef5a46cf63d@ti.com>
 <7d784426-4f11-41ee-ac5f-2425ae902fe5@ti.com>
 <96b796e6-143a-4ae7-90fd-ee510c54b026@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Gyan Gupta <g-gupta@ti.com>
In-Reply-To: <96b796e6-143a-4ae7-90fd-ee510c54b026@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 419AH8wq113834
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 10:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15147


On 09/02/24 01:37, Ryan Eatmon via lists.yoctoproject.org wrote:
> On 2/8/2024 2:=E2=80=8A01 PM, Etheridge, Darren wrote: > On 2/8/2024 1:=
=E2=80=8A40 PM,=20
> Ryan Eatmon wrote: >> >> >> On 2/8/2024 1:=E2=80=8A34 PM, Randolph Sapp=
 wrote:=20
> >>> On 2/8/24 13:=E2=80=8A14, detheridge@=E2=80=8Ati.=E2=80=8Acom wrote=
: >>>> From: Darren
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> On 2/8/2024 2:01 PM, Etheridge, Darren wrote:
> > On 2/8/2024 1:40 PM, Ryan Eatmon wrote:
> >>
> >>
> >> On 2/8/2024 1:34 PM, Randolph Sapp wrote:
> >>> On 2/8/24 13:14, detheridge@ti.com wrote:
> >>>> From: Darren Etheridge <detheridge@ti.com>
> >>>>
> >>>> Add meta-clang into the 3 kirkstone configs.=C2=A0 meta-clang is p=
inned to
> >>>> the kirkstone-clang12 branch because this is what we will be using=
 for
> >>>> the chromium v111 browser build.
> >>>>
> >>>> We want to pull meta-clang into all kirkstone builds even without
> >>>> chromium so that we find any integration problems that clang might
> >>>> introduce even before we start doing the much larger chromium buil=
ds.
> >>>>
> >>>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> >>>> ---
> >>>> =C2=A0 configs/arago-kirkstone-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 +-
> >>>> =C2=A0 configs/arago-kirkstone-next-config.txt | 2 +-
> >>>> =C2=A0 configs/arago-kirkstone-wip-config.txt=C2=A0 | 2 +-
> >>>> =C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/configs/arago-kirkstone-config.txt=20
> >>>> b/configs/arago-kirkstone-config.txt
> >>>> index ceb8d74..43a8a0b 100644
> >>>> --- a/configs/arago-kirkstone-config.txt
> >>>> +++ b/configs/arago-kirkstone-config.txt
> >>>> @@ -9,7 +9,7 @@=20
> >>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctop=
roject.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmt=
SSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6Xt=
pQ4A$
> >>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembe=
dded.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLT=
qzQ$
> >>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/m=
eta-ti,kirkstone,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-4ApZ=
-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4=
dSbfBAtmdwbBm1vewiA$
> >>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/=
meta-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4=
ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk=
-O4dSbfBAtmdwbCq1af67Q$
> >>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/m=
eta-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhg=
wAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
> >>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/me=
ta-clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6=
Ieg$
> >>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/o=
penembedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4=
gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD=
3Rv3BOg$
> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.samp=
le
> >>>> diff --git a/configs/arago-kirkstone-next-config.txt=20
> >>>> b/configs/arago-kirkstone-next-config.txt
> >>>> index dcf935d..9d173df 100644
> >>>> --- a/configs/arago-kirkstone-next-config.txt
> >>>> +++ b/configs/arago-kirkstone-next-config.txt
> >>>> @@ -17,7 +17,7 @@=20
> >>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctop=
roject.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmt=
SSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6Xt=
pQ4A$
> >>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembe=
dded.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLT=
qzQ$
> >>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/m=
eta-ti,kirkstone-next,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T=
-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhE=
Wk-O4dSbfBAtmdwbAMufQiNg$
> >>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/=
meta-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4=
ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk=
-O4dSbfBAtmdwbCq1af67Q$
> >>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/m=
eta-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhg=
wAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
> >>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/me=
ta-clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6=
Ieg$
> >>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/o=
penembedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4=
gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD=
3Rv3BOg$
> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.samp=
le
> >>>> diff --git a/configs/arago-kirkstone-wip-config.txt=20
> >>>> b/configs/arago-kirkstone-wip-config.txt
> >>>> index 9dd72ab..dfe8bd6 100644
> >>>> --- a/configs/arago-kirkstone-wip-config.txt
> >>>> +++ b/configs/arago-kirkstone-wip-config.txt
> >>>> @@ -9,7 +9,7 @@=20
> >>>> meta-virtualization,https://urldefense.com/v3/__https://git.yoctop=
roject.org/meta-virtualization,kirkstone,H__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmt=
SSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD6Xt=
pQ4A$
> >>>> meta-openembedded,https://urldefense.com/v3/__https://git.openembe=
dded.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbBzMLT=
qzQ$
> >>>> meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/m=
eta-ti,kirkstone-wip,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!T-=
4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEW=
k-O4dSbfBAtmdwbAQQJrVpA$
> >>>> meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/=
meta-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!T-4=
ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk=
-O4dSbfBAtmdwbCq1af67Q$
> >>>> -#meta-clang,https://urldefense.com/v3/__https://github.com/kraj/m=
eta-clang,kirkstone,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhg=
wAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbAMXmWGaA$
> >>>> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/me=
ta-clang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbCxgy6=
Ieg$
> >>>> oe-core,https://urldefense.com/v3/__https://git.openembedded.org/o=
penembedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!T-4ApZ-eTAnXM7YmK4=
gmtSSGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbD=
3Rv3BOg$
> >>>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >>>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.samp=
le
> >>>
> >>> Just a heads up, not sure if this can be picked up as is because of=
=20
> >>> legacy devices having issues with meta-clang. It may not be a probl=
em=20
> >>> anymore but I remember that was what provoked the initial removal o=
f=20
> >>> meta-clang back around 9.1. Darren's running some tests.
> >>
> >> I was going to ask if these had been addressed yet...
> >>
> >>
> > Well I guess this was exactly the reason for introducing this layer b=
ack=20
> > in.=C2=A0 I'll run some builds on legacy and see what happens.=C2=A0 =
If it really=20
> > is broken on legacy maybe this is something we fix on master and just=
=20
> > drop this on kirkstone for now and just pull meta-clang layer in for =
the=20
> > chromium builds on non-legacy devices.
>
> We do not have a way to selectively pull in different layers based on
> platform.  All of the platforms are built with the same config.  So we
> either need to fix the legacy code that is not working correctly with
> clang.  Or we need to drop the legacy platforms.

Dropping legacy platforms isn't a solution as a refresh release for all=20
legacy devices
is planned once a year by TI (atleast for SITARA legacy platforms)

Fixing the legacy code to avoid build due to meta-clang OR maintaining a=20
separate config for legacy devices by dropping meta-clang in it
are the alternatives I can think of, with fixing the legacy code being=20
the ideal choice.

Maybe, let's wait until Darren gets back with the build status of legacy=20
platforms with meta-clang.

>
> --=20
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15143):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15143__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtS=
SGBxuhgwAcpVEP9umR0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbDtL4l=
QBA$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104245171/7030289__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9um=
R0-KUKAHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbA4pCf2wQ$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!T-4ApZ-eTAnXM7YmK4gmtSSGBxuhgwAcpVEP9umR0-KUK=
AHuXRzuVl-uWTjTuqtWRxIKm1-NhEWk-O4dSbfBAtmdwbDitwU5tg$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

