Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BD3C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:10:28 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.86664.1753722625112283366
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 10:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=n2uwCSqZ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SHAJ3Z2806513;
	Mon, 28 Jul 2025 12:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753722619;
	bh=VnGhHxYpcjWeGmyv1QSrlwo/ocExbXbiLA0wtvT/+Qg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=n2uwCSqZV4Q6ww7SU1KlIWqf9Pcnw6e45UUg3cSDbZ9MTP15eqRuqh2LeLvYk6XOJ
	 +yr85XwQvGDVRFEiyNKutXNMESKF9w1053dgvMZED37UcUplDfMBHfP6Dj6y12DIha
	 WAF7AeoMwEW/RABgJx/MUCJSSw/AKszkZKUI/2BM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SHAJVo1838243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 12:10:19 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 12:10:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 12:10:19 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SHAJ3Y2100667;
	Mon, 28 Jul 2025 12:10:19 -0500
Message-ID: <92f77bf4-c652-4f48-bb34-b9d836c24f03@ti.com>
Date: Mon, 28 Jul 2025 12:10:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] Tags from ARM-software repository
 are now in another branch
To: <miguel.salvatierra3222@ctag.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
References: <AS4PR10MB5743C880C7F7D12B9AF14DAEE45AA@AS4PR10MB5743.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <AS4PR10MB5743C880C7F7D12B9AF14DAEE45AA@AS4PR10MB5743.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 56SHAJ3Z2806513
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 17:10:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16327

On 7/28/25 7:28 AM, Miguel Salvatierra Veleiro via lists.yoctoproject.org=
 wrote:
> Good afternoon,
>=20
> I tried to fetch the sources from recipe /meta-arago/meta-arago-extras/=
recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb in scar=
thgap but the SRCREV are not found in the github.com/ARM-software/Compute=
Library.git repository. All the tags in this repo are moved to a new bran=
ch called archived-releases. I've changed the branch to "archived-release=
s" parameter in the SRC_URI and now it works. How can I request to merge =
this change?
>=20

Hmm, so looks like ARM decided to force rebase their main branch.. The de=
velopment for
arm-compute-library happens over here[0]. The github page is where they p=
ut their releases
which I assumed would make it *more* stable, and yet they go and rebase i=
t and force push
removing commits breaking our SDK builds :(

For now, yes, your patch looks correct. To request this change, you simpl=
y need to send
it to this same mailing list (meta-arago@lists.yoctoproject.org) as a pro=
per git format-patch
patch. Or if you would like I can make that patch and send it here for yo=
u.

Andrew

[0] https://git.mlplatform.org/ml/ComputeLibrary.git/

> diff --git a/meta-arago-extras/recipes-devtools/arm-compute-library/arm=
-compute-library_24.12.bb b/meta-arago-extras/recipes-devtools/arm-comput=
e-library/arm-compute-library_24.12.bb
> index f4129a75..db376433 100644
> --- a/meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library_24.12.bb
> +++ b/meta-arago-extras/recipes-devtools/arm-compute-library/arm-comput=
e-library_24.12.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>   LIC_FILES_CHKSUM =3D "file://LICENSES/MIT.txt;md5=3D35f8944fae9729766=
91f3483b0ac9dba"
>=20
>   SRC_URI =3D " \
> -    git://github.com/ARM-software/ComputeLibrary.git;branch=3Dmain;pro=
tocol=3Dhttps \
> +    git://github.com/ARM-software/ComputeLibrary.git;branch=3Darchived=
-releases;protocol=3Dhttps \
>       file://0001-fix-Fix-indention-in-cmake-generator-script.patch \
>       file://0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.=
patch \
>       file://0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.=
patch \
>=20
> Miguel,
>=20
>=20
> Content Classification:
>=20
>=20
>=20
> Public
>=20
> =E2=88=9A
>=20
> Internal
>=20
>=20
>=20
> Confidential
>=20
>=20
>=20
> Secret
>=20
>=20
>=20
> [cid:4724218e-d2f5-4e90-9cca-ab0044278fe0]
>=20
> CTAG - Centro Tecnol=C3=B3gico de Automoci=C3=B3n de Galicia
> Pol=C3=ADgono Industrial "A GRANXA", Calle "A=E2=80=9C, 249-250
> Porri=C3=B1o 36475 (Pontevedra). SPAIN.
> Tfn: (+34) 986 900 300         Privacy Policy<https://ctag.com/wp-conte=
nt/uploads/politica_integrada_2009.pdf>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16325): https://lists.yoctoproject.org/g/meta-arago=
/message/16325
> Mute This Topic: https://lists.yoctoproject.org/mt/114414449/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20


