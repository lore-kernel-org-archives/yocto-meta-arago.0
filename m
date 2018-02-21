Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E6D415298F
	for <meta-arago@arago-project.org>;
	Wed, 21 Feb 2018 01:44:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1L1i8RT015304
	for <meta-arago@arago-project.org>; Tue, 20 Feb 2018 19:44:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519177448;
	bh=Hsc/HiexSq3edeSy8hjtnzALHskxwewFYAG90neAjnw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=HZrJCPiqqnpIFC6kYB5aCyTjcRc/laqUTRemuv/PJHShpke0jtgTpWIRy9eMeKDPw
	NvrkpCyuCoYVybD500maCuUQ5obSyZjzimoztuUeStfJdeb1IQ2EDSs3C2k6AhwSXS
	eC+V3kjjfvXSsAK81ju0bi+bZovMT6+uvEKfS+aI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1L1i8LG005419
	for <meta-arago@arago-project.org>; Tue, 20 Feb 2018 19:44:08 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Feb 2018 19:44:08 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1261.035; Tue, 20 Feb 2018 19:44:08 -0600
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-processor-sdk] [PATCH] opencv: Fix OpenCL
	linking with unused DSP library
Thread-Index: AQHTqqwQpquavbxFjUiX0c4cesGFh6OuegqA//+bfVA=
Date: Wed, 21 Feb 2018 01:44:08 +0000
Message-ID: <f7fcf5ec1f2f473ca987d6651b07afa0@ti.com>
References: <1519173405-4505-1-git-send-email-x0157990@ti.com>
	<20180221014341.GJ12117@edge>
In-Reply-To: <20180221014341.GJ12117@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.102.235]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-processor-sdk] [PATCH] opencv: Fix OpenCL linking with unused DSP library
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
X-List-Received-Date: Wed, 21 Feb 2018 01:44:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes

From: Dmytriyenko, Denys=20
Sent: Tuesday, February 20, 2018 8:44 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org; Senicic, Djordje
Subject: Re: [meta-arago] [meta-processor-sdk] [PATCH] opencv: Fix OpenCL l=
inking with unused DSP library

Will this be submitted upstream to meta-arago proper?


On Tue, Feb 20, 2018 at 07:36:45PM -0500, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend=
 b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> index bf33a2e..3915c4d 100644
> --- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> +++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> @@ -11,7 +11,7 @@ SRC_URI_append +=3D "\
>       file://setupEnv.sh \
>  "
> =20
> -SRCREV_opencv =3D "4458601eb2766461f2f9da0d2527ff25ecb20284"
> +SRCREV_opencv =3D "9b88e8c746e531a1b4cc61e5235e4e747c319945"
> =20
>  DEPENDS_remove_keystone =3D "qtbase"
> =20
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

