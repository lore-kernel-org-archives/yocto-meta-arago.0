Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BDC335297E
	for <meta-arago@arago-project.org>;
	Wed, 12 Dec 2018 21:45:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBCLjQHY122209
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 15:45:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544651126;
	bh=9UsfzbpJYSw003Vj8sC0JyazMg2GyQOzLABSZt4tziE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=BgQ5LRJ6ExwVJAm6FPUQNPyWiS3DfxqBbi7QoSnW8jvAo7/LdF6/mNH1mFRhjwgpO
	EUhfOSbv+60w5PZDWqq0cgbtIYa9R7PHJA6AXrKE56T8i9+t35a5NWSy948DraRF/N
	RJIxV2mSU2huIbF9MA3hLjaxfhmCK4Oi4F9eSb3U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBCLjQZn024902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 15:45:26 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 12 Dec 2018 15:45:26 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1591.008; Wed, 12 Dec 2018 15:45:26 -0600
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master][PATCH v2] tidl-utils: add TIDL
	import tool source compilation.
Thread-Index: AQHUkZwbN60Hd2BAC02ocOh2HBg2xqV7/++A//+kdSA=
Date: Wed, 12 Dec 2018 21:45:26 +0000
Message-ID: <e389ab6cb6ca47f9970c3c896c0bfe90@ti.com>
References: <1544565274-46138-1-git-send-email-xuj@ti.com>
	<20181212211145.GC517@beryl>
In-Reply-To: <20181212211145.GC517@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.116.215]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH v2] tidl-utils: add TIDL import tool source compilation.
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
X-List-Received-Date: Wed, 12 Dec 2018 21:45:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Thanks for the instructions. I addressed some of the space issues in this p=
atch, but apparently not all of them. Let me address them now and submit an=
other version of the patch.=20

Thanks,
Jianzhong

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, December 12, 2018 4:12 PM
To: Xu, Jianzhong
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko/master][PATCH v2] tidl-utils: add TIDL imp=
ort tool source compilation.

So, you did remove the SUMMARY from .inc file.

But you didn't address my comment about formatting issues with extra or=20
missing spaces...

Normally I don't complain about one or two of those in a patch - those are=
=20
minor and as long as they don't break parsing or build, I accept them as is=
.

But most open source projects and communities have coding styles, e.g. Linu=
x=20
kernel. And OpenEmbedded has it as well. When there are too many such codin=
g=20
style issues in a patch, I won't take it.

Some examples, but the list is not complete:

> +DEPENDS=3D"protobuf zlib protobuf-native"
> +BBCLASSEXTEND=3D"native nativesdk"

There should be exactly 1 space on each side of the =3D sign.

> +SUMMARY =3D " TIDL import tool for conversion of Caffe and TF models int=
o TI custom network format "

There should not be spaces at the beginning and end of the text.

>  RDEPENDS_${PN}_class-target +=3D " tidl-api tidl-examples "

I know this was already in the recipe before your patch, but please also fi=
x=20
it - there's no need for spaces at the beginning and end of the list, when=
=20
using +=3D operand.

--=20
Denys


