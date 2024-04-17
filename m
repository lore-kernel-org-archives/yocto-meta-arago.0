Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF41C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 06:05:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6048.1713333933329951053
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 23:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=M7Zzqwsi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43H65UY7113462;
	Wed, 17 Apr 2024 01:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713333930;
	bh=UJpel/efxPasuYCnDkzjhiU2E5QA06KVC5WYC+XhYaI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M7ZzqwsiKV20c/K/TgkzC70/2wMxtGXHzKNfPnxZM47gEzZ+y1K7rm9nUpR4A9O42
	 S4wdlSyytxb1WOjmFCo5sXPSSYt9GO/i4vMjGHsginQbmaqqnthgNNfNToM+nhdwQE
	 CLbKw/t2Z1CCANllYpHbtwYDQf1SQ7t9ifqQzeKY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43H65UPt022886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 01:05:30 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 01:05:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 01:05:30 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43H65Sa8038972;
	Wed, 17 Apr 2024 01:05:29 -0500
Message-ID: <74265976-61a1-4e63-9ade-3ba5ae759f9e@ti.com>
Date: Wed, 17 Apr 2024 11:35:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] meta-arago-extras:
 packagegroups: Fix QA Issue
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>
References: <17C6AE87F40E31DD.13290@lists.yoctoproject.org>
 <2636a20d-6d1a-40d0-abc4-2d97653764b6@ti.com>
 <20240416150926.GJ28791@denix.org>
 <04ade28e-de1a-43d4-afce-3c335bec8d97@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <04ade28e-de1a-43d4-afce-3c335bec8d97@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 43H65UY7113462
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Apr 2024 06:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15296


On 17/04/24 00:57, Ryan Eatmon wrote:
>
>
> On 4/16/2024 10:09 AM, Denys Dmytriyenko wrote:
>> On Tue, Apr 16, 2024 at 12:07:33PM +0530, Chirag Shilwant wrote:
>>> Just a head's up,
>>>
>>> Note that the reason to send the patch on scarthgap only is to=20
>>> ensure that
>>> we don't break compatibility with all the older releases we have=20
>>> listed in
>>> LAYERSERIES_COMPAT in arago master [1] as "inherit_defer" was added
>>> in bitbake's latest versions
>>> and someone using arago master:HEAD & bitbake 2.0 for
>>> |kirkstone|based buildwill face build issues
>>> related to inherit_defer.
>>>
>>> [1]:=20
>>> https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-dist=
ro/conf/layer.conf#n11
>>
>> Ah, thanks for the clarification, I didn't see this reply and just=20
>> commented
>> about master for the original patch.
>>
>> That said, this raises the question whether master should get its
>> compatibility updated to not be compatible with kirkstone any more.
>
> Probably.=C2=A0 I'll send the needed changes.

Great, Thanks Ryan!


>
>
>>
>>> On 16/04/24 11:53, Chirag Shilwant via lists.yoctoproject.org wrote:
>>>> - Since packagegroup.=E2=80=8Abbclass is using inherit_defer in oe-c=
ore,
>>>> some classes are now appearing after nativesdk resulting in
>>>> following QA errors. ``` QA Issue:
>>>> nativesdk-packagegroup-arago-tisdk-host: native/nativesdk class is
>>>> not inherited
>>>> ZjQcmQRYFpfptBannerStart
>>>> This message was sent from outside of Texas Instruments.
>>>> Do not click links or open attachments unless you recognize the
>>>> source of this email and know the content is safe. If you wish to
>>>> report this message to IT Security, please forward the message as
>>>> an attachment to phishing@list.ti.com
>>>> ZjQcmQRYFpfptBannerEnd
>>>> - Since packagegroup.bbclass is using inherit_defer in oe-core,=20
>>>> some classes are
>>>> now appearing after nativesdk resulting in following QA errors.
>>>>
>>>> =C2=A0 ```
>>>> =C2=A0=C2=A0 QA Issue: nativesdk-packagegroup-arago-tisdk-host:=20
>>>> native/nativesdk class is not inherited last, this can result in=20
>>>> unexpected behaviour. Classes inherited after native/nativesdk:=20
>>>> allarch.bbclass [native-last]
>>>> =C2=A0=C2=A0 QA Issue: nativesdk-packagegroup-arago-qte-toolchain-ho=
st:=20
>>>> native/nativesdk class is not inherited last, this can result in=20
>>>> unexpected behaviour. Classes inherited after native/nativesdk:=20
>>>> allarch.bbclass [native-last]
>>>>
>>>> =C2=A0 ```
>>>>
>>>> - To fix this issue, use inherit_defer that was added in bitbake=20
>>>> recently [1].
>>>>
>>>> [1]:https://urldefense.com/v3/__https://github.com/openembedded/bitb=
ake/commit/5c2e840eafeba1f0f754c226b87bfb674f7bea29__;!!G3vK!XlpMRQ0dPBA3=
Up6LIrRyo2n5gEKzSXWswqZ4IyG9eG84QRRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEG=
Lw0V9We6idkBab_$=20
>>>>
>>>>
>>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>>> ---
>>>> .../nativesdk-packagegroup-arago-qte-toolchain-host.bb | 3 ++-
>>>> .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb | 3 ++-
>>>> =C2=A0 2 files changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-qte-toolchain-host.bb=20
>>>> b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-qte-toolchain-host.bb=20
>>>>
>>>> index 4d2a98ad..23c45abf 100644
>>>> ---=20
>>>> a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-qte-toolchain-host.bb
>>>> +++=20
>>>> b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-qte-toolchain-host.bb
>>>> @@ -2,7 +2,8 @@ DESCRIPTION =3D "Host packages for Qt Embedded SDK"
>>>> =C2=A0 PR =3D "r10"
>>>> =C2=A0 LICENSE =3D "MIT"
>>>> -inherit packagegroup nativesdk
>>>> +inherit packagegroup
>>>> +inherit_defer nativesdk
>>>> =C2=A0 RDEPENDS:${PN} =3D "\
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-packagegroup-arago-tisdk-ho=
st \
>>>> diff --git=20
>>>> a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-tisdk-host.bb=20
>>>> b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-tisdk-host.bb=20
>>>>
>>>> index 7e77d12f..92a80b6b 100644
>>>> ---=20
>>>> a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-tisdk-host.bb
>>>> +++=20
>>>> b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegrou=
p-arago-tisdk-host.bb
>>>> @@ -2,7 +2,8 @@ SUMMARY =3D "Host packages for a standalone Arago SD=
K=20
>>>> with TI tools"
>>>> =C2=A0 PR =3D "r2"
>>>> =C2=A0 LICENSE =3D "MIT"
>>>> -inherit packagegroup nativesdk
>>>> +inherit packagegroup
>>>> +inherit_defer nativesdk
>>>> =C2=A0 PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
>>>> --=20
>>>> 2.34.1
>

