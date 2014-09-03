Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 15A7152976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 14:46:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83EkJaq027751
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:46:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83EkJOE020800
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 09:46:19 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 09:46:18 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 10/12] wl18xx-compat:
	version	update
Thread-Index: AQHPx3R/z+ihHFNsmU6SMlxwNiJqEpvvfJpQ
Date: Wed, 3 Sep 2014 14:46:18 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72707C@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-11-git-send-email-a0393906@ti.com>
In-Reply-To: <1409748091-12617-11-git-send-email-a0393906@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [for dora] [PATCH v2 10/12] wl18xx-compat: version	update
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
X-List-Received-Date: Wed, 03 Sep 2014 14:46:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of R, Karthik
> Sent: Wednesday, September 03, 2014 7:41 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [for dora] [PATCH v2 10/12] wl18xx-compat: version
> update
>=20
> From: Yaniv Machani <yanivma@ti.com>
>=20
> - Update to latest version tag - ol_r8.a9.14
> - move to git.ti.com and use backports module.
> - clean some unused commands.
>=20
> Signed-off-by: Yaniv Machani <yanivma@ti.com>
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> Conflicts:
>=20
> 	meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb
>=20
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroup-arago-tisdk-connectivity.bb       |  3 +-
>  .../ti-compat-wireless-wl18xx_r8.a8.10.bb          | 61 ----------------=
------
>  .../ti-compat-wireless-wl18xx_r8.a9.14.bb          | 51 ++++++++++++++++=
++
>  3 files changed, 53 insertions(+), 62 deletions(-)  delete mode 100644 m=
eta-
> arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-
> wl18xx_r8.a8.10.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-
> compat-wireless-wl18xx_r8.a9.14.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index fa82e7e..6a51fdb 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-ti
> +++ sdk-connectivity.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install wireless packages into the target FS"
>  LICENSE =3D "MIT"
> -PR =3D "r25"
> +PR =3D "r27"
[Franklin] No big deal but this should be r26
>=20
>  inherit packagegroup
>=20
> @@ -31,6 +31,7 @@ WLAN_COMMON =3D "\
>  #    netperf
>=20
>  FIRMWARE_AND_DRIVERS =3D "\
> +    ti-compat-wireless-wl18xx \
>      wl18xx-firmware \
>  "
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx_r8.a8.10.bb
> deleted file mode 100644
> index 0e7281a..0000000
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-
> wireless-wl18xx_r8.a9.14.bb b/meta-arago-extras/recipes-bsp/ti-compat-
> wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
> new file mode 100644
> index 0000000..dca2edb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireles
> +++ s-wl18xx_r8.a9.14.bb
> @@ -0,0 +1,51 @@
> +# This is a TI specific version of the compat-wireless recipe using a #
> +compat-wireless package created from the TI Systems Tested mac80211
> releases.
> +
> +DESCRIPTION =3D "ti compat-wireless drivers for wl18xx"
> +HOMEPAGE =3D "https://git.ti.com/wilink8-wlan/wl18xx"
> +SECTION =3D "kernel/modules"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> +
> +RDEPENDS_${PN} =3D "wireless-tools"
> +
> +PV =3D "r8.a9.14"
> +inherit module
> +
> +PR =3D "${MACHINE_KERNEL_PR}+a+gitr${SRCPV}"
> +
> +# Tags: ol_r8.a9.14
> +SRCREV_wl18xx =3D "0e48c4b55cfa0d557a098cbe92b1f092f1a9ad67"
> +BRANCH_wl18xx =3D "ap_p2p"
> +SRCREV_backports =3D "0d46f43a2f3ccdd53de19eee5b9c674bf8ef09a2"
> +BRANCH_backports =3D "ap_dfs_mbss_all"
> +
> +SRCREV_FORMAT =3D "wl18xx"
> +
> +S =3D "${WORKDIR}/compat-wireless"
> +
> +SRC_URI =3D "git://git.ti.com/wilink8-
> wlan/wl18xx.git;branch=3D${BRANCH_wl18xx};destsuffix=3Dwl18xx;name=3Dwl18=
x
> x \
> +
> +git://git.ti.com/wilink8-
> wlan/backports.git;branch=3D${BRANCH_backports};destsuffix=3Dbackports;na=
m
> e=3Dbackports \  "
> +
> +export KLIB_BUILD=3D"${STAGING_KERNEL_DIR}"
> +export KLIB=3D"${D}"
> +
> +do_configure() {
> +    cd "${WORKDIR}/backports"
> +    unset CC
> +    #Generate compat-wireless
> +    python ./gentree.py --clean  "${WORKDIR}/wl18xx"
> "${WORKDIR}/compat-wireless"
> +
> +    cd ${S}
> +    make defconfig-wl18xx
> +
> +    # Now generate the sourceipk with the properly configured sources
> +	sourceipk_do_create_srcipk
> +}
> +
> +do_install() {
> +    # Install modules
> +    oe_runmake modules_install
> +}
> +
> --
> 2.0.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

