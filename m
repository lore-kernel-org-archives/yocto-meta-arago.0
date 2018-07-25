Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 196B3529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 14:13:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PEDCnt097321
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 09:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532527992;
	bh=jmOKj79+mMmx2rY+otwRUXyU93ypT8PIxOX67vXWmUk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=nTee1X6QnJNbYOySZVm9G1phOvW1+VnA10Qm7U0Z5wpjRbQ98mk5RT/oDCQJvoAPi
	YEJkfjVfozMokVgvtoynw5K9a6gNvnEFsbrxze+TB2/x2ayCcUI0dQsh1GEPCasVZJ
	rIW2fLlQxdviH/liByZqJHLEwK77hZAUvt+89nh8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PEDCBJ027896
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 09:13:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 09:13:11 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1466.003; Wed, 25 Jul 2018 09:13:11 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH 2/3] packagegroup-arago-tisdk-addons:
	add pruss-lld-apps
Thread-Index: AQHUJA+/6rqNZgV1Y0CHicIN9nnJD6Sf+xPA
Date: Wed, 25 Jul 2018 14:13:11 +0000
Message-ID: <a59f2ca69a0f4175a72b9e7c207544f0@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
	<1532519588-17585-2-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1532519588-17585-2-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH 2/3] packagegroup-arago-tisdk-addons: add pruss-lld-apps
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2018 14:13:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, July 25, 2018 7:53 AM
> To: meta-arago@arago-project.org
> Cc: Chengalvala, Vivek; Stiffler, Jacob; Gou, Hongmei
> Subject: [meta-processor-sdk][PATCH 2/3] packagegroup-arago-tisdk-
> addons: add pruss-lld-apps
>=20
> Cc: Hongmei Gou <a0271529@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons.bbappend       | 9
> +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-
> addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons.bbappend
> index 2a9bdf8..77986d5 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-
> addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-
> addons.bbappend
> @@ -1,4 +1,4 @@
> -PR_append =3D "-tisdk46"
> +PR_append =3D "-tisdk47"
>=20
>  EXTRA_PACKAGES_append_ti33x =3D " opencv"
>  EXTRA_PACKAGES_append_ti43x =3D " opencv"
> @@ -7,7 +7,12 @@ EXTRA_PACKAGES_append_keystone =3D " opencv"
>  EXTRA_PACKAGES_remove_k2hk-hs-evm =3D "opencv"
>=20
>=20
> -EXTRA_PACKAGES_append_am57xx-evm =3D " jailhouse-examples jailhouse-
> examples-rtos"
> +EXTRA_PACKAGES_append_am335x-evm =3D " pruss-lld-apps"
> +EXTRA_PACKAGES_append_am437x-evm =3D " pruss-lld-apps"
> +EXTRA_PACKAGES_append_k2g-evm  =3D " pruss-lld-apps"
> +EXTRA_PACKAGES_append_am57xx-evm =3D " jailhouse-examples \
> +                                     jailhouse-examples-rtos \
> +                                     pruss-lld-apps"
>=20
>  EXTRA_PACKAGES_append_omapl138 =3D " ccief-basic"
>=20
> --
> 2.7.4


