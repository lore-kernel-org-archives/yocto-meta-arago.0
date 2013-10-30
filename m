Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E6608529B0
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2013 19:24:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9UJOnDb005065
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 14:24:49 -0500
Received: from DFLE73.ent.ti.com ([128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9UJOnM8002523
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 14:24:49 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 30 Oct 2013 14:24:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem
Thread-Index: AQHO1aNfgeKDzB2/N0qxsu+VRYhkxZoNnhcQ
Date: Wed, 30 Oct 2013 19:24:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C58C398@DFLE08.ent.ti.com>
References: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] ti-cmem: New recipes for ti-cmem
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
X-List-Received-Date: Wed, 30 Oct 2013 19:24:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Wednesday, October 30, 2013 2:08 PM
> To: meta-arago@arago-project.org; Nelson, Sam
> Subject: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem
>=20
> - Recipes for ti-cmem which provides user space api for contigous memory
> allocaion
> - ti-cmem_mod provides the kernel module
> - ti-mem provides the user space library
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-bsp/ti-cmem/ti-cmem-mod.bb             |   40
> ++++++++++++++++++++
>  meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb   |   20 ++++++++++
>  meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc  |   10 +++++
>  3 files changed, 70 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
[Franklin] Your recipes are missing the software/library version number.
Ex ti-cmem-mod_1.0.bb or ti-cmem-mod_git.bb (you would still have to set th=
e PV for a specific version)
>=20
> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb b/meta-
> arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> new file mode 100755
> index 0000000..0839c20
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION=3D"The cmem component module for contiguous memory
> allocation from userspace "
> +
> +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> +
> +LICENSE =3D "GPLv2"
[Franklin] ^ I would leave it up to you but you probably could put the HOME=
PAGE and LICENSE in the include file and don't bother having to set it agai=
n in the two recipes.
> +
> +include ti-cmem.inc
> +
> +RDEPENDS_${PN} +=3D "kernel (=3D${KERNEL_VERSION})"
[Franklin] I'm not sure if this is possible. I vaguely remember trying to d=
o something like this before and found out it was impossible to try to RDEP=
ENDS on a specific version of a recipe. You probably would just need to mak=
e sure PREFERRED_VERSION is set.
> +
> +DEPENDS +=3D "virtual/kernel"
[Franklin] inherit module already sets this for you. No need to set it agai=
n
> +
> +NAME=3D"cmem"
> +MODULE_BUILD_DIR =3D"src/cmem/module"
[Franklin] I might be missing something but what are the above variables be=
ing used for? I don't see it being referenced.
> +
> +# This package builds a kernel module, use kernel PR as base and append
> +a local PR =3D "${MACHINE_KERNEL_PR}"
> +PR_append =3D "a"
> +
> +PKG_${PN} =3D "kernel-module-${PN}"
> +
> +KERNEL_VERSION =3D "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-
> abiversion')}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit module
> +
> +do_compile () {
> +    cd ${S}
> +    make -f lu.mak module_clean
> +    make -f lu.mak module KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> +TOOLCHAIN_PREFIX=3D${CROSS_COMPILE} }
> +
> +do_install () {
> +    cd ${S}
> +    make -f lu.mak module_install
> KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
> EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
> INSTALL_MOD_PATH=3D"${D}"
> +}
> +
> +PACKAGE_STRIP =3D "no"
> +
> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb b/meta-arag=
o-
> extras/recipes-bsp/ti-cmem/ti-cmem.bb
> new file mode 100644
> index 0000000..a106aa0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION=3D"The cmem component supports contiguous memory allocation
> from userspace "
> +
> +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> +
> +LICENSE =3D "GPLv2"
> +
> +include ti-cmem.inc
> +
> +DEPENDS =3D "ti-cmem-mod"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PR =3D "r1"
[Franklin] New recipes should start are 0
> +
> +PACKAGES =3D+ "${PN}-test"
> +
> +FILES_${PN}-test =3D "${bindir}/*"
> +
> +inherit autotools
> +
> diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc b/meta-ara=
go-
> extras/recipes-bsp/ti-cmem/ti-cmem.inc
> new file mode 100644
> index 0000000..9308b2d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> @@ -0,0 +1,10 @@
> +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> +
> +LIC_FILES_CHKSUM =3D
> "file://products.mak;beginline=3D2;endline=3D30;md5=3D195feadf798bb4165bc=
b1a2
> 3ffd50dbb"
> +
> +COMPATIBLE_MACHINE =3D "keystone-evm"
> +
> +BRANCH ?=3D "master"
> +SRCREV =3D "4.00.00.06"
> +
> +SRC_URI =3D "git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BR=
ANCH}"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

