Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id D9358529A2
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 20:47:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2MKlIWc004303
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 15:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521751638;
	bh=iBdZHFvbjbz22YiRLFu7m6KLYjChNLs4agWCguWUW/8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=GsxB7KSV3QWhO/RkgcYdjLhlckGZbTd1dPH3M0wFzvySt1ZXx9aCblJSVz+NH1NGw
	UKQPK/QTrkkNyYsUxH0CfcpFsJRLznqlxuCP3YTj1qKbt8fro0umORrXk/UM7wCTqy
	rxpk7JE3g6DKD/uKdD7nGh+YOnHQm7frl+sR4yxQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2MKlI33001205
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 15:47:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 15:47:18 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 22 Mar 2018 15:47:18 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	starterware: SRCREV bump to 02.01.01.05C
Thread-Index: AQHTwhEa89cLjJMII0u0Todc23hMzqPcub7Q
Date: Thu, 22 Mar 2018 20:47:17 +0000
Message-ID: <aec378f206d147abb3b81ef6d2520e23@ti.com>
References: <1521745675-12724-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1521745675-12724-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] starterware: SRCREV bump to 02.01.01.05C
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
X-List-Received-Date: Thu, 22 Mar 2018 20:47:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, March 22, 2018 3:08 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
> starterware: SRCREV bump to 02.01.01.05C
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/starterware/starterware-02.01.01.06.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/starterware/starterware-02.01.01.06.inc b/recipe=
s-
> bsp/starterware/starterware-02.01.01.06.inc
> index b5a1b4c..ce478e2 100644
> --- a/recipes-bsp/starterware/starterware-02.01.01.06.inc
> +++ b/recipes-bsp/starterware/starterware-02.01.01.06.inc
> @@ -1,5 +1,5 @@
> -# Below commit ID corresponds to
> "DEV.STARTERWARE.PROCSDK.02.01.01.06B"
> -STARTERWARE_SRCREV =3D "ba2396ef6e533c6d6bccea0b8e2dd37406e6eebc"
> +# Below commit ID corresponds to
> "DEV.STARTERWARE.PROCSDK.02.01.01.06C"
> +STARTERWARE_SRCREV =3D "c8bbba0b37303529307be608ecca5fee66099973"
>=20
> -PV =3D "02.01.01.06B"
> +PV =3D "02.01.01.06C"
>  INC_PR =3D "r0"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

