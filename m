Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BA2C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:31:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.6810.1741213878417318443
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 14:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=d1ZjvlfO;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525MVHQd3981931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 16:31:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741213877;
	bh=UcGutK+KI++Wh3IDyPHjiaWA9qCf2giG1lnDe/fPsnM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=d1ZjvlfO+nhSExXNIYGtU/9Pp2fBF5Qz5exezz0A+czqp6u3MpB2a2EERvoUgIoNu
	 6eUISebkhJwNtxfU5KVkaVqqqa4dy/ypDgSLqwQFpcibgH7YOQOuufFkHo9/pIzUeV
	 obN8KKrXSg+PYBChTin5p5czKjTculiUz2xM4Kig=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525MVHBb035319
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 16:31:17 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 16:31:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 16:31:17 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525MVHfs086890;
	Wed, 5 Mar 2025 16:31:17 -0600
Message-ID: <3738e4d2-7bc1-41c9-a6de-4cd6ab216725@ti.com>
Date: Wed, 5 Mar 2025 16:31:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH]
 packagegroup-arago-tisdk-graphics : Add ti-gc320-libs-dev package
From: Antonios Christidis <a-christidis@ti.com>
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Ryan
 Eatmon <reatmon@ti.com>
References: <20250305161648.351534-1-a-christidis@ti.com>
 <affeb199-26ac-46fb-b931-d6d129c66f78@ti.com>
 <5533c6e2-8a0a-4ab2-a1cb-9fa3ffb10a6c@ti.com>
Content-Language: en-US
In-Reply-To: <5533c6e2-8a0a-4ab2-a1cb-9fa3ffb10a6c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 525MVHQd3981931
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Mar 2025 22:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15947

Ryan reject this patch, I'm sending a new patch that will edit the=20
ti-gc320-tests recipe that will achieve the same thing.

On 3/5/25 1:22 PM, Antonios Christidis wrote:
>
> On 3/5/25 12:32 PM, Andrew Davis wrote:
>> On 3/5/25 10:16 AM, Antonios Christidis via lists.yoctoproject.org=20
>> wrote:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> Reformat the packagegroup, by creating the GFX_GC320 variable which n=
ow
>>> includes ti-gc320-tests and the ti-gc320-libs-dev package. This is=20
>>> needed as
>>> the -dev package includes the symb link for the library.
>>>
>>> This patch goes hand in hand with a patch series sent to meta-ti=20
>>> porting gc320
>>> to kernel 6.12 .
>>>
>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> ---
>>> =C2=A0 .../packagegroups/packagegroup-arago-tisdk-graphics.bb=C2=A0=C2=
=A0=C2=A0 | 8=20
>>> +++++++-
>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb=20
>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb=20
>>>
>>> index a82db154..60806446 100644
>>> ---=20
>>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
>>> +++=20
>>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-graphics.bb
>>> @@ -16,11 +16,17 @@ GFX_UTILS:append:omap-a15=C2=A0 =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glsdk-util-scripts \
>>> =C2=A0 "
>>> =C2=A0 +GFX_GC320 =3D "\
>>> +=C2=A0=C2=A0=C2=A0 ti-gc320-libs-dev\
>>
>> Do you really need this? The -dev package will be pulled into
>> the sysroot for any package that DEPENDS on the library.
>>
> Good point, the only package that needs libs-dev is ti-gc320-tests,=20
> I'll update that recipe RRDEPENDS instead of going this route.
>
>>> +=C2=A0=C2=A0=C2=A0 ti-gc320-tests\
>>> +"
>>> +
>>> +
>>
>> Extra newline?
>
> I'll fix this.
>
>>
>>> =C2=A0 RDEPENDS:${PN} =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libegl \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glmark2 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kmscube \
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('MACHINE_FEATURES', 'gc320',=
=20
>>> 'ti-gc320-tests', '', d)} \
>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('MACHINE_FEATURES', 'gc320',=
=20
>>> "${GFX_GC320}", '', d)} \
>>
>> Is there some test package that depends on ti-gc320-tests, maybe=20
>> ltp-ddt?
>> If so then this should be a RDEPENDS in that package instead.
>>
> There's no package that depends on it.
>> Andrew
>>
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}",=20
>>> '', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GFX_UTILS} \
>>> =C2=A0 "

