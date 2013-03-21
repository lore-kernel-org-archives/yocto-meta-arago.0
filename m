Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 368AC5203A
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 11:56:09 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LBu8Gg005616
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:56:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LBu8Ge004870
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 06:56:08 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 06:56:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 03/17] ti-compat-bluetooth: Split recipe
Thread-Index: AQHOJRKEFg24eSUP/UyYiAdLVnLhNpiwCiig
Date: Thu, 21 Mar 2013 11:56:07 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948E949@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 03/17] ti-compat-bluetooth: Split recipe
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
X-List-Received-Date: Thu, 21 Mar 2013 11:56:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:05 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 03/17] ti-compat-bluetooth: Split
> recipe
>=20
> * Generate a common .inc file to allow support for multiple
> versions of the
>   ti-compat-bluetooth recipe.
> * Change the recipe name to reflect the specific TI compat-
> bluetooth release
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-compat-bluetooth/ti-compat-bluetooth.inc    |   31
> ++++++++++++++++
>  .../ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb |   39 ------
> --------------
>  .../ti-compat-bluetooth_r5.sp3.05.bb               |    8 ++++
>  3 files changed, 39 insertions(+), 39 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth.inc
>  delete mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth_1.0.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth_r5.sp3.05.bb
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth.inc b/meta-arago-extras/recipes-
> bsp/ti-compat-bluetooth/ti-compat-bluetooth.inc
> new file mode 100644
> index 0000000..bdffeeb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-
> compat-bluetooth.inc
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "TI compat-bluetooth drivers"
> +HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> +SECTION =3D "kernel/modules"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> +
> +inherit module
> +
> +RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx"
> +
> +PR =3D "${MACHINE_KERNEL_PR}+b"

Just a question about whether you want to use +b or just ${MACHINE_KERNEL_P=
R}b.  For example many of the kernel recipes just append the letter to the =
end of the PR.  Not a huge deal though so you call.

> +
> +SRC_URI =3D "file://0001-compat-bluetooth-2.6-removed-unused-BT-
> modules-from-.patch \
> +            file://0002-Bluetooth-Fix-l2cap-conn-failures-for-
> ssp-devices.patch \
> +            file://0001-compat-bluetooth-fixing-kernel-panic-in-
> l2cap.patch \
> +           "

If you expect the SRC_URI base tarball to change, which is why you don't in=
clude it here but instead in the actual recipe is it a good idea to keep th=
e patch list in the include file as well?  This may not become an issue unt=
il later.

> +
> +S =3D "${WORKDIR}/compat-bluetooth/"
> +
> +EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
> +
> +do_configure() {
> +    cd ${S}
> +    ./scripts/driver-select bt
> +}
> +
> +do_install() {
> +    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}"
> INSTALL_MOD_PATH=3D"${D}" LDFLAGS=3D"" install-modules
> +    find ${D} -name compat.ko | xargs rm
> +}
> +
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth_1.0.bb b/meta-arago-extras/recipes-
> bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
> deleted file mode 100644
> index 9ce50f7..0000000
> --- a/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-
> compat-bluetooth_1.0.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -DESCRIPTION =3D "TI compat-bluetooth drivers"
> -HOMEPAGE =3D "https://gforge.ti.com/gf/project/ecs_nlcp/"
> -SECTION =3D "kernel/modules"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> -
> -inherit module
> -
> -RDEPENDS_${PN} =3D "ti-compat-wireless-wl12xx"
> -
> -PR =3D "${MACHINE_KERNEL_PR}"
> -PR_append =3D "b"
> -
> -COMPAT_BLUETOOTH_VERSION =3D "2012-11-19-r5-sp3"
> -TAG =3D "${@'${COMPAT_BLUETOOTH_VERSION}'.replace('-', '')}"
> -PV =3D "0.${TAG}"
> -
> -SRC_URI =3D
> "https://gforge.ti.com/gf/download/frsrelease/802/5435/ti-compat-
> bluetooth-2012-02-20.tar.gz \
> -           file://0001-compat-bluetooth-2.6-removed-unused-BT-
> modules-from-.patch \
> -           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-
> ssp-devices.patch \
> -           file://0001-compat-bluetooth-fixing-kernel-panic-in-
> l2cap.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "7c231b35a2297391b5192f86ff4f10dd"
> -SRC_URI[sha256sum] =3D
> "d8882da8bb37821bfd0b9334b859f64d0ce82ae5262360367a3f3fdf31c7f350
> "
> -
> -S =3D "${WORKDIR}/compat-bluetooth/"
> -
> -EXTRA_OEMAKE =3D "KLIB_BUILD=3D${STAGING_KERNEL_DIR} KLIB=3D${D}"
> -
> -do_configure() {
> -    cd ${S}
> -    ./scripts/driver-select bt
> -}
> -
> -do_install() {
> -    oe_runmake DEPMOD=3Decho DESTDIR=3D"${D}"
> INSTALL_MOD_PATH=3D"${D}" LDFLAGS=3D"" install-modules
> -    find ${D} -name compat.ko | xargs rm
> -}
> diff --git a/meta-arago-extras/recipes-bsp/ti-compat-
> bluetooth/ti-compat-bluetooth_r5.sp3.05.bb b/meta-arago-
> extras/recipes-bsp/ti-compat-bluetooth/ti-compat-
> bluetooth_r5.sp3.05.bb
> new file mode 100644
> index 0000000..2df61c2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-compat-bluetooth/ti-
> compat-bluetooth_r5.sp3.05.bb
> @@ -0,0 +1,8 @@
> +require ti-compat-bluetooth.inc
> +
> +PR_append =3D "-r0"
> +
> +SRC_URI +=3D
> "https://gforge.ti.com/gf/download/frsrelease/802/5435/ti-compat-
> bluetooth-2012-02-20.tar.gz"
> +
> +SRC_URI[md5sum] =3D "7c231b35a2297391b5192f86ff4f10dd"
> +SRC_URI[sha256sum] =3D
> "d8882da8bb37821bfd0b9334b859f64d0ce82ae5262360367a3f3fdf31c7f350
> "
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

