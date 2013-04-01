Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2746452981
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 20:29:17 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31KTFjv030769
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 15:29:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31KTFrw027210
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 15:29:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 1 Apr 2013 15:29:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/3] tisdk-connectivity: remove drivers
	and	firmware for ti33x
Thread-Index: AQHOLvWQ0NF4rEkDmEu+TrhnSBi++JjB0Avg
Date: Mon, 1 Apr 2013 20:29:14 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C418FC3@DFLE08.ent.ti.com>
References: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
	<1364833527-8440-3-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364833527-8440-3-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] tisdk-connectivity: remove drivers and	firmware for ti33x
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
X-List-Received-Date: Mon, 01 Apr 2013 20:29:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

3.8 kernel is in development (not released) while the 3.2 kernel along with=
 the AMSDK will be released shortly.

You shouldn't break things for users who have a stable release to use for s=
omething that won't be released for several months. I would recommend creat=
ing a testing/integration layer to make these kind of changes.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, April 01, 2013 11:25 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 2/3] tisdk-connectivity: remove drivers and
> firmware for ti33x
>=20
> * Remove the drivers and firmware packages for ti33x until they
>   have been updated to work with the latest v3.8 kernel.  This is
>   in preparation to switch the default kernel to the v3.8 kernel.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 +--
>  .../packagegroup-arago-tisdk-connectivity.bb       |    3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-host.bb
> index 0d9b242..1ca6ddd 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wlan and bluetooth sources into the SDK=
"
>  LICENSE =3D "MIT"
> -PR =3D "r3"
> +PR =3D "r4"
>=20
>  inherit packagegroup
>=20
> @@ -17,7 +17,6 @@ CONNECTIVITY_RDEPENDS =3D ""
>=20
>  CONNECTIVITY_RDEPENDS_am37x-evm =3D
> "${FIRMWARE_AND_DRIVERS_SRC}"
>  CONNECTIVITY_RDEPENDS_am180x-evm =3D
> "${FIRMWARE_AND_DRIVERS_SRC}"
> -CONNECTIVITY_RDEPENDS_ti33x =3D "${FIRMWARE_AND_DRIVERS_SRC}"
>=20
>  RDEPENDS_${PN} =3D "\
>      ${CONNECTIVITY_RDEPENDS} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index d3b1f46..3902611 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wlan and bluetooth packages into the ta=
rget
> FS"
>  LICENSE =3D "MIT"
> -PR =3D "r5"
> +PR =3D "r6"
>=20
>  inherit packagegroup
>=20
> @@ -77,7 +77,6 @@ CONNECTIVITY_RDEPENDS_ti33x =3D "\
>      ${WLAN_COMMON} \
>      ${BLUETOOTH_STACK} \
>      ${DEMO_APPS} \
> -    ${FIRMWARE_AND_DRIVERS} \
>  "
>=20
>  RDEPENDS_${PN} =3D "\
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

