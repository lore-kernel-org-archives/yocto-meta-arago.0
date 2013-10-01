Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 29A8E52099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:10:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DAptZ023341;
	Tue, 1 Oct 2013 08:10:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DAprM016710;
	Tue, 1 Oct 2013 08:10:51 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:10:51 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 03/13] icu: overlay the latest version
	from	oe-core/master
Thread-Index: AQHOvnWDXs9I3dvwNkS0hQ90PszZypnf0mID
Date: Tue, 1 Oct 2013 13:10:50 +0000
Message-ID: <87A299FA-D38A-4E32-ABC3-5A9B01F99427@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-4-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 03/13] icu: overlay the latest version from	oe-core/master
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
X-List-Received-Date: Tue, 01 Oct 2013 13:10:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       | 29 ++++++++++++
> meta-arago-distro/recipes-support/icu/icu.inc      | 55 +++++++++++++++++=
+++++
> meta-arago-distro/recipes-support/icu/icu_51.2.bb  | 13 +++++
> 3 files changed, 97 insertions(+)
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkg=
data-large-cmd.patch
> create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
> create mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bb
>=20
> diff --git a/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-l=
arge-cmd.patch b/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata=
-large-cmd.patch
> new file mode 100644
> index 0000000..6e40659
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-large-cm=
d.patch
> @@ -0,0 +1,29 @@
> +pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
> +
> +Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE,
> +otherwise there was a Segmentation fault error when the command line is
> +long, this should be a misplay since other cmd uses
> +LARGE_BUFFER_MAX_SIZE.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + tools/pkgdata/pkgdata.cpp |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
> +--- a/tools/pkgdata/pkgdata.cpp
> ++++ b/tools/pkgdata/pkgdata.cpp
> +@@ -1019,7 +1019,7 @@ normal_symlink_mode:
> +=20
> + static int32_t pkg_installLibrary(const char *installDir, const char *t=
argetDir, UBool noVersion) {
> +     int32_t result =3D 0;
> +-    char cmd[SMALL_BUFFER_MAX_SIZE];
> ++    char cmd[LARGE_BUFFER_MAX_SIZE];
> +=20
> +     sprintf(cmd, "cd %s && %s %s %s%s%s",
> +             targetDir,
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-arago-distro/recipes-support/icu/icu.inc b/meta-arago-d=
istro/recipes-support/icu/icu.inc
> new file mode 100644
> index 0000000..e3944cd
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu.inc
> @@ -0,0 +1,55 @@
> +SUMMARY =3D "International Component for Unicode libraries"
> +DESCRIPTION =3D "The International Component for Unicode (ICU) is a matu=
re, portable set of C/C++ and Java libraries for Unicode support, software =
internationalization (I18N) and globalization (G11N), giving applications t=
he same results on all platforms."
> +HOMEPAGE =3D "http://site.icu-project.org/"
> +
> +LICENSE =3D "ICU"
> +DEPENDS =3D "icu-native"
> +DEPENDS_class-native =3D ""
> +
> +S =3D "${WORKDIR}/icu/source"
> +STAGING_ICU_DIR_NATIVE =3D "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> +
> +PARALLEL_MAKE =3D ""
> +CPPFLAGS_append_libc-uclibc =3D " -DU_TIMEZONE=3D0"
> +
> +inherit autotools pkgconfig binconfig
> +
> +# ICU needs the native build directory as an argument to its --with-cros=
s-build option when
> +# cross-compiling. Taken the situation that different builds may share a=
 common sstate-cache
> +# into consideration, the native build directory needs to be staged.
> +EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_ICU_DIR_NATIVE}"
> +EXTRA_OECONF_class-native =3D ""
> +
> +# ICU puts custom m4 autoconf functions in aclocal.m4.
> +# However, this file is deleted in our build system.=20
> +# To make it work, we copy aclocal.m4 to acinclude.m4.
> +# This is a bug of ICU. See bug reference:
> +# http://bugs.icu-project.org/trac/ticket/9790
> +do_configure_prepend() {
> +    [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4 ${S}/acinclude.m4
> +}
> +
> +do_install_append_class-native() {
> +    mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +    cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +        cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/co=
nfig
> +    cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> +    cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> +    cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> +
> +}
> +
> +PACKAGES =3D+ "libicudata libicuuc libicui18n libicule libiculx libicutu=
 libicuio"
> +
> +FILES_${PN}-dev +=3D "${libdir}/${BPN}/"
> +
> +FILES_libicudata =3D "${libdir}/libicudata.so.*"
> +FILES_libicuuc =3D "${libdir}/libicuuc.so.*"
> +FILES_libicui18n =3D "${libdir}/libicui18n.so.*"
> +FILES_libicule =3D "${libdir}/libicule.so.*"
> +FILES_libiculx =3D "${libdir}/libiculx.so.*"
> +FILES_libicutu =3D "${libdir}/libicutu.so.*"
> +FILES_libicuio =3D "${libdir}/libicuio.so.*"
> +
> +BBCLASSEXTEND =3D "native"
> +
> diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bb b/meta-ara=
go-distro/recipes-support/icu/icu_51.2.bb
> new file mode 100644
> index 0000000..1278d22
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
> @@ -0,0 +1,13 @@
> +require icu.inc
> +
> +LIC_FILES_CHKSUM =3D "file://../license.html;md5=3D443a74288a72fad9069a7=
4e7637192c1"
> +
> +PR =3D "r0"
> +
> +BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/${PV}/icu4=
c-51_2-src.tgz"
> +SRC_URI =3D "${BASE_SRC_URI} \
> +           file://icu-pkgdata-large-cmd.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "072e501b87065f3a0ca888f1b5165709"
> +SRC_URI[sha256sum] =3D "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94e=
ffa67fdc7bd704cc"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

