Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6364C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 13:42:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7802.1711028545826544829
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 06:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=YDa9isko;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42LDgOZc026512;
	Thu, 21 Mar 2024 08:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711028544;
	bh=s8Kdu4loSbY+Rqk/gQhZPPLZvBW+FGHmK3QpKlB58Zw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YDa9iskonbbfhBk2Bf6kz7F7ClUypwRjOVjiFju0Fdy2cc5/vnigz6nWm9EGfVbM4
	 n5JkPbk1tW90VnzJWCyc285ILHBJqxAZuZ7xr28vVHr9HvQaL41z6Y974HMJOTsh5H
	 O/hWmBC2SDqUGzI2su0rVyjSruJHSAHosLWrLOCQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42LDgO8l046076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 08:42:24 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Mar 2024 08:42:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Mar 2024 08:42:23 -0500
Received: from [10.249.33.218] ([10.249.33.218])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42LDgNvl060882;
	Thu, 21 Mar 2024 08:42:23 -0500
Message-ID: <5e90f139-f116-4ca8-98ca-3b682885e4d0@ti.com>
Date: Thu, 21 Mar 2024 08:42:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] README: update with
 scarthgap specific info
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20240320200531.24045-1-reatmon@ti.com>
 <3e343cf5-61af-43a0-ae52-ead498b1d050@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <3e343cf5-61af-43a0-ae52-ead498b1d050@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 42LDgOZc026512
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Mar 2024 13:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15248



On 3/20/2024 11:22 PM, Chirag Shilwant wrote:
> Hi Ryan,
>=20
> On 21/03/24 01:35, Ryan Eatmon via lists.yoctoproject.org wrote:
>> All READMEs were still mentioning master, update that. Signed-off-by:=20
>> Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> --- meta-arago-demos/RE=
ADME | 14=20
>> +++++++------- meta-arago-distro/README | 16 ++++++++--------=20
>> meta-arago-extras/README | 14 +++++++-------
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> ZjQcmQRYFpfptBannerEnd
>> All READMEs were still mentioning master, update that.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 meta-arago-demos/README=C2=A0 | 14 +++++++-------
>> =C2=A0 meta-arago-distro/README | 16 ++++++++--------
>> =C2=A0 meta-arago-extras/README | 14 +++++++-------
>> =C2=A0 meta-arago-test/README=C2=A0=C2=A0 | 12 ++++++------
>> =C2=A0 4 files changed, 28 insertions(+), 28 deletions(-)
>>
>> diff --git a/meta-arago-demos/README b/meta-arago-demos/README
>> index bb586c14..8d40e48e 100644
>> --- a/meta-arago-demos/README
>> +++ b/meta-arago-demos/README
>> @@ -1,30 +1,30 @@
>> =C2=A0 meta-arago-demos provides demo applications to showcase in TI S=
DK=20
>> products
>> -This layer works with the latest Yocto Project release (currently=20
>> 2.2+) and tracks
>> -the stable/maintenance branches (currently "master") of the=20
>> corresponding layers:
>> +This layer works with the latest Yocto Project release (currently=20
>> 5.0+) and tracks
>> +the stable/maintenance branches (currently "scarthgap") of the=20
>> corresponding layers:
>> =C2=A0 URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta
>> =C2=A0 URI: git://git.yoctoproject.org/meta-ti
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-ti-bsp, meta-ti-extras
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arm
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-arm, meta-arm-toolchain
>> =C2=A0 URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-oe, meta-networking, meta-python
>>  =20
>> URI:https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5__=
;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2iix=
_C6327YVmzoUSbm_RXGBQsrl8nrOtf_Tw$
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 Send pull requests to meta-arago@lists.yoctoproject.org
>> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
>> index 49e9d9e1..8712de4e 100644
>> --- a/meta-arago-distro/README
>> +++ b/meta-arago-distro/README
>> @@ -1,34 +1,34 @@
>> =C2=A0 meta-arago-distro provides Arago distribution configuration for=
 TI=20
