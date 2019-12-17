Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5940352993
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 15:48:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHFkvjI057418
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 09:46:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576597617;
	bh=OY39fXchszKBOCZ+UKPlfmeZyQ/2mpEAVSIbm5aBF0M=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gYW/mITnc7+lOTknGsoytF1PrfRnhDJYL8FBHc5gAyaFyy7AZm3qbco/u779ibK5r
	oNzbx4B/EpDRx/CfniV6Nc0z03UrZVysq8EHff/6zKDmMFpCDN02ePTs1l0HgqH/tp
	HUOYAOg+yQ9xOtBvd+VN6jQQ/VFg5Br6NhpI0R1M=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHFkvOq025198
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 09:46:57 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 09:46:57 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 09:46:57 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master/thud/ti2019.05][PATCH v3] openmpacc: update
	version to 01.05.06.00
Thread-Index: AQHVtOiC/wAjl3Y7BUisPJHwiNMn7ae+eLAA
Date: Tue, 17 Dec 2019 15:46:57 +0000
Message-ID: <0f5d473bc7f54045a25b6297bb6c379e@ti.com>
References: <20191217144411.19000-1-yuanzhao@ti.com>
In-Reply-To: <20191217144411.19000-1-yuanzhao@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [master/thud/ti2019.05][PATCH v3] openmpacc: update	version to 01.05.06.00
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
X-List-Received-Date: Tue, 17 Dec 2019 15:48:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What are the changes? Please don't forget to summarize the changes between =
patch revisions. Thanks.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Zhao (Compiler), Yuan
> Sent: Tuesday, December 17, 2019 9:44 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [master/thud/ti2019.05][PATCH v3] openmpacc: update
> version to 01.05.06.00
>=20
> - Changes for openmpacc examples: Removed vecadd_lib, edmabw
> - Changes for clacc host_cc and host_link_cc parameters: Determine target
>   compiler name directly from CMake
> - Documentation update regarding no support for variadic functions in
>   target regions
>=20
> Signed-off-by: Gaurav Mitra <gaurav@ti.com>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  .../recipes-ti/openmpacc/clacc_git.bb              | 34 ++++++++++++++++=
++----
>  .../recipes-ti/openmpacc/openmpacc-examples_git.bb |  8 +----
>  .../recipes-ti/openmpacc/openmpacc.inc             |  4 +--
>  .../recipes-ti/openmpacc/openmpacc_git.bb          |  4 ---
>  4 files changed, 31 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-
> arago-extras/recipes-ti/openmpacc/clacc_git.bb
> index 75ce4628..cecffa02 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "TI OpenMP-Acc C compiler"
>=20
>  include openmpacc.inc
>=20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.0"
>=20
>  DEPENDS =3D "boost elfutils"
>  RDEPENDS_${PN} +=3D "clocl"
> @@ -18,16 +18,38 @@ export X86_HOST_ROOT =3D "${STAGING_DIR_HOST}"
>=20
>  PARALLEL_MAKE =3D ""
>=20
> +# The variables CLACC_CC and CLACC_CXX are used to point clacc to set it=
s
> +# host_cc and host_link_cc variables which were previously hardcoded in
> clacc.h.
> +# This adds support for different toolchain configurations to build clac=
c by
> +# passing in the compiler names at the build stage and removes correspon=
ding
> +# string replacement requirements in yocto recipes.
> +python __anonymous() {
> +    cc_name =3D ""
> +    cxx_name =3D ""
> +    if d.getVar("TOOLCHAIN_PREFIX"):
> +        cc_name =3D d.getVar("TOOLCHAIN_PREFIX") + "gcc"
> +        cxx_name =3D d.getVar("TOOLCHAIN_PREFIX") + "g++"
> +    else:
> +        cc_name =3D d.getVar("TARGET_PREFIX") + "gcc"
> +        cxx_name =3D d.getVar("TARGET_PREFIX") + "g++"
> +
> +    # Convert to upper case to workaround GCC preprocessor bug where the
> word
> +    # 'linux' is defined to be 1. This results in arm-linux-gnueabihf- b=
eing
> +    # stringized to arm-1-gnueabihf- by the GCC preprocessor. To workaro=
und
> this
> +    # bug, convert the names to upper case and send through. Clacc will =
convert
> +    # to lower case before usage.
> +    d.setVar("CLACC_CC_NAME", cc_name.upper())
> +    d.setVar("CLACC_CXX_NAME", cxx_name.upper())
> +}
> +
> +
>  EXTRA_OEMAKE =3D " -C ${S}/clacc \
>                    ${TARGET} \
>                    CXX=3D"${CXX}" \
> +                  CLACC_CC=3D"${CLACC_CC_NAME}" \
> +                  CLACC_CXX=3D"${CLACC_CXX_NAME}" \
>  "
>=20
> -do_configure() {
> -    sed "s|arm-linux-gnueabihf-gcc|${TOOLCHAIN_PREFIX}gcc|g" -i
> clacc/clacc.h
> -    sed "s|arm-linux-gnueabihf-g++|${TOOLCHAIN_PREFIX}g++|g" -i
> clacc/clacc.h
> -}
> -
>  do_compile() {
>      oe_runmake
>  }
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-
> examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-
> examples_git.bb
> index b2f4122c..39902f8f 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
> @@ -21,8 +21,6 @@ OMPACC_EXAMPLE_LIST =3D " target_update \
>                          local \
>                          null \
>                          dsplib_fft \
> -                        vecadd_lib \
> -                        edmabw \
>                          sub_section \
>  "
>=20
> @@ -35,7 +33,6 @@ python do_unpack_append() {
>      os.makedirs(s)
>      shutil.copy(os.path.join(git_dir,"Makefile"),s)
>      shutil.copy(os.path.join(git_dir,"make.inc"),s)
> -    shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)
>      for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
>          shutil.copytree(os.path.join(git_dir,example), os.path.join(s,ex=
ample))
>  }
> @@ -47,11 +44,9 @@ EXTRA_OEMAKE =3D "
> TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \
>  MKFILELIST =3D "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makef=
ile \
>  null/Makefile dspheap/Makefile target_implicit_map/Makefile
> printf_debug/Makefile \
>  edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile
> target_update/Makefile \
> -edmabw/Makefile sub_section/Makefile vecadd_lib/Makefile local/Makefile"
> +sub_section/Makefile local/Makefile"
>=20
>  do_configure() {
> -    sed "s|arm-linux-gnueabihf-gcc|${CC}|g" -i make.inc
> -    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc
>      for f in ${MKFILELIST}; do
>          sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g"
> -i $f
>      done
> @@ -66,7 +61,6 @@ do_install() {
>=20
>      install -m 644 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc
>      install -m 644 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc
> -    install -m 644 ${B}/ompacc_env.sh ${D}${datadir}/ti/examples/openmpa=
cc
>=20
>      for ompacc_example in ${OMPACC_EXAMPLE_LIST}; do
>          install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example=
}
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-
> arago-extras/recipes-ti/openmpacc/openmpacc.inc
> index ce0236d4..d33a156b 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "TI OpenMP Accelerator Model"
>  HOMEPAGE =3D "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
>  LICENSE =3D "BSD"
>=20
> -PV =3D "1.5.4.0"
> +PV =3D "1.5.6.0"
>  INC_PR =3D "r0"
>=20
>  LIC_FILES_CHKSUM =3D
> "file://../debian/copyright;md5=3Daaa2a0939d08197132fc382e97b62eb0"
> @@ -13,7 +13,7 @@ OMPACC_GIT_URI =3D "git://git.ti.com/openmp/ti-
> openmpacc.git"
>  OMPACC_GIT_PROTOCOL =3D "git"
>  OMPACC_GIT_BRANCH =3D "master"
>=20
> -OMPACC_SRCREV =3D "808cef58b4ed196a9ced2310d419dbaf63dfbeb6"
> +OMPACC_SRCREV =3D "7c4e68a0bf73ec193edff9dfc23ea764ae6ad434"
>=20
>  BRANCH =3D "${OMPACC_GIT_BRANCH}"
>  SRC_URI =3D
> "${OMPACC_GIT_URI};protocol=3D${OMPACC_GIT_PROTOCOL};branch=3D${BRANC
> H}"
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> index a28a9225..44b59a4f 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> @@ -18,7 +18,3 @@ export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_HOST}"
>  EXTRA_OECMAKE +=3D "-DVERSION=3D"${PV}" -DBUILD_OUTPUT=3Dlib"
>=20
>  FILES_${PN} +=3D "/usr/share/ti/openmpacc/*"
> -
> -do_configure_prepend() {
> -	sed -i -e 's/-march=3Darmv7-a//' ${S}/libompacc/CMakeLists.txt
> -}
> --
> 2.14.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

