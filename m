Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1BB545296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:55:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92Ct7Sn001443;
	Wed, 2 Oct 2013 07:55:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92Ct7qb014933;
	Wed, 2 Oct 2013 07:55:07 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:55:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 03/13] icu: overlay the latest version
	from	oe-core/master
Thread-Index: AQHOvnWDEVYUS+8xG0m1njoWI+YeE5nhYDfA
Date: Wed, 2 Oct 2013 12:55:06 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A4F5@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-4-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 02 Oct 2013 12:55:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Can you add a commit message for why this is overlayerd and when it can be =
removed?


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 03/13] icu: overlay the latest
>version from oe-core/master
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       | 29
>++++++++++++
> meta-arago-distro/recipes-support/icu/icu.inc      | 55
>++++++++++++++++++++++
> meta-arago-distro/recipes-support/icu/icu_51.2.bb  | 13 +++++
> 3 files changed, 97 insertions(+)
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-
>51.2/icu-pkgdata-large-cmd.patch
> create mode 100644 meta-arago-distro/recipes-support/icu/icu.inc
> create mode 100644 meta-arago-distro/recipes-
>support/icu/icu_51.2.bb
>
>diff --git a/meta-arago-distro/recipes-support/icu/icu-51.2/icu-
>pkgdata-large-cmd.patch b/meta-arago-distro/recipes-
>support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
>new file mode 100644
>index 0000000..6e40659
>--- /dev/null
>+++ b/meta-arago-distro/recipes-support/icu/icu-51.2/icu-pkgdata-
>large-cmd.patch
>@@ -0,0 +1,29 @@
>+pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
>+
>+Use LARGE_BUFFER_MAX_SIZE for cmd rather than
>SMALL_BUFFER_MAX_SIZE,
>+otherwise there was a Segmentation fault error when the command
>line is
>+long, this should be a misplay since other cmd uses
>+LARGE_BUFFER_MAX_SIZE.
>+
>+Upstream-Status: Pending
>+
>+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>+---
>+ tools/pkgdata/pkgdata.cpp |    2 +-
>+ 1 file changed, 1 insertion(+), 1 deletion(-)
>+
>+diff --git a/tools/pkgdata/pkgdata.cpp
>b/tools/pkgdata/pkgdata.cpp
>+--- a/tools/pkgdata/pkgdata.cpp
>++++ b/tools/pkgdata/pkgdata.cpp
>+@@ -1019,7 +1019,7 @@ normal_symlink_mode:
>+
>+ static int32_t pkg_installLibrary(const char *installDir, const
>char *targetDir, UBool noVersion) {
>+     int32_t result =3D 0;
>+-    char cmd[SMALL_BUFFER_MAX_SIZE];
>++    char cmd[LARGE_BUFFER_MAX_SIZE];
>+
>+     sprintf(cmd, "cd %s && %s %s %s%s%s",
>+             targetDir,
>+--
>+1.7.10.4
>+
>diff --git a/meta-arago-distro/recipes-support/icu/icu.inc b/meta-
>arago-distro/recipes-support/icu/icu.inc
>new file mode 100644
>index 0000000..e3944cd
>--- /dev/null
>+++ b/meta-arago-distro/recipes-support/icu/icu.inc
>@@ -0,0 +1,55 @@
>+SUMMARY =3D "International Component for Unicode libraries"
>+DESCRIPTION =3D "The International Component for Unicode (ICU) is a
>mature, portable set of C/C++ and Java libraries for Unicode
>support, software internationalization (I18N) and globalization
>(G11N), giving applications the same results on all platforms."
>+HOMEPAGE =3D "http://site.icu-project.org/"
>+
>+LICENSE =3D "ICU"
>+DEPENDS =3D "icu-native"
>+DEPENDS_class-native =3D ""
>+
>+S =3D "${WORKDIR}/icu/source"
>+STAGING_ICU_DIR_NATIVE =3D "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
>+
>+PARALLEL_MAKE =3D ""
>+CPPFLAGS_append_libc-uclibc =3D " -DU_TIMEZONE=3D0"
>+
>+inherit autotools pkgconfig binconfig
>+
>+# ICU needs the native build directory as an argument to its --
>with-cross-build option when
>+# cross-compiling. Taken the situation that different builds may
>share a common sstate-cache
>+# into consideration, the native build directory needs to be
>staged.
>+EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_ICU_DIR_NATIVE}"
>+EXTRA_OECONF_class-native =3D ""
>+
>+# ICU puts custom m4 autoconf functions in aclocal.m4.
>+# However, this file is deleted in our build system.
>+# To make it work, we copy aclocal.m4 to acinclude.m4.
>+# This is a bug of ICU. See bug reference:
>+# http://bugs.icu-project.org/trac/ticket/9790
>+do_configure_prepend() {
>+    [ -f ${S}/acinclude.m4 ] || cp ${S}/aclocal.m4
>${S}/acinclude.m4
>+}
>+
>+do_install_append_class-native() {
>+	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
>+	cp -r ${B}/config/icucross.mk
>${D}/${STAGING_ICU_DIR_NATIVE}/config
>+        cp -r ${B}/config/icucross.inc
>${D}/${STAGING_ICU_DIR_NATIVE}/config
>+	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
>+	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
>+	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
>+
>+}
>+
>+PACKAGES =3D+ "libicudata libicuuc libicui18n libicule libiculx
>libicutu libicuio"
>+
>+FILES_${PN}-dev +=3D "${libdir}/${BPN}/"
>+
>+FILES_libicudata =3D "${libdir}/libicudata.so.*"
>+FILES_libicuuc =3D "${libdir}/libicuuc.so.*"
>+FILES_libicui18n =3D "${libdir}/libicui18n.so.*"
>+FILES_libicule =3D "${libdir}/libicule.so.*"
>+FILES_libiculx =3D "${libdir}/libiculx.so.*"
>+FILES_libicutu =3D "${libdir}/libicutu.so.*"
>+FILES_libicuio =3D "${libdir}/libicuio.so.*"
>+
>+BBCLASSEXTEND =3D "native"
>+
>diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>new file mode 100644
>index 0000000..1278d22
>--- /dev/null
>+++ b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>@@ -0,0 +1,13 @@
>+require icu.inc
>+
>+LIC_FILES_CHKSUM =3D
>"file://../license.html;md5=3D443a74288a72fad9069a74e7637192c1"
>+
>+PR =3D "r0"
>+
>+BASE_SRC_URI =3D "http://download.icu-
>project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
>+SRC_URI =3D "${BASE_SRC_URI} \
>+           file://icu-pkgdata-large-cmd.patch \
>+          "
>+
>+SRC_URI[md5sum] =3D "072e501b87065f3a0ca888f1b5165709"
>+SRC_URI[sha256sum] =3D
>"deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

