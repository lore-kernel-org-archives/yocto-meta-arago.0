Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7F3F952ABF
	for <meta-arago@arago-project.org>;
	Fri, 28 Jul 2017 13:36:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6SDagcY028072
	for <meta-arago@arago-project.org>; Fri, 28 Jul 2017 08:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501249002;
	bh=ssUbY8hADiG0iO0t78h00pEbahoXblvS0Y3ET64cnFU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=mwI6WF6EMdVMDVzZHMDV/AGsjfrGqVg98g1ZviWvZTtPKuu6nKG7GoBgtfJZR0EU3
	xRc/TABdEMtItIQYg5EmcuUTkbUEh2p1C5W0CSOP0H23nT8q0ShRp/c5n/HyjrOOu4
	p4u+vBn6lCSGlTNa7yH2ftzmPa1u5ZHaGKh8qJbs=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6SDabrr003440
	for <meta-arago@arago-project.org>; Fri, 28 Jul 2017 08:36:37 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 28 Jul 2017 08:36:36 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH 4/4]
	packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
Thread-Index: AQHTBy/UgN3uNZVYvkyvpEESN0DtH6JpPaVg
Date: Fri, 28 Jul 2017 13:36:36 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A2539705C@DFLE09.ent.ti.com>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
	<1501194495-48938-5-git-send-email-e-ruei1@ti.com>
	<20170727232650.GS18367@edge>
In-Reply-To: <20170727232650.GS18367@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH 4/4] packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
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
X-List-Received-Date: Fri, 28 Jul 2017 13:36:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, July 27, 2017 7:27 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/master][PATCH 4/4] packagegroup-arago-tisd=
k-matrix: add browser demos for AM5/DRA7

On Thu, Jul 27, 2017 at 06:28:15PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      |=
 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-matrix.bb
> index 7402427..9a19224 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to include Matrix v2"
>  LICENSE =3D "MIT"
> -PR =3D "r66"
> +PR =3D "r67"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> @@ -128,6 +128,7 @@ MATRIX_APPS_append_omap-a15 =3D "     \
>      matrix-gui-generic-pm           \
>      matrix-gui-clocks               \
>      matrix-gui-pm-demos-governor    \
> +    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-browser-de=
mos','',d)} \

Are these really specific to sgx?

[Eric] One of the browser demo is chromium browser which is based on waylan=
d-egl . Does it make sense to allow the browser demos only when SGX is enab=
led? Should I remove the condition?


>  "
> =20
>  MATRIX_APPS_append_dra7xx +=3D " \
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

