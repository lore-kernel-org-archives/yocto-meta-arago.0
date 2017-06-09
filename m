Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3B1545299C
	for <meta-arago@arago-project.org>;
	Fri,  9 Jun 2017 20:19:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v59KJVQZ022985
	for <meta-arago@arago-project.org>; Fri, 9 Jun 2017 15:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497039571;
	bh=ZPKXAs1UdOMMWh1zKv/UrckYl1D/sZB/AXoj6kscEuc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=twXig/IszZAk42yCzP4ylV28+d0sKi6LDMajNqYSxHzbYqpREdi59pdzl3njKvLlv
	nsCNGlNia3NBFoHQv/+WgJDU53N4bBZbcT/o/LxywWCcQeOAQTAd0QC5neMObp2Nm8
	9NJ5qeFdBW33QS3L1eJBWwOjP8kpkzcI8I9vzXBw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v59KJV9Z005762
	for <meta-arago@arago-project.org>; Fri, 9 Jun 2017 15:19:31 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 9 Jun 2017 15:19:31 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [morty/master][PATCH] arago-core-tisdk-image:
	disable	deployment of MLO only for k2g HS device
Thread-Index: AQHS4VtUrEG1KMriMkSI7gIGkaVfgaIc+Ivw
Date: Fri, 9 Jun 2017 20:19:31 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926D3A59B@DLEE08.ent.ti.com>
References: <1497038541-71848-1-git-send-email-denys@ti.com>
In-Reply-To: <1497038541-71848-1-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [morty/master][PATCH] arago-core-tisdk-image: disable	deployment of MLO only for k2g HS device
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
X-List-Received-Date: Fri, 09 Jun 2017 20:19:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, June 09, 2017 4:02 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [morty/master][PATCH] arago-core-tisdk-image:
> disable deployment of MLO only for k2g HS device
>=20
> Be specific and only unset it for k2g HS device, as k2g GP does provide
> MLO/SPL
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
> image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
> image.bb
> index 974db93..d361c3d 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> @@ -4,7 +4,8 @@ DEPLOY_SPL_NAME_omapl138 =3D ""
>  DEPLOY_SPL_NAME_k2hk =3D ""
>  DEPLOY_SPL_NAME_k2l-evm =3D ""
>  DEPLOY_SPL_NAME_k2e =3D ""
> -DEPLOY_SPL_NAME_k2g =3D ""
> +# Only unset it for HS device, as k2g GP does provide MLO/SPL
> +DEPLOY_SPL_NAME_k2g-hs-evm =3D ""
>=20
>  ARAGO_TISDK_IMAGE ?=3D "arago-core-tisdk-image"
>  export IMAGE_BASENAME =3D "${ARAGO_TISDK_IMAGE}"
> --
> 2.7.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

