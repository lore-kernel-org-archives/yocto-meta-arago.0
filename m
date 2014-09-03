Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 759CB52976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:45:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83EjOg1021598
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:45:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EjOcU020114
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:45:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:45:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 08/12] wl18xx-target-scripts
	:	Add new WiFi related scripts
Thread-Index: AQHPx3R9fhLouEIEyUeGR+qZAsM4epvvfHjQ
Date: Wed, 3 Sep 2014 14:45:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72705B@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-9-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-9-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 08/12] wl18xx-target-scripts :	Add new WiFi related scripts
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
X-List-Received-Date: Wed, 03 Sep 2014 14:45:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 08/12] wl18xx-target-scripts :
> Add new WiFi related scripts
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> New scripts to ease the use of wifi modes-  Start/Stop - Station, AP, P2P=
 and
> Multi Role.
>  Station connection scripts.
>  Driver load/unload.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |  3 ++-
>  .../wl18xx-target-scripts_r8.a9.14.bb              | 25 ++++++++++++++++=
++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)  mode change 100644 =3D=
>
> 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb
>  create mode 100755 meta-arago-extras/recipes-connectivity/wl18xx-
> target-scripts/wl18xx-target-scripts_r8.a9.14.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> old mode 100644
> new mode 100755
> index 7b3480c..fa82e7e
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wireless packages into the target FS"
>  LICENSE =3D "MIT"
> -PR =3D "r24"
> +PR =3D "r25"
>=20
>  inherit packagegroup
>=20
> @@ -24,6 +24,7 @@ WLAN_COMMON =3D "\
>      crda \
>      hostap-daemon-wl18xx \
>      ti-wifi-utils-wl18xx \
> +    wl18xx-target-scripts \
>  "
>=20
>  # netperf has non-standard license, needs verifying diff --git a/meta-ar=
ago-
> extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-
> scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-
> target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> new file mode 100755
> index 0000000..8ba0092
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18x
> +++ x-target-scripts_r8.a9.14.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Scripts and configuration files for TI wireless drivers=
"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://README;beginline=3D1;endline=3D21;md5=3Db8d6a0865f50159bf5c0d175d=
1
> f4a705"
> +
> +PR =3D"r1+gitr${SRCPV}"
> +
> +# Tag: ol_r8.a9.14
> +SRCREV =3D "4d9f47235501fb2c665b6336a54e0ba152e8e941"
> +BRANCH =3D "sitara-mbss"
> +SRC_URI =3D "git://git.ti.com/wilink8-wlan/wl18xx-target-
> scripts.git;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +FILES_${PN} +=3D "${datadir}/wl18xx/"
> +
> +do_install() {
> +	install -d ${D}${datadir}/wl18xx/
> +
> +	scripts=3D`find ./ -type f -name "*\.sh"`
> +	for s in $scripts
> +	do
> +		install -m 0755 $s ${D}${datadir}/wl18xx/
> +	done
> +}
> +
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

