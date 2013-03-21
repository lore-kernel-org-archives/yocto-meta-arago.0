Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C4FF8529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:18:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCIvEp019409
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:18:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCIvRu030148
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:18:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:18:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 13/17] ti-wifi-utils: Add runtime
	dependency on	wilink-calibrate
Thread-Index: AQHOJRFVV8j8mlL5lkmBqdz8KP5zOpiwEldg
Date: Thu, 21 Mar 2013 12:18:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948ECAD@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-13-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-13-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 13/17] ti-wifi-utils: Add runtime dependency on	wilink-calibrate
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
X-List-Received-Date: Thu, 21 Mar 2013 12:18:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

See re-order comment from last patch


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 13/17] ti-wifi-utils: Add runtime
> dependency on wilink-calibrate
>=20
> * Install the wilink calibrate script to insure that the wilink
> module is using
>   a unique MAC address.
> * By default this script only works for the wilink module that
> comes with
>   the am335x evms.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb       |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-
> wifi-utils_r5.sp3.05.bb b/meta-arago-extras/recipes-devtools/ti-
> wifi-utils/ti-wifi-utils_r5.sp3.05.bb
> index e9f5a3c..6f46910 100644
> --- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils_r5.sp3.05.bb
> +++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-
> utils_r5.sp3.05.bb
> @@ -3,6 +3,8 @@ require ti-wifi-utils.inc
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4725015cb0be7be389cf06deeae3683d"
>=20
> -PR_append =3D"a+gitr${SRCPV}"
> +PR_append =3D"b+gitr${SRCPV}"
>=20
>  SRCREV =3D "ol_R5.SP3.05"
> +
> +RDEPENDS_${PN}_am335x-evm_append =3D " wilink-calibrate"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

