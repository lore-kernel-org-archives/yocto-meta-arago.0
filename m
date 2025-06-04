Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507C2C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 18:05:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.23587.1749060308669651445
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 11:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rqEN59Z/;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554I55fj3872048;
	Wed, 4 Jun 2025 13:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749060305;
	bh=FGIN21K4LSzhNJWciPLuC0nel4mWs4JNeYUwQeXWfxA=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=rqEN59Z/RqUrg1NDvcANBRW82FOUov4l0kXZTiRNwpjlZPJGdtG5ocQ+QDCFpD69L
	 9sQbvZcq8VKLiqJQseXlGWmQcl4OfmfLVK28P3eqyY/gHWLA7i7gE9jE9Kc8PNkKMk
	 6tVqHL23DvQ3hAHqCgIl5mekOu17Zf1ToDftcAUg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554I55rN535895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 13:05:05 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 13:05:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 13:05:04 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554I54cj2346141;
	Wed, 4 Jun 2025 13:05:04 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 4 Jun 2025 13:05:04 -0500
Message-ID: <DADY4RC641ZA.3BX1QO4JRZVZL@ti.com>
To: Andrew Davis <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vijayp@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH]
 packagegroup-arago-tisdk-graphics: add mesa-demos and sdl2
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250602220116.2091347-1-rs@ti.com>
 <4b4f002d-69f1-44e6-a5f0-e5abece7e210@ti.com>
In-Reply-To: <4b4f002d-69f1-44e6-a5f0-e5abece7e210@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jun 2025 18:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16252

On Tue Jun 3, 2025 at 3:00 PM CDT, Andrew Davis wrote:
> On 6/2/25 5:01 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Add the new mesa-demos package to this group so that users and scripts
>> can use eglinfo to query information about supported extensions and
>> configs for multiple platforms. It also adds vkgears and es2gears to
>> test Vulkan and GLES 2 respectively.
>>=20
>> Add libsdl2 as it's a useful, minimal graphics toolkit that allows users
>> to build GLES and Vulkan applications with less boilerplate. We have a
>> few internal test applications that currently use it.
>
> Any reason these applications could not be added here? libsdl2 like other
> pure libraries should only be added as dependencies of the applications
> that use them.
>
> Andrew

While I normally agree with this sentiment, there are currently private tes=
t
applications that depend on SDL2. I can tack this directly into the test gr=
oups
if that's preferable. There was just some talk about introducing it as cust=
omers
who don't want the overhead of Qt may find it preferable to raw EGL+GLES.

- Randolph

>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-tisdk-graphics.bb          | 2 ++
>>   1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-graphics.bb
>> index fc1a5be3..3728ae52 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-graphics.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti=
sdk-graphics.bb
>> @@ -9,6 +9,8 @@ inherit packagegroup
>>   GFX_WAYLAND =3D "\
>>       weston-init-arago \
>>       weston-examples \
>> +    mesa-demos \
>> +    libsdl2 \
>>   "
>>  =20
>>   RDEPENDS:${PN} =3D "\


