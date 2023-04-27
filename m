Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3567C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:18:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25413.1682612288595991951
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 09:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=q7l38ydP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RGI4aw053492;
	Thu, 27 Apr 2023 11:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682612284;
	bh=OvmDeW8Nk0H4Mgp8/FH6adD6b8JD6Bd8rcY/w62gQg0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=q7l38ydPS/m4jQIm7Tnpv2DzWD+eSxUphGDw2vX3qbChT/FvkQOF/HKapEWT4eKOd
	 lDmM+lOlUI3GeqMfEXy8Rj2Tev79HvlVo4N86+pF69ZWkiFIyvmSH6OMOqIerGusE8
	 ZFRDjUf2ZsrWB6ZK6AMVx/PT0kUVcIPxWchG96Kc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RGI4hM027582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 11:18:04 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 11:18:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 11:18:04 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RGI40s002024;
	Thu, 27 Apr 2023 11:18:04 -0500
Message-ID: <e3e2aba4-2f34-b6f4-e24b-cec46b155b90@ti.com>
Date: Thu, 27 Apr 2023 11:18:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/6] arago.conf: drop the
 explicit removal of x11, add vulkan
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230426213214.3501230-1-rs@ti.com>
 <20230426213214.3501230-2-rs@ti.com>
 <bb23f78d-2906-fb8e-26ae-c0f189f5f55b@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <bb23f78d-2906-fb8e-26ae-c0f189f5f55b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 33RGI4aw053492
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Apr 2023 16:18:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14362

On 4/26/23 18:17, Andrew Davis wrote:
> On 4/26/23 4:32 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Drop the explicit removal of x11 as the new PVR Vulkan libs have runti=
me
>> dependencies on libx11.
>>
>> Add vulkan as a distro feature.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>> =C2=A0 meta-arago-distro/conf/distro/arago.conf | 4 +---
>> =C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf=20
>> b/meta-arago-distro/conf/distro/arago.conf
>> index 094e67da..58841051 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -45,12 +45,10 @@ TMPDIR .=3D "${TCMODEAPPEND}"
>> =C2=A0 # Start with default set of distro features
>> =C2=A0 DISTRO_FEATURES =3D "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATUR=
ES_LIBC}"
>> -# Remove some unwanted features
>> -DISTRO_FEATURES:remove =3D "x11"
>=20
> This is probably fine, but to get it to work on our SGX platforms
> I also needed:
>=20
> PACKAGECONFIG:remove:pn-xserver-xorg =3D "dri3"
> PACKAGECONFIG:remove:pn-xserver-xorg =3D "xshmfence"
> PACKAGECONFIG:remove:pn-xserver-xorg =3D "glx"
> PACKAGECONFIG:remove:pn-cairo =3D "opengl"
> PACKAGECONFIG:remove:pn-libepoxy =3D "x11"
> PACKAGECONFIG:remove:pn-mesa-demos =3D "gbm"
> PACKAGECONFIG:remove:pn-mesa-demos =3D "wayland"
> PACKAGECONFIG:remove:pn-mesa-demos =3D "glew"
> PACKAGECONFIG:remove:pn-mesa-demos =3D "glu"
>=20
> To prevent any of these trying to build against desktop OpenGL or GLESv=
3.
>=20
>> -
>> =C2=A0 # Add additional distro features
>> =C2=A0 DISTRO_FEATURES:append =3D " pam wayland opengl"
>> =C2=A0 #DISTRO_FEATURES:append =3D " opencl"
>> +DISTRO_FEATURES:append =3D " vulkan"
>=20
> You going to add Vulkan support to SGX? You do remember we have
> to turn that back on at some point...
>=20
> Ideally, like "opengl", these should become machine features, not distr=
o.
>=20
> Andrew
>=20
>> =C2=A0 DISTRO_FEATURES:append =3D " opencv"
>> =C2=A0 DISTRO_FEATURES:append =3D " openmp"

Invalid arg. Enabling vulkan doesn't have the same effect is enabling=20
opengl. It changes compilation flags but right now all userspace tools=20
that we care about are capable of switching backends at runtime. SGX=20
doesn't have a vulkan driver so it should fail-over to gl automatically.

