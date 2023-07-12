Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C83DEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 20:06:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.73.1689192398290744155
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Jul 2023 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xcphw9kz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: b-brnich@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36CK6aK0047965;
	Wed, 12 Jul 2023 15:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689192396;
	bh=00Ph4GCAUkPSfWnYVLDYibL+jUgjZlx2NYqgMadXoIc=;
	h=From:To:CC:Subject:Date;
	b=xcphw9kzf6JyKpFiM7rzaQrZXnm0c9ne0Cl76+PlJU4Cigf1tFkMSFWX14CfKbC/o
	 hozd3vtqFQeef9nLIxTPoaibk11TtiN8ri8Ld37Sajr2G+LDVx2GHi4XvxrrgqcskK
	 7No+Rlr0V4AGMvdEyeQOh3BSATuwFNlho+f/1m8o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36CK6aSa031614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jul 2023 15:06:36 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jul 2023 15:06:36 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.023; Wed, 12 Jul 2023 15:06:36 -0500
From: "Brnich, Brandon" <b-brnich@ti.com>
To: "Thakkar, Devarsh" <devarsht@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "denys@konsulko.com"
	<denys@konsulko.com>
CC: "Menon, Nishanth" <nm@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>,
        "Bhatia, Aradhya" <a-bhatia1@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Nori, Sekhar" <nsekhar@ti.com>, "Davis, Andrew" <afd@ti.com>,
        "Sapp, Randolph" <rs@ti.com>, "Jain, Nikhil"
	<n-jain1@ti.com>,
        "Limaye, Aniket" <a-limaye@ti.com>,
        "Jagannathan, Shyam"
	<shyam.jagannathan@ti.com>,
        "Gupta, Gyan" <g-gupta@ti.com>, "Pothukuchi,
 Vijay" <vijayp@ti.com>
Subject: RE: [meta-arago] [kirkstone] [PATCH] arago.conf: Enable coretracers
 in gstreamer1.0
Thread-Topic: [meta-arago] [kirkstone] [PATCH] arago.conf: Enable coretracers
 in gstreamer1.0
Thread-Index: Adm0/CSyFmqRygmohUOmZLomxc1etg==
Date: Wed, 12 Jul 2023 20:06:36 +0000
Message-ID: <c341c99a8a0544ac85648513f53f74c5@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.22.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Jul 2023 20:06:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14797

Hi Devarsh,

> -----Original Message-----
> From: meta-arago@lists.yoctoproject.org <meta-
> arago@lists.yoctoproject.org> On Behalf Of Devarsh Thakkar via
> lists.yoctoproject.org
> Sent: Tuesday, July 11, 2023 10:48 AM
> To: Eatmon, Ryan <reatmon@ti.com>; meta-arago@lists.yoctoproject.org;
> Bajjuri, Praneeth <praneeth@ti.com>; denys@konsulko.com
> Cc: Menon, Nishanth <nm@ti.com>; Raghavendra, Vignesh
> <vigneshr@ti.com>; Bhatia, Aradhya <a-bhatia1@ti.com>; Luthra, Jai <j-
> luthra@ti.com>; Khasim, Syed Mohammed <khasim@ti.com>; Nori, Sekhar
> <nsekhar@ti.com>; Davis, Andrew <afd@ti.com>; Sapp, Randolph
> <rs@ti.com>; Jain, Nikhil <n-jain1@ti.com>; Thakkar, Devarsh
> <devarsht@ti.com>; Limaye, Aniket <a-limaye@ti.com>; Jagannathan, Shyam
> <shyam.jagannathan@ti.com>; Gupta, Gyan <g-gupta@ti.com>; Pothukuchi,
> Vijay <vijayp@ti.com>; Etheridge, Darren <detheridge@ti.com>
> Subject: [meta-arago] [kirkstone] [PATCH] arago.conf: Enable
> coretracers in gstreamer1.0
>=20
> Enable coretracers packageconfig
> for gstreamer1.0 package to include gstreamer coretracers such as latency
> tracer, leak tracer e.t.c in base gstreamer package
>=20
> Without this change, the gstreamer tracers were not getting included.
>=20
> Fixes: 1fbb3fb3 ("conf: arago: Adding tracer-hooks build flag to
> gstreamer1.0")
>=20
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Acked-by: Brandon Brnich <b-brnich@ti.com>

> ---
>  meta-arago-distro/conf/distro/arago.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> distro/conf/distro/arago.conf
> index bb074478..43553678 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -123,7 +123,7 @@ PACKAGECONFIG:append:pn-libsdl2 =3D " kmsdrm"
>  PACKAGECONFIG:append:pn-openssl =3D " cryptodev-linux"
>=20
>  # Enable GST_TRACER logging in gstreamer
> -PACKAGECONFIG:append:pn-gstreamer1.0 =3D " tracer-hooks"
> +PACKAGECONFIG:append:pn-gstreamer1.0 =3D " tracer-hooks coretracers"
>=20
>  # Enable kmssink in gstreamer
>  PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad =3D " kms"
> --
> 2.34.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14794): https://lists.yoctoproject.org/g/meta-
> arago/message/14794
> Mute This Topic: https://lists.yoctoproject.org/mt/100081468/7553481
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [b-
> brnich@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


