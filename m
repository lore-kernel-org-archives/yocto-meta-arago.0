Return-Path: <xuj@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4DD18529B8
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2019 13:35:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JDY8ov060853
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 08:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566221648;
	bh=9TyjBFIIhh7ftmKY/MRbBHmdAXkWbEbqXz5YoFkbic0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GLyJ8TfWNn6C046yxRNainBe8qKEEp4YlEyKs4bDkCZd4lagGMKfG+W7Z9fRJGA1D
	jSeDrrkZmy5v+gGlCIG6aM0ejkI0w25TDIXIz9QHOrP2LGJesn87p2Z1W6S+4U1fjw
	T/PJlhcFXOOn82tVTTW/V7hYq0pjtac69jNoTlII=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JDY85U086290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 08:34:08 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 08:34:07 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1713.004; Mon, 19 Aug 2019 08:34:07 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago]  [thud/master] [PATCH] tidl-utils: bump SRCREV
Thread-Index: AQHVUjH2whtyjnmQSkuXp2lfibuBiKcCgRqA
Date: Mon, 19 Aug 2019 13:34:07 +0000
Message-ID: <1778d4007cb848998b76a12d314a66ef@ti.com>
References: <20190809194048.63206-1-xuj@ti.com> <20190813235100.GI7130@beryl>
In-Reply-To: <20190813235100.GI7130@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.116.215]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Mon, 19 Aug 2019 13:35:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No, this doesn't require armnn. Let me run a local am65x build and see what=
's going on. I validated the build for am57xx.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, August 13, 2019 7:51 PM
To: Xu, Jianzhong
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [thud/master] [PATCH] tidl-utils: bump SRCREV

This update fails on am65x. Does it require armnn changes? If so, should be=
 in=20
the series, not 2 separate patches.


On Fri, Aug 09, 2019 at 03:40:48PM -0400, Jianzhong Xu wrote:
> * tidl import tool fixes for non-square padding and Caffe data layer form=
at
>=20
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/met=
a-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 2c29fc27..6fdeec48 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,6 +1,6 @@
>  SRC_URI =3D "git://git.ti.com/tidl/tidl-utils.git;protocol=3Dgit;branch=
=3Dmaster"
> -SRCREV =3D "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
> +SRCREV =3D "b2466e02f99d85d8afcbc93edc612da5cc9345de"
> =20
> -PV =3D "01.01.01.00"
> +PV =3D "01.01.02.00"
>  PR =3D "r0"
> =20
> --=20
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