On Tue, Dec 11, 2018 at 04:54:34PM -0500, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  .../nativesdk-packagegroup-arago-sdk-host.bb       |  1 +
>  .../recipes-ti/tidl-utils/tidl-import_git.bb       | 43 ++++++++++++++++=
++++++
>  .../recipes-ti/tidl-utils/tidl-utils.bb            |  7 ++--
>  .../recipes-ti/tidl-utils/tidl-utils.inc           |  2 +
>  4 files changed, 49 insertions(+), 4 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_g=
it.bb
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.in=
c
>=20
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packa=
gegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/na=
tivesdk-packagegroup-arago-sdk-host.bb
> index 54466b7..af83521 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-sdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup=
-arago-sdk-host.bb
> @@ -13,6 +13,7 @@ EXTRA_TI_TOOLS =3D " \
>      nativesdk-clacc \
>      nativesdk-open62541-examples \
>      nativesdk-open62541-tests \
> +    nativesdk-tidl-import \
>  "
> =20
>  RDEPENDS_${PN} =3D "\
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b=
/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> new file mode 100644
> index 0000000..a644fbe
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D " TIDL import tool for conversion of Caffe and TF models int=
o TI custom network format "
> +DESCRIPTION =3D "TIDL import tool is using protobuf to read and parse in=
formation from external network models \
> +               This is ARM Linux implementation."
> +
> +require ./tidl-utils.inc
> +
> +LICENSE =3D "BSD-3"
> +LIC_FILES_CHKSUM =3D "file://modules/ti_dl/inc/itidl_ti.h;md5=3D7baa68fe=
c0aadbac92c3b41b283d26c4"
> +
> +PV =3D "01.00.00.00"
> +PR =3D "r1"
> +
> +S =3D "${WORKDIR}/git/src/importTool/"
> +
> +DEPENDS=3D"protobuf zlib protobuf-native"
> +
> +EXTRA_OEMAKE +=3D "TIARM_TOOLS=3D${GCC_ARM_NONE_TOOLCHAIN}"
> +EXTRA_OEMAKE +=3D "XDAIS_PATH=3D${XDAIS_INSTALL_DIR}"
> +EXTRA_OEMAKE +=3D "SHOW_COMMANDS=3D1"
> +EXTRA_OEMAKE +=3D "CORE=3Deve"
> +EXTRA_OEMAKE +=3D "TARGET_BUILD=3Drelease"
> +EXTRA_OEMAKE +=3D "TARGET_PLATFORM=3DPC"
> +
> +EXTRA_MAKE_ARGS =3D "PLATFORM_BUILD=3Dx86 LINUX_IMPORT_TOOL=3D64BIT PROT=
OBUF_LIB_DIR=3D${STAGING_DIR_NATIVE}/usr/lib PROTOBUF_INC_DIR=3D${STAGING_D=
IR_NATIVE}/usr/include"
> +EXTRA_MAKE_ARGS_class-target =3D "LINUX_BUILD_TOOLS=3D${TOOLCHAIN_PATH}/=
bin/${TARGET_PREFIX} PROTOBUF_LIB_DIR=3D${STAGING_LIBDIR} PROTOBUF_INC_DIR=
=3D${STAGING_INCDIR} LINUXENV=3Doearm"
> +
> +EXTRA_OEMAKE +=3D "${EXTRA_MAKE_ARGS}"
> +
> +do_compile() {
> +    cd ${S}/modules/ti_dl/utils
> +    ./genProtoSrc.sh
> +    cd ${S}
> +    oe_runmake -C modules/ti_dl/utils/tidlModelImport
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/modules/ti_dl/utils/tidlModelImport/out/tidl_mod=
el_import.out ${D}${bindir}
> +}
> +
> +INSANE_SKIP_${PN} =3D "ldflags"
> +
> +BBCLASSEXTEND=3D"native nativesdk"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta=
-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> index 569de5a..575a0a0 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
> @@ -3,16 +3,15 @@ DESCRIPTION =3D "TIDL Utilities for standalone simulati=
on and importing / translat
>  HOMEPAGE =3D "http://software-dl.ti.com/processor-sdk-linux/esd/docs/lat=
est/linux/Foundational_Components.html#tidl"
>  LICENSE =3D "TI-TFL"
> =20
> -PV =3D "1.0.0.0"
> +require ./tidl-utils.inc
> +
> +PV =3D "1.0.0.1"
>  INC_PR =3D "r0"
> =20
>  LIC_FILES_CHKSUM =3D "file://docs/LICENSE.txt;md5=3Da93aa5af7a3bbbb6fb34=
c8df59efaa5c"
> =20
>  RDEPENDS_${PN}_class-target +=3D " tidl-api tidl-examples "
> =20
> -SRC_URI =3D "git://git.ti.com/tidl/tidl-utils.git;protocol=3Dgit;branch=
=3Dmaster"
> -SRCREV =3D "994d90ae583610673d9d39086ca5e84027a9c56e"
> -
>  PR =3D "${INC_PR}.0"
> =20
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/met=
a-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> new file mode 100644
> index 0000000..37ce84d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -0,0 +1,2 @@
> +SRC_URI =3D "git://git.ti.com/tidl/tidl-utils.git;protocol=3Dgit;branch=
=3Dmaster"
> +SRCREV =3D "0021b6f15ee4a1a8919905429a5045fd02afe5b1"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

