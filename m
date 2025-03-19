Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857D2C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:35:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.12824.1742402103481346413
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 09:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=gfETBaWF;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JGZ21h3000320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 11:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742402102;
	bh=qGL5pi1QRFVvrOxgVTyR4yA4K4NFWyN/jP9Z0uH1bZ0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=gfETBaWFkPeVeF5IFOdL3tDYdls7HceSV7uJckr1Apf/gNiZvLYbI9KxJ+4pOIGsw
	 srvxmqhnfu67xcj+sbZMGsRcMr2cjVpVZxypZ3O5zo4PY3gX7KAhimfx/pYFIbzIo1
	 lCVZk5Nh5Tu3tkRO9kWnziy1PwX+VShaTItkl9jM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JGZ2Re054647
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 11:35:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 11:35:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 11:35:02 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JGZ2YN090541;
	Wed, 19 Mar 2025 11:35:02 -0500
Message-ID: <d88362f9-fac6-4173-bdd5-ebd0a6d1cab5@ti.com>
Date: Wed, 19 Mar 2025 11:35:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] ti-gc320-tests: Update
 SRCREV for recipe
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250318024235.3581162-1-a-christidis@ti.com>
 <6bffdb51-01f2-4cbc-a6ab-b55e81a3c71e@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <6bffdb51-01f2-4cbc-a6ab-b55e81a3c71e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 52JGZ21h3000320
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:35:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16090


On 3/19/25 9:19 AM, Ryan Eatmon wrote:
>
>
> On 3/17/2025 9:42 PM, Antonios Christidis via lists.yoctoproject.org=20
> wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Include a new SRCREV for the recipe to build from. This is not a new=20
>> version of
>> the tests repo, instead the new commit sha includes cross compilation=20
>> errors
>> fixes.
>
> Agreed.=C2=A0 This is the better way of doing this.
>
>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> =C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb=20
>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb=20
>>
>> index f9b9685f..02605d98 100644
>> ---=20
>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb
>> +++=20
>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb
>> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM =3D=20
>> "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=3D22a0018554
>> =C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>> =C2=A0 -BRANCH =3D "ti-${PV}"
>> +BRANCH =3D "ti-${PV}-scarthgap"
>
> Why did we create a scarthgap branch?=C2=A0 The issues being addressed =
are=20
> far more broad and not specific to scarthgap?
Very good point, initially I post-fixed "scarthgap" for the sake of=20
consistency with the ti-gc320-libs recipe, as it too has a post-fixed=20
"scarthgap". But, the changes made here (tests) and there (libs) are not=20
specific to scarthgap branch. So, I'll update the branch name to just=20
ti-${PV}.
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=3Dhttps;bran=
ch=3D${BRANCH}=20
>> \
>> file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch=
 \
>> =C2=A0 "
>
> This will not apply to master as my previous patch that addressed some=20
> of the compile issues was already accepted and promoted to master, and=20
> your patch is missing the removal of that patch.=C2=A0 I never applied =
my=20
> patch to scarthgap.
>
> This needs to be split into two patches, one for scarthgap and one for=20
> master.

Will do. Ty for the feedback.

>
>> -SRCREV =3D "53207f8e360a3336276b62066a1d8a9e923de17e"
>> +SRCREV =3D "3c334f2004c718c9bb4321213c362e65c491efe6"
>> =C2=A0 PR =3D "r2"
>> =C2=A0 =C2=A0 S =3D "${WORKDIR}/git"
>

