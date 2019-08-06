Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3B4A052980
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2019 19:44:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76Ji02e074364
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565120640;
	bh=2tBeHXB7mlRzqXicXTg6W1qBhkkpTsTahbuLMomJY34=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=PljFc9vg6RofUUj5CdXpyMNDypShNYlupSGwL+d24cy3p++10liM2qi6WB3FB7AKg
	A5uq8RqIwhDcw1GWbZlUsDuaoLMoWSYuktTzjUe/oAOY/4rybXCbiKYTXpuLUPBqJ8
	jVUyFDBJitNeSX3yFkWXVSEkA+c01ABcRexgtzkk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76Jhxvb116595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 14:43:59 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1713.004; Tue, 6 Aug 2019 14:43:59 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH]
	fftlib: SRCREV update
Thread-Index: AQHVTIjUvjt5/ikRPEa16A19M8vLaqbu1/iA//+tXIA=
Date: Tue, 6 Aug 2019 19:43:59 +0000
Message-ID: <18895bd764e3490ca0fa8c13ab00be2d@ti.com>
References: <1565117853-52717-1-git-send-email-m-radhakrishnan2@ti.com>
	<1565117853-52717-2-git-send-email-m-radhakrishnan2@ti.com>
	<d399164245e345a0a93aab9c824d25b2@ti.com>
In-Reply-To: <d399164245e345a0a93aab9c824d25b2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH] fftlib: SRCREV update
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
X-List-Received-Date: Tue, 06 Aug 2019 19:44:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for that. I have re-submitted the patch on to meta-arago[thud]. Pleas=
e let me know if that's okay

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Tuesday, August 6, 2019 3:39 PM
To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
Subject: RE: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH] ff=
tlib: SRCREV update

This will not apply in meta-processor-sdk. Please submit to meta-arago.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Tuesday, August 06, 2019 2:58 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH]
> fftlib: SRCREV update
>=20
> SRCREV udpate to include big-endian descope
> ---
>  meta-arago-extras/recipes-ti/fftlib/fftlib.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-
> extras/recipes-ti/fftlib/fftlib.inc
> index ab5baf5..f6d5935 100644
> --- a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
> +++ b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
> @@ -1,5 +1,5 @@
>  PV =3D "3_1_0_0"
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
>=20
>  require recipes-ti/includes/arago-paths.inc
>=20
> @@ -9,7 +9,7 @@ FFTLIB_GIT_PROTOCOL =3D "git"
>  FFTLIB_GIT_BRANCH =3D "master"
>  FFTLIB_GIT_DESTSUFFIX =3D "${WORKDIR}/git"
>=20
> -FFTLIB_SRCREV =3D "54fb858e97235c0a3cd948d24d22329653a7837f"
> +FFTLIB_SRCREV =3D "e05426894c73af940ccc26880ebd7f2c9ce21880"
>=20
>  BRANCH =3D "${FFTLIB_GIT_BRANCH}"
>  SRC_URI =3D
> "${FFTLIB_GIT_URI};destsuffix=3D${FFTLIB_GIT_DESTSUFFIX};protocol=3D${FFT=
LIB
> _GIT_PROTOCOL};branch=3D${BRANCH}"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

