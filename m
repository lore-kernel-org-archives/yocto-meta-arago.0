Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0C2C05298B
	for <meta-arago@arago-project.org>;
	Tue,  1 Jul 2014 16:05:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61G5RG7022803
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:05:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61G5R2v006150
	for <meta-arago@arago-project.org>; Tue, 1 Jul 2014 11:05:27 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 1 Jul 2014 11:05:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] Add am57xx-evm support and use dra7xx
	SOC_FAMILY
Thread-Index: AQHPlUCZPI0TcrjsJ0q840pFLdsnVJuLYfvg
Date: Tue, 1 Jul 2014 16:05:25 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D8098@DFLE08.ent.ti.com>
References: <1404228277-7421-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1404228277-7421-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] Add am57xx-evm support and use dra7xx	SOC_FAMILY
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
X-List-Received-Date: Tue, 01 Jul 2014 16:05:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, July 01, 2014 10:25 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] Add am57xx-evm support and use dra7xx
> SOC_FAMILY
>=20
> * Update the packages and appends in meta-arago to use the dra7xx
>   SOC_FAMILY and add support for the am57xx-evm machine type.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          |    4 ++--
>  .../openssl/openssl_1.0.1e.bbappend                |    3 +++
>  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
>  .../packagegroups/packagegroup-arago-gst.bb        |    2 +-
>  .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
>  .../packagegroup-arago-tisdk-crypto-sdk-host.bb    |    2 +-
>  .../packagegroup-arago-tisdk-crypto-sdk-target.bb  |    2 +-
>  .../packagegroup-arago-tisdk-crypto.bb             |    2 +-
>  .../packagegroup-arago-tisdk-multimedia.bb         |    8 +++++++-
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++--
>  .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 ++--
>  .../amsdk-av-files/amsdk-av-files_1.1.bb           |    2 +-
>  12 files changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-
> fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-
> fw_3.21.00.02.bb
> index e855e8b..232301f 100644
> --- a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.bb
> +++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-fw_3.21.00.02.b
> +++ b
> @@ -7,7 +7,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  FWVER =3D "eng-4-gb9283b0"
>  PR =3D "r0+${FWVER}"
>=20
> -COMPATIBLE_MACHINE =3D "omap5-evm|dra7xx-evm"
> +COMPATIBLE_MACHINE =3D "omap5-evm|dra7xx"
>=20
>  INHIBIT_PACKAGE_STRIP =3D "1"
>  INSANE_SKIP_${PN} =3D "arch"
> @@ -20,7 +20,7 @@ SRC_URI[md5sum] =3D
> "4fcba6844949ea909131684a80233800"
>  SRC_URI[sha256sum] =3D
> "3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
>=20
>  FW_FILES_omap5-evm =3D "tesla-dsp.xe64T ducati-m3-core0.xem3"
> -FW_FILES_dra7xx-evm =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-
> fw.xem4 dra7-ipu2-fw.xem4"
> +FW_FILES_dra7xx =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-ipu1-
> fw.xem4 dra7-ipu2-fw.xem4"
>=20
>  do_compile() {
>      :
> diff --git a/meta-arago-distro/recipes-
> connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-distro/recipes-
> connectivity/openssl/openssl_1.0.1e.bbappend
> index 9b6bf00..f58edb5 100644
> --- a/meta-arago-distro/recipes-
> connectivity/openssl/openssl_1.0.1e.bbappend
> +++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbap
> +++ pend
> @@ -17,12 +17,14 @@ PR_append =3D "-arago9"
>  DEPENDS_append_ti33x_class-target =3D " cryptodev"
>  DEPENDS_append_ti43x_class-target =3D " cryptodev"
>  DEPENDS_append_dra7xx-evm_class-target =3D " cryptodev"
> +DEPENDS_append_am57xx-evm_class-target =3D " cryptodev"
>=20
>  python __anonymous () {
>      crypdep =3D d.getVar("DEPENDS").replace("ocf-linux ", "")
>      d.setVar("DEPENDS_ti33x_class-target", crypdep)
>      d.setVar("DEPENDS_ti43x_class-target", crypdep)
>      d.setVar("DEPENDS_dra7xx-evm_class-target", crypdep)
> +    d.setVar("DEPENDS_am57xx-evm_class-target", crypdep)
>  }
>=20
>  CRYPTODEV_AFALG_PATCHES =3D " \
> @@ -36,6 +38,7 @@ CRYPTODEV_AFALG_PATCHES =3D " \
> SRC_URI_append_ti33x_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
>  SRC_URI_append_ti43x_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
>  SRC_URI_append_dra7xx-evm_class-target =3D
> "${CRYPTODEV_AFALG_PATCHES}"
> +SRC_URI_append_am57xx-evm_class-target =3D
> "${CRYPTODEV_AFALG_PATCHES}"
>=20
>  # Override do_configure to replace target with linux-armv4 to enable ASM
> code  # optimization for ARM arch (including armv7) for extra performance
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image=
.inc
> b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index c38e277..2932714 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -19,7 +19,7 @@ TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev
> libgnutls-extra26 libgnutls-openssl2  DTB_FILTER =3D "unknown"
>  DTB_FILTER_ti33x =3D "am335x"
>  DTB_FILTER_omap5-evm =3D "omap5"
> -DTB_FILTER_dra7xx-evm =3D "dra7"
> +DTB_FILTER_dra7xx =3D "dra7"
>  DTB_FILTER_ti43x =3D "am43"
>  DTB_FILTER_keystone =3D "k2hk"
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-gst.bb
> index 9e35f26..03a04c4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> gst.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gs
> +++ t.bb
> @@ -16,7 +16,7 @@ GSTREAMER =3D " \
>=20
>  GSTREAMER_ACCEL_MM =3D ""
>  GSTREAMER_ACCEL_MM_omap-a15 =3D "gst-plugins-ducati"
> -GSTREAMER_ACCEL_MM_append_dra7xx-evm =3D " gst-plugins-vpe"
> +GSTREAMER_ACCEL_MM_append_dra7xx =3D " gst-plugins-vpe"
>=20
>  RDEPENDS_${PN} =3D "\
>      ${GSTREAMER} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-test.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-test.bb
> index b8b85a0..54d44e1 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-te
> +++ st.bb
> @@ -22,6 +22,7 @@ ARAGO_TEST =3D "\
>      yavta \
>      "
>=20
> +ARAGO_TI_TEST_am57xx-evm =3D ""
>  ARAGO_TI_TEST =3D "\
>      ltp-ddt \
>      input-utils \
> @@ -36,7 +37,7 @@ ARAGO_TI_TEST_append_omap-a15 =3D " \
>      bvtest \
>      "
>=20
> -ARAGO_TI_TEST_append_dra7xx-evm =3D " \
> +ARAGO_TI_TEST_append_dra7xx =3D " \
>      vpe-vpdma \
>      "
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
> index bb406d7..492e174 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-crypto-sdk-host.bb
> @@ -13,7 +13,7 @@ CRYPTO_RDEPENDS_append_ti43x =3D " ti-crypto-
> examples-src"
>=20
>  CRYPTO_RDEPENDS_append_ti33x =3D " cryptodev-module-src"
>  CRYPTO_RDEPENDS_append_ti43x =3D " cryptodev-module-src"
> -CRYPTO_RDEPENDS_append_dra7xx-evm =3D " cryptodev-module-src"
> +CRYPTO_RDEPENDS_append_dra7xx =3D " cryptodev-module-src"
>=20
>  CRYPTO_RDEPENDS_append_am37x-evm =3D "\
>      ti-ocf-crypto-module-src \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
> index fa14649..b3df987 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-crypto-sdk-target.bb
> @@ -10,7 +10,7 @@ CRYPTO_API =3D "ocf-linux-dev"
>=20
>  CRYPTO_API_ti33x =3D "cryptodev-module-dev"
>  CRYPTO_API_ti43x =3D "cryptodev-module-dev"
> -CRYPTO_API_dra7xx-evm =3D "cryptodev-module-dev"
> +CRYPTO_API_dra7xx =3D "cryptodev-module-dev"
>=20
>  RDEPENDS_${PN} =3D "\
>      openssl-dev \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-crypto.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-crypto.bb
> index e6b6ec4..53a914b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-crypto.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-crypto.bb
> @@ -17,7 +17,7 @@ CRYPTO_SUPPORT =3D "\
>=20
>  CRYPTO_SUPPORT_append_ti33x =3D " ti-crypto-examples cryptodev-module
> cryptodev-tests"
>  CRYPTO_SUPPORT_append_ti43x =3D " ti-crypto-examples cryptodev-module
> cryptodev-tests"
> -CRYPTO_SUPPORT_append_dra7xx-evm =3D " ti-crypto-examples cryptodev-
> module cryptodev-tests"
> +CRYPTO_SUPPORT_append_dra7xx =3D " ti-crypto-examples cryptodev-module
> cryptodev-tests"
>=20
>  # Add crypto hardware support for am37x-evm  # NOTE: this package
> depends on a kernel patch which also has a TSU diff --git a/meta-arago-
> distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
> multimedia.bb
> index ab88609..b044f58 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-multimedia.bb
> @@ -39,10 +39,16 @@ MULTIMEDIA_append_am3517-evm =3D " \  "
>=20
>  ACCEL_FW =3D ""
> -ACCEL_FW_append_omap-a15 =3D " \
> +ACCEL_FW_append_am57xx-evm =3D " \
>      ipumm-fw \
>      "
> +
> +ACCEL_FW_append_omap5-evm =3D " \
> +    ipumm-fw \
> +    "
> +
>  ACCEL_FW_append_dra7xx-evm =3D " \
> +    ipumm-fw \
>      dspdce-fw \
>      vis \
>      "
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
> makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-ti=
sdk-
> makefile_1.0.bb
> index ab4244c..749fb72 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil
> +++ e_1.0.bb
> @@ -80,7 +80,7 @@ MAKEFILES_append_ti43x =3D " u-boot-spl \
>                             cryptodev \
>  "
>=20
> -MAKEFILES_append_dra7xx-evm =3D " cryptodev"
> +MAKEFILES_append_dra7xx =3D " cryptodev"
>=20
>  MAKEFILES_append_omap-a15 =3D " u-boot-spl \
>                                ${QUICK_PLAYGROUND} \ @@ -101,7 +101,7 @@
> KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb am335x-
> bone.dtb am335  KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-
> gp-evm.dtb"
>  KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
> boneblack.dtb"
>  KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
> -KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
> +KERNEL_DEVICETREE_dra7xx =3D "dra7-evm.dtb"
>=20
>  # This step will stitch together the final Makefile based on the support=
ed  #
> make targets.
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-
> demos_2.0.bb
> index 698749c..92fc916 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.b=
b
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.
> +++ bb
> @@ -11,7 +11,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  S =3D "${WORKDIR}/git/cryptos_apps_scripts"
>  S_ti33x =3D "${WORKDIR}/git/cryptos_apps_program"
>  S_ti43x =3D "${WORKDIR}/git/cryptos_apps_program"
> -S_dra7xx-evm =3D "${WORKDIR}/git/cryptos_apps_program"
> +S_dra7xx =3D "${WORKDIR}/git/cryptos_apps_program"
>=20
>  SRC_URI +=3D "file://0001-openssl_perf.sh-remove-module-
> manipulation.patch;striplevel=3D2"
>=20
> @@ -22,4 +22,4 @@ RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-
> submenus-cryptos openssl"
>=20
>  RDEPENDS_${PN}_append_ti33x =3D " ti-crypto-examples"
>  RDEPENDS_${PN}_append_ti43x =3D " ti-crypto-examples"
> -RDEPENDS_${PN}_append_dra7xx-evm =3D " ti-crypto-examples"
> +RDEPENDS_${PN}_append_dra7xx =3D " ti-crypto-examples"
> diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av=
-
> files_1.1.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-
> av-files_1.1.bb
> index 553ead5..e23fdf3 100644
> --- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-
> files_1.1.bb
> +++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files
> +++ _1.1.bb
> @@ -14,7 +14,7 @@ VIDEO_FILES_append_beagleboard =3D "video_vga"
>  VIDEO_FILES_append_am3517-evm  =3D "video_wqvga"
>  VIDEO_FILES_append_am335x-evm  =3D "video_wvga \
>  				                  video_wqvga"
> -VIDEO_FILES_append_dra7xx-evm  =3D "video_wvga"
> +VIDEO_FILES_append_dra7xx  =3D "video_wvga"
>=20
>  SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/564/5179/amsdk=
-
> av-files_${PV}.tar.gz;name=3Davfilestarball"
>=20
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

