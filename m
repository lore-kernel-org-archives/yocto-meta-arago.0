Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id EC2B4529DA
	for <meta-arago@arago-project.org>;
	Fri, 27 Sep 2013 15:32:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8RFWF5F014047;
	Fri, 27 Sep 2013 10:32:15 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8RFWFJ9024492;
	Fri, 27 Sep 2013 10:32:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 27 Sep 2013 10:32:15 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] external-linaro-toolchain: add a way to
	use specific linux-libc-headers provider and version
Thread-Index: AQHOu0fEux3H3YtgZkqHBw0hB9t+VZnZsQLg
Date: Fri, 27 Sep 2013 15:32:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C561EE3@DFLE08.ent.ti.com>
References: <1380261968-27765-1-git-send-email-denis@denix.org>
In-Reply-To: <1380261968-27765-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] external-linaro-toolchain: add a way to use specific linux-libc-headers provider and version
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
X-List-Received-Date: Fri, 27 Sep 2013 15:32:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

To change the version of linux-libc-headers used is it enough to just set t=
he PREFERRED_PROVIDERS or should the following variables also need to be up=
dated?

SDKLINUXLIBCVERSION ?=3D "3.8%"
LINUXLIBCVERSION ?=3D "3.8%"

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, September 27, 2013 1:06 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] external-linaro-toolchain: add a way to use
> specific linux-libc-headers provider and version
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Use it by default in our distro - the preferred version may need to be ad=
justed
> based on the kernel version used by individual platforms.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/toolchain-linaro.inc  |  7 +++++++
>  .../recipes-core/meta/external-linaro-toolchain.bbappend    | 13
> ++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b=
/meta-
> arago-distro/conf/distro/include/toolchain-linaro.inc
> index 1ab13ee..cc12f08 100644
> --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> @@ -15,6 +15,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-
> intermediate =3D "external-linaro-t  TOOLCHAIN_SYS :=3D "${ELT_TARGET_SYS=
}"
>  TOOLCHAIN_PREFIX :=3D "${TOOLCHAIN_SYS}-"
>=20
> +# Use specific libc headers instead of ones provided by toolchain
> +PREFERRED_PROVIDER_linux-libc-headers_forcevariable =3D "linux-libc-
> headers"
> +PREFERRED_PROVIDER_linux-libc-headers-dev_forcevariable =3D "linux-libc-
> headers"
> +PREFERRED_PROVIDER_virtual/linux-libc-headers_forcevariable =3D "linux-l=
ibc-
> headers"
> +
>  PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D
> "external-linaro-sdk-toolchain"
>  PREFERRED_PROVIDER_binutils-cross-canadian-
> ${TRANSLATED_TARGET_ARCH} ?=3D "external-linaro-sdk-toolchain"
>  #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}
> =3D "external-linaro-sdk-toolchain"
> @@ -27,6 +32,7 @@ SDKGCCVERSION ?=3D "4.7%"
>  SDKBINUVERSION ?=3D "2.23%"
>  SDKEGLIBCVERSION ?=3D "2.17%"
>  SDKLINUXLIBCVERSION ?=3D "3.8%"
> +LINUXLIBCVERSION ?=3D "3.8%"
>=20
>  PREFERRED_VERSION_gcc-crosssdk ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_gcc-crosssdk-initial ?=3D "${SDKGCCVERSION}"
> @@ -34,6 +40,7 @@ PREFERRED_VERSION_gcc-crosssdk-intermediate ?=3D
> "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-gcc-runtime ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_binutils-crosssdk ?=3D "${SDKBINUVERSION}"
> +PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D
> "${SDKLINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-eglibc ?=3D "${SDKEGLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-eglibc-initial ?=3D "${SDKEGLIBCVERSION}"
> diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-
> toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-
> toolchain.bbappend
> index 09f68d8..f8ad2cc 100644
> --- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbapp=
end
> +++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbap
> +++ pend
> @@ -2,12 +2,20 @@ INSANE_SKIP_libstdc++-dev +=3D "staticdev"
>=20
>  ALLOW_EMPTY_${PN}-utils =3D "1"
>=20
> -PR_append =3D "-arago3"
> +PR_append =3D "-arago4"
>=20
> +PROVIDES :=3D "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDE=
S}',
> d)}"
> +PROVIDES :=3D "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}=
"
>  PROVIDES +=3D "virtual/${TARGET_PREFIX}gcc-intermediate"
> +PROVIDES +=3D "${@base_conditional('PREFERRED_PROVIDER_linux-libc-
> headers', 'external-linaro-toolchain', 'linux-libc-headers linux-libc-hea=
ders-dev',
> '', d)}"
>=20
> +PACKAGES :=3D "${@oe_filter_out('linux-libc-headers', '${PACKAGES}', d)}=
"
> +PACKAGES :=3D "${@oe_filter_out('linux-libc-headers-dev', '${PACKAGES}',=
 d)}"
>  PACKAGES :=3D "${@oe_filter_out('libsegfault', '${PACKAGES}', d)}"
>  PACKAGES =3D+ "libsegfault"
> +PACKAGES +=3D "${@base_conditional('PREFERRED_PROVIDER_linux-libc-
> headers', 'external-linaro-toolchain', 'linux-libc-headers-dev', '', d)}"
> +
> +DEPENDS +=3D "${@base_conditional('PREFERRED_PROVIDER_linux-libc-
> headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
>=20
>  RDEPENDS_${PN}-utils =3D ""
>=20
> @@ -90,6 +98,9 @@ do_install_append() {
>  	install -d ${D}/include
>  	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
>=20
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf
> ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf
> ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf
> ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
> +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> +'external-linaro-toolchain', '', 'rm -rf
> +${D}${includedir}/scsi/.install; rm -rf
> +${D}${includedir}/scsi/scsi_netlink*; rm -rf
> +${D}${includedir}/scsi/scsi_bsg*', d)}
> +
>  	rm -rf ${D}/lib/libgfortran*
>  	rm -rf ${D}/lib/ldscripts
>  	rm -rf ${D}${datadir}/lintian
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