>> SDK products
>> -This layer works with the latest Yocto Project release (currently=20
>> 2.2+) and tracks
>> -the stable/maintenance branches (currently "master") of the=20
>> corresponding layers:
>> +This layer works with the latest Yocto Project release (currently=20
>> 5.0+) and tracks
>> +the stable/maintenance branches (currently "scarthgap") of the=20
>> corresponding layers:
>> =C2=A0 URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta
>> =C2=A0 URI: git://git.yoctoproject.org/meta-ti
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-ti-bsp, meta-ti-extras
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arm
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-arm, meta-arm-toolchain
>> =C2=A0 URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-oe, meta-networking, meta-python
>>  =20
>> URI:https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5__=
;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2iix=
_C6327YVmzoUSbm_RXGBQsrl8nrOtf_Tw$
>> -branch: master
>> +branch: scarthgap
>=20
>=20
> Hold on, looks like meta-qt5 still hasn't created a scratchgap branch -=
=20
> https://github.com/meta-qt5/meta-qt5/tree/scratchgap

I know.  I'm just staging files in prep for that.

>=20
>> =C2=A0 revision: HEAD
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arago
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-arago-extras
>> diff --git a/meta-arago-extras/README b/meta-arago-extras/README
>> index 5b6e8a15..58ac7df2 100644
>> --- a/meta-arago-extras/README
>> +++ b/meta-arago-extras/README
>> @@ -1,30 +1,30 @@
>> =C2=A0 meta-arago-extras provides additional TI SDK applications that =
are=20
>> distro-agnostic
>> -This layer works with the latest Yocto Project release (currently=20
>> 2.2+) and tracks
>> -the stable/maintenance branches (currently "master") of the=20
>> corresponding layers:
>> +This layer works with the latest Yocto Project release (currently=20
>> 5.0+) and tracks
>> +the stable/maintenance branches (currently "scarthgap") of the=20
>> corresponding layers:
>> =C2=A0 URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta
>> =C2=A0 URI: git://git.yoctoproject.org/meta-ti
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-ti-bsp, meta-ti-extras
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arm
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-arm, meta-arm-toolchain
>> =C2=A0 URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-oe, meta-networking, meta-python
>>  =20
>> URI:https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5__=
;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2iix=
_C6327YVmzoUSbm_RXGBQsrl8nrOtf_Tw$
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 Send pull requests to meta-arago@lists.yoctoproject.org
>> diff --git a/meta-arago-test/README b/meta-arago-test/README
>> index 8f1f9993..5aa96cd2 100644
>> --- a/meta-arago-test/README
>> +++ b/meta-arago-test/README
>> @@ -1,25 +1,25 @@
>> =C2=A0 meta-arago-test provides an additional packagegroup ti-test and=
 some=20
>> of the recipes that go into that group
>> -This layer works with the latest Yocto Project release (currently=20
>> 2.2+) and tracks
>> -the stable/maintenance branches (currently "master") of the=20
>> corresponding layers:
>> +This layer works with the latest Yocto Project release (currently=20
>> 5.0+) and tracks
>> +the stable/maintenance branches (currently "scarthgap") of the=20
>> corresponding layers:
>> =C2=A0 URI: git://git.openembedded.org/openembedded-core
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta
>> =C2=A0 URI: git://git.yoctoproject.org/meta-ti
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-ti-bsp, meta-ti-extras
>> =C2=A0 URI: git://git.yoctoproject.org/meta-arm
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-arm, meta-arm-toolchain
>> =C2=A0 URI: git://git.openembedded.org/meta-openembedded
>> -branch: master
>> +branch: scarthgap
>> =C2=A0 revision: HEAD
>> =C2=A0 layers: meta-oe, meta-networking, meta-python
>> --=20
>> 2.17.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online=20
>> (#15245):https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-arago/message/15245__;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9n=
dNVtHM_fjh5l_avqOR9pwH2iix_C6327YVmzoUSbm_RXGBQsrl8m0k0Txog$
>> Mute This=20
>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10=
5052432/7030289__;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fj=
h5l_avqOR9pwH2iix_C6327YVmzoUSbm_RXGBQsrl8lFzaQ9Gg$
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-arago/unsub__;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtH=
M_fjh5l_avqOR9pwH2iix_C6327YVmzoUSbm_RXGBQsrl8kep7nvNw$=C2=A0 [c-shilwant=
@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

