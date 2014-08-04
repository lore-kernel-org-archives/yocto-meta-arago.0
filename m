Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3A37A52972
	for <meta-arago@arago-project.org>;
	Mon,  4 Aug 2014 19:39:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74JdCqQ009415;
	Mon, 4 Aug 2014 14:39:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74JdCd5021810;
	Mon, 4 Aug 2014 14:39:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 4 Aug 2014 14:39:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] openssl: update bbappend to new version,
	simplify
Thread-Index: AQHPsBfWc3+7/PIy8kOtW8YSzQgufpvA10SA
Date: Mon, 4 Aug 2014 19:39:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D19B375@DLEE11.ent.ti.com>
References: <1407179452-29459-1-git-send-email-denis@denix.org>
In-Reply-To: <1407179452-29459-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] openssl: update bbappend to new version, simplify
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
X-List-Received-Date: Mon, 04 Aug 2014 19:39:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, August 04, 2014 2:11 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] openssl: update bbappend to new
>version, simplify
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Most of the customizations were incorporated upstream.
>OCF support in openssl was also removed.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../openssl/openssl_1.0.1e.bbappend                | 127 --------
>-------------
> .../openssl/openssl_1.0.1g.bbappend                |  26 +++++
> 2 files changed, 26 insertions(+), 127 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-
>connectivity/openssl/openssl_1.0.1e.bbappend
> create mode 100644 meta-arago-distro/recipes-
>connectivity/openssl/openssl_1.0.1g.bbappend
>
>diff --git a/meta-arago-distro/recipes-
>connectivity/openssl/openssl_1.0.1e.bbappend b/meta-arago-
>distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
>deleted file mode 100644
>index 86c72fe..0000000
>--- a/meta-arago-distro/recipes-
>connectivity/openssl/openssl_1.0.1e.bbappend
>+++ /dev/null
>@@ -1,127 +0,0 @@
>-
>##################################################################
>##############
>-######################### TSU EXEMPTION REQUIRED
>###############################
>-
>##################################################################
>##############
>-# Versions of openssl that are TSU Exempted:
>-# openssl-1.0.0a
>-# openssl-1.0.0d
>-#
>-# This package requires TSU exemption. Any update to the version
>of openssl being
>-# appended must be double checked to see if a new TSU exemption
>must be made.
>-
>-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>-
>-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>-
>-PR_append =3D "-arago9"
>-
>-DEPENDS_append_ti33x_class-target =3D " cryptodev"
>-DEPENDS_append_ti43x_class-target =3D " cryptodev"
>-DEPENDS_append_dra7xx-evm_class-target =3D " cryptodev"
>-DEPENDS_append_am57xx-evm_class-target =3D " cryptodev"
>-DEPENDS_append_keystone_class-target =3D " cryptodev"
>-
>-python __anonymous () {
>-    crypdep =3D d.getVar("DEPENDS").replace("ocf-linux ", "")
>-    d.setVar("DEPENDS_ti33x_class-target", crypdep)
>-    d.setVar("DEPENDS_ti43x_class-target", crypdep)
>-    d.setVar("DEPENDS_dra7xx-evm_class-target", crypdep)
>-    d.setVar("DEPENDS_am57xx-evm_class-target", crypdep)
>-    d.setVar("DEPENDS_keystone_class-target", crypdep)
>-}
>-
>-CRYPTODEV_AFALG_PATCHES =3D " \
>-	file://0001-Add-AF_ALG-interface-support-to-OpenSSL.patch \
>-	file://0004-Sample-AF_ALG-openssl.cnf.patch \
>-	file://0001-eng_cryptodev.c-update-to-cryptodev-1.6.patch \
>-	file://0009-eng_cryptodev-Add-SHA224-initialization-to-
>cryptodev.patch \
>-	file://0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-
>bit-.patch \
>-"
>-
>-SRC_URI_append_ti33x_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
>-SRC_URI_append_ti43x_class-target =3D "${CRYPTODEV_AFALG_PATCHES}"
>-SRC_URI_append_dra7xx-evm_class-target =3D
>"${CRYPTODEV_AFALG_PATCHES}"
>-SRC_URI_append_am57xx-evm_class-target =3D
>"${CRYPTODEV_AFALG_PATCHES}"
>-SRC_URI_append_keystone_class-target =3D
>"${CRYPTODEV_AFALG_PATCHES}"
>-
>-# Override do_configure to replace target with linux-armv4 to
>enable ASM code
>-# optimization for ARM arch (including armv7) for extra
>performance
>-do_configure () {
>-	cd util
>-	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
>-	cd ..
>-	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
>-
>-	os=3D${HOST_OS}
>-	if [ "x$os" =3D "xlinux-uclibc" ]; then
>-		os=3Dlinux
>-	elif [ "x$os" =3D "xlinux-uclibceabi" ]; then
>-		os=3Dlinux
>-	elif [ "x$os" =3D "xlinux-gnueabi" ]; then
>-		os=3Dlinux
>-	fi
>-	target=3D"$os-${HOST_ARCH}"
>-	case $target in
>-	linux-arm)
>-		# target=3Dlinux-elf-arm
>-		target=3Dlinux-armv4
>-		;;
>-	linux-armeb)
>-		target=3Dlinux-elf-armeb
>-		;;
>-	linux-sh3)
>-		target=3Ddebian-sh3
>-		;;
>-	linux-sh4)
>-		target=3Ddebian-sh4
>-		;;
>-	linux-i486)
>-		target=3Ddebian-i386-i486
>-		;;
>-	linux-i586 | linux-viac3)
>-		target=3Ddebian-i386-i586
>-		;;
>-	linux-i686)
>-		target=3Ddebian-i386-i686/cmov
>-		;;
>-	linux-gnux32-x86_64)
>-		target=3Dlinux-x32
>-		;;
>-	linux-gnu64-x86_64)
>-		target=3Dlinux-x86_64
>-		;;
>-	linux-mips)
>-		target=3Ddebian-mips
>-		;;
>-	linux-mipsel)
>-		target=3Ddebian-mipsel
>-		;;
>-	linux-*-mips64)
>-		target=3Dlinux-mips
>-		;;
>-	linux-powerpc)
>-		target=3Dlinux-ppc
>-		;;
>-	linux-gnuspe-powerpc)
>-		target=3Dlinux-ppc
>-		;;
>-	linux-powerpc64)
>-		target=3Dlinux-ppc64
>-		;;
>-	linux-supersparc)
>-		target=3Dlinux-sparcv8
>-		;;
>-	linux-sparc)
>-		target=3Dlinux-sparcv8
>-		;;
>-	darwin-i386)
>-		target=3Ddarwin-i386-cc
>-		;;
>-	esac
>-	# inject machine-specific flags
>-	sed -i -e
>"s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g"
>Configure
>-	useprefix=3D${prefix}
>-	if [ "x$useprefix" =3D "x" ]; then
>-		useprefix=3D/
>-	fi
>-	perl ./Configure ${EXTRA_OECONF} shared --prefix=3D$useprefix
>--openssldir=3D${libdir}/ssl --libdir=3D`basename ${libdir}` $target
>-}
>diff --git a/meta-arago-distro/recipes-
>connectivity/openssl/openssl_1.0.1g.bbappend b/meta-arago-
>distro/recipes-connectivity/openssl/openssl_1.0.1g.bbappend
>new file mode 100644
>index 0000000..b00ba90
>--- /dev/null
>+++ b/meta-arago-distro/recipes-
>connectivity/openssl/openssl_1.0.1g.bbappend
>@@ -0,0 +1,26 @@
>+#################################################################
>###############
>+######################### TSU EXEMPTION REQUIRED
>###############################
>+#################################################################
>###############
>+# Versions of openssl that are TSU Exempted:
>+# openssl-1.0.0a
>+# openssl-1.0.0d
>+#
>+# This package requires TSU exemption. Any update to the version
>of openssl being
>+# appended must be double checked to see if a new TSU exemption
>must be made.
>+
>+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>+
>+PR_append =3D "-arago0"
>+
>+DEPENDS +=3D "cryptodev-linux"
>+RDEPENDS_${PN}_class-target +=3D "cryptodev-module"
>+
>+CRYPTODEV_AFALG_PATCHES =3D " \
>+	file://0001-Add-AF_ALG-interface-support-to-OpenSSL.patch \
>+	file://0004-Sample-AF_ALG-openssl.cnf.patch \
>+	file://0001-eng_cryptodev.c-update-to-cryptodev-1.6.patch \
>+	file://0009-eng_cryptodev-Add-SHA224-initialization-to-
>cryptodev.patch \
>+	file://0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-
>bit-.patch \
>+"
>+
>+SRC_URI +=3D "${CRYPTODEV_AFALG_PATCHES}"
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

