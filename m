Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 98B6F52A1F
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 18:05:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LI5fxv007924
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506017141;
	bh=Le996qMeoQTpzf/m/TgKge62yhDoTQVP+lcmEoGhvYA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=i6/ur3LVPsMvChQK9fft0+Gz0ywILXq7n3PoY68HnJPRbwszusTImlaj2k2jAlzl/
	bOaw6zBaEw0y1lvG0nPbXpc97KWwTj7m+r61/y8UNMErYdWKigDSwFXLxBQ1a+r0xE
	XqHZPuOxEmcWu/9YvKdGiK2UZtG7BuWP54dprPAQ=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LI5fOq015230
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 13:05:41 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 21 Sep 2017 13:05:41 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processsor-sdk] [PATCH]
	pruss-lld-rtos: add DEPENDS on ti-cgt-pru-native
Thread-Index: AQHTMl4zzaEaL+REIUSF/bqQ0xU2T6K/o5sw
Date: Thu, 21 Sep 2017 18:05:40 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825455E2E@DFLE09.ent.ti.com>
References: <1505945802-11705-1-git-send-email-a0271529@ti.com>
In-Reply-To: <1505945802-11705-1-git-send-email-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processsor-sdk] [PATCH] pruss-lld-rtos: add DEPENDS on ti-cgt-pru-native
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
X-List-Received-Date: Thu, 21 Sep 2017 18:05:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK. As we discussed, the toolchain dependency will go into the ti-pdk clas=
s, similar to the other toolchains.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Wednesday, September 20, 2017 6:17 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [EXTERNAL] [meta-arago] [meta-processsor-sdk] [PATCH] pruss-lld-
> rtos: add DEPENDS on ti-cgt-pru-native
>=20
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pr=
uss-
> lld/pruss-lld-rtos_git.bb
> index 499afce..7a05def 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> +++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> @@ -5,11 +5,11 @@ require recipes-bsp/pruss-lld/pruss-lld.inc
>  require recipes-bsp/pruss-lld/pruss-lld-1.0.0.inc
>=20
>=20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>=20
>  S =3D "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
>=20
> -DEPENDS_append =3D " osal-rtos"
> +DEPENDS_append =3D " osal-rtos ti-cgt-pru-native"
>  DEPENDS_append_ti33x =3D " starterware-rtos"
>  DEPENDS_append_ti43x =3D " starterware-rtos"
>=20
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

