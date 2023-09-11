Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A446EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:44:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.156.1694447083737276698
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 08:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wV3aiUXG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38BFigfN048641
	for <meta-arago@lists.yoctoproject.org>; Mon, 11 Sep 2023 10:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694447082;
	bh=W3S7m4KSrnnBpzcdB87jTsYuixncYb8gXBe9ZUIg7uQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=wV3aiUXG9vv9od46YGLx+R9tbT+K2DKaQRG4qjzqKN+/uDOsw++qHP8mZWXyKzZNC
	 6CIFdCQuzUOfxN9g/ID4B+br9bajKYY/F0kxnTrVuMviGaHI9D/3a/vjU0wc4INufv
	 l9IO2TOGG+hB98BBr6LEcCDvO/oLz4zpD9d6YtIM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38BFigB4125833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 11 Sep 2023 10:44:42 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Sep 2023 10:44:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Sep 2023 10:44:42 -0500
Received: from [10.249.36.168] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38BFigHK116310;
	Mon, 11 Sep 2023 10:44:42 -0500
Message-ID: <652a7ef5-cb69-3667-4630-6eb60827eae6@ti.com>
Date: Mon, 11 Sep 2023 10:44:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Update
 processor-sdk-09.00.00-config.txt
Content-Language: en-US
To: <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <1783DB9DFBFFA2A1.23877@lists.yoctoproject.org>
 <81f269d0-39a3-6949-1e38-616fb9d1d5ec@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <81f269d0-39a3-6949-1e38-616fb9d1d5ec@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 38BFigfN048641
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Sep 2023 15:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14896


I already applied it...  I'll revert it.



On 9/11/2023 10:12 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
> NAK. This update is not needed as of now.
>=20
> On 11/09/23 19:05, Chirag Shilwant via lists.yoctoproject.org wrote:
>> - Update processor-sdk-09.00.00-config.txt for AM62x & AM64x
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 .../processor-sdk-09.00.00-config.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++++---------
>> =C2=A0 1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/configs/processor-sdk/processor-sdk-09.00.00-config.txt=20
>> b/configs/processor-sdk/processor-sdk-09.00.00-config.txt
>> index d3a00b0..7671d81 100644
>> --- a/configs/processor-sdk/processor-sdk-09.00.00-config.txt
>> +++ b/configs/processor-sdk/processor-sdk-09.00.00-config.txt
>> @@ -1,16 +1,17 @@
>> =C2=A0 # This file takes repo entries in the format
>> =C2=A0 # repo name,repo uri,repo branch,repo=20
>> commit[,layers=3Dlayer1:layer2...:layern]
>> -bitbake,https://git.openembedded.org/bitbake,2.0,0c6f86b60cfba67c2073=
3516957c0a654eb2b44c
>> -meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,a=
1d9091cd914ce0bc69958891628a4cf86ed3e96,layers=3D
>> -meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processo=
r-sdk.git,kirkstone,9dad5765d33783f940ba3c32f4fc431e2b308621,layers=3D
>> -meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00=
.006,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos
>> -meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,bff5bd937=
f0776166e81a63f3dd39ede348ef758,layers=3D
>> -meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d,layers=3D
>> -meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,346753705e49a2486867dc150181a1c7f4d69377,layers=3Dmeta-networking:m=
eta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>> -meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.006,l=
ayers=3Dmeta-ti-extras:meta-ti-bsp
>> -meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,96aad3b29aa7=
a5ee4df5cf617a6336e5218fa9bd,layers=3Dmeta-arm:meta-arm-toolchain
>> -oe-core,https://git.openembedded.org/openembedded-core,kirkstone,f20a=
12ead2d5890e88e7f4ce149a777de47edc48,layers=3Dmeta
>> +bitbake,https://git.openembedded.org/bitbake,2.0,41b6684489d026175334=
4956042be2cc4adb0159
>> +meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,kirkstone,d=
c78e4f3906774ac281dbb89fab258bef4efd2f4,layers=3D
>> +meta-processor-sdk,https://git.ti.com/git/processor-sdk/meta-processo=
r-sdk.git,kirkstone,d62bb16a9490216371b0ccf0a11e967582d7a681,layers=3D
>> +meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,09.00.00=
.009,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos
>> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,31930afca=
79b74e0c788452d71356c1f045e7979,layers=3D
>> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,=
kirkstone,e60f59f3567b78286ea34337dbae468a5f18f1c6,layers=3D
>> +meta-openembedded,https://git.openembedded.org/meta-openembedded,kirk=
stone,529620141e773080a6a7be4615fb7993204af883,layers=3Dmeta-networking:m=
eta-python:meta-oe:meta-gnome:meta-filesystems
>> +meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,09.00.00.009,l=
ayers=3Dmeta-ti-extras:meta-ti-bsp
>> +meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca=
0a6b5f8f90b4715958546fc41d73,layers=3Dmeta-arm:meta-arm-toolchain
>> +meta-clang,https://github.com/kraj/meta-clang,kirkstone,2d08d6bf376a1=
e06c53164fd6283b03ec2309da4,layers=3D
>> +oe-core,https://git.openembedded.org/openembedded-core,kirkstone,8cea=
eff90023e51c7e874464f026b30d24035bda,layers=3Dmeta
>> =C2=A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>> =C2=A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
>> =C2=A0 BITBAKE_INCLUSIVE_VARS=3Dyes
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14895):=20
> https://lists.yoctoproject.org/g/meta-arago/message/14895
> Mute This Topic: https://lists.yoctoproject.org/mt/101292591/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

