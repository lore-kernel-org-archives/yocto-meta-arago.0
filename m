Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id CDBAF52990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:42:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFgFAB013161
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505922135;
	bh=QC9K1YutXgVfKA+5D2Sw2bh35zwxOYfVTbjt4jnqkW8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=J0lm607JzTjFd56+BI5QRqALIRU75Zbmi5P79uMdEh76w5YzNUb9cdF3YY++uBeKy
	B3XMeqPsQS2DY3Jeyw6iDy/Ckw4SUIdfEr+mlAzIm8pS3/dMBn5HnlbLqtIOZum1Gz
	URQwXWvot8pFU6t+3H1obW0YWFokYCnITN9aTHJY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFgF7g008291
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:42:15 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Wed, 20 Sep 2017 10:42:15 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "Gou, Hongmei" <h-gou@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [meta-processor-sdk] [PATCH]
	icss-emac-lld*: update to version 01.00.00.08
Thread-Index: AQHTMiasUCsQ/qKnEUa6r8GWYb6CpqK96TXw
Date: Wed, 20 Sep 2017 15:42:14 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F67E5@DFLE12.ent.ti.com>
References: <1505918341-15928-1-git-send-email-a0271529@ti.com>
	<e2b26ef7-9497-f6c7-0345-7e6ddf73f374@ti.com>
In-Reply-To: <e2b26ef7-9497-f6c7-0345-7e6ddf73f374@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] icss-emac-lld*: update to version 01.00.00.08
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
X-List-Received-Date: Wed, 20 Sep 2017 15:42:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jake,
 For the RTOS recipe,  can we apply the below meta-ti patch (under review) =
which has addressed the review comments ?
http://patchwork.dal.design.ti.com/patch/32325/

Regards
Mahesh

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Stiffler, Jacob
Sent: Wednesday, September 20, 2017 11:40 AM
To: Gou, Hongmei; meta-arago@arago-project.org
Subject: Re: [meta-arago] [EXTERNAL] [meta-processor-sdk] [PATCH] icss-emac=
-lld*: update to version 01.00.00.08



On 9/20/2017 10:39 AM, Hongmei Gou wrote:
> * Add icss-emac-lld-rtos to build firmware binaries
> * Add k2g support for linux user space
> * Cleanup to remove TARGET from oe_runmake
>
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   .../icss-emac-lld/icss-emac-lld-01.00.00.inc       |  6 ++--
>   .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 28 +++++++++++++++=
+++
>   .../icss-emac-lld/icss-emac-lld-test_git.bb        | 34 +++++++++++++--=
-------
>   recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  5 ++--
>   4 files changed, 54 insertions(+), 19 deletions(-)
>   create mode 100644=20
> recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc=20
> b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
> index 8e2ffd4..621219b 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
> @@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL =3D "git"
>   ICSS_EMAC_LLD_GIT_BRANCH =3D "master"
>   ICSS_EMAC_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/icss_emac"
>  =20
> -# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
> -ICSS_EMAC_LLD_SRCREV =3D "08cb0540eeab7721fe82b603cb6285393f314117"
> +# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.08"
> +ICSS_EMAC_LLD_SRCREV =3D "e689df18417236110590f7b290525a610d63f574"
>  =20
>   BRANCH =3D "${ICSS_EMAC_LLD_GIT_BRANCH}"
>   SRC_URI =3D "${ICSS_EMAC_LLD_GIT_URI};destsuffix=3D${ICSS_EMAC_LLD_GIT_=
DESTSUFFIX};protocol=3D${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
>  =20
>   SRCREV =3D "${ICSS_EMAC_LLD_SRCREV}"
> -PV =3D "01.00.00.07C"
> +PV =3D "01.00.00.08"
>   INC_PR =3D "r0"
>  =20
>   S =3D "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb=20
> b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> new file mode 100644
> index 0000000..06ee279
> --- /dev/null
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
> @@ -0,0 +1,28 @@
> +inherit ti-pdk
> +require icss-emac-lld-01.00.00.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +DEPENDS_append =3D " osal-rtos \
> +                   pruss-lld-rtos \
> +"
> +DEPENDS_append_ti33x =3D " starterware-rtos \ "
> +DEPENDS_append_ti43x =3D " starterware-rtos \ "
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE =3D "0"
> +
> +LIMSOCS_ti33x =3D "am335x"
> +LIMSOCS_ti43x =3D "am437x"
> +LIMSOCS_am57xx-evm =3D "am571x am572x"
> +LIMSOCS_k2g =3D "k2g"

The LIMIT_SOCS are not used by the ti-pdk.bbclass anymore. See http://arago=
-project.org/git/?p=3Dmeta-ti.git;a=3Dcommitdiff;h=3Db00044c43e7785decb1d6a=
c35349ca4b2711676e

The correct variables are set in the machine configuration, so they can be =
removed from there.

> +
> +export PDK_ICSS_EMAC_ROOT_PATH =3D"${WORKDIR}/build"
> +export DEST_ROOT=3D"${S}"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT =3D "ICSS-EMAC LLD"
> +
> +INSANE_SKIP_${PN} =3D "arch"
> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb=20
> b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> index 6beafbf..375bfbc 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> @@ -1,47 +1,55 @@
>   DESCRIPTION =3D "TI ICSS-EMAC low level driver tests"
>  =20
> -DEPENDS=3D"common-csl-ip pruss-lld icss-emac-lld osal"
> +DEPENDS=3D"common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos =
icss-emac-lld-rtos"
>  =20
>   DEPENDS_append_ti33x =3D " starterware"
>   DEPENDS_append_ti43x =3D " starterware"
>  =20
>   include icss-emac-lld-01.00.00.inc
>  =20
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.0"
>  =20
> -COMPATIBLE_MACHINE =3D "am57xx-evm|ti33x|ti43x"
> -
> -EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} ICSS_EMAC_SRC_DIR=3D${S}"
> +EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR=
} PDK_PKG_PATH=3D${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_D=
IR=3D${S}"
>  =20
>   do_compile_am57xx-evm () {
>   #   Build the tests
> -    oe_runmake tests DEVICE=3D"am571x" TARGET=3D"SOC_AM571x"
> +    oe_runmake tests DEVICE=3D"am571x"
>       oe_runmake clean
> -    oe_runmake tests DEVICE=3D"am572x" TARGET=3D"SOC_AM572x"
> +    oe_runmake tests DEVICE=3D"am572x"
>   }
>  =20
>   do_compile_ti33x () {
>   #   Build the tests
> -    oe_runmake tests DEVICE=3D"am335x" TARGET=3D"SOC_AM335x"
> +    oe_runmake tests DEVICE=3D"am335x"
>   }
>  =20
>   do_compile_ti43x () {
>   #   Build the tests
> -    oe_runmake tests DEVICE=3D"am437x" TARGET=3D"SOC_AM437x"
> +    oe_runmake tests DEVICE=3D"am437x"
> +}
> +
> +do_compile_k2g-evm () {
> +#   Build the tests
> +    oe_runmake tests DEVICE=3D"k2g"
>   }
>  =20
>   do_install_am57xx-evm () {
>   #   Install the binary
> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am571x" TARGET=3D"SOC_AM571x"
> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am572x" TARGET=3D"SOC_AM572x"
> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am571x"
> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am572x"
>   }
>  =20
>   do_install_ti33x () {
>   #   Install the binary
> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am335x" TARGET=3D"SOC_AM335x"
> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am335x"
>   }
>  =20
>   do_install_ti43x () {
>   #   Install the binary
> -    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am437x" TARGET=3D"SOC_AM437x"
> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"am437x"
> +}
> +
> +do_install_k2g-evm () {
> +#   Install the binary
> +    oe_runmake installbin INSTALL_BIN_BASE_DIR=3D${D}${bindir} DEVICE=3D=
"k2g"
>   }

It appears that this "DEVICE" is an element out of the TI_PDK_LIMIT_SOCS li=
st. If this is true, then these compile and install tasks can be greatly si=
mplified by looping over the TI_PDK_LIMIT_SOCS list.

> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb=20
> b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> index b3be89b..bfa655d 100644
> --- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> @@ -4,13 +4,12 @@ DEPENDS=3D"common-csl-ip pruss-lld osal"
>  =20
>   include icss-emac-lld-01.00.00.inc
>  =20
> -PR =3D "${INC_PR}.2"
> -
> -COMPATIBLE_MACHINE =3D "am57xx-evm|ti33x|ti43x"
> +PR =3D "${INC_PR}.0"
>  =20
>   TARGET_NAME_am57xx-evm =3D "SOC_AM572x"
>   TARGET_NAME_ti33x =3D "SOC_AM335x"
>   TARGET_NAME_ti43x =3D "SOC_AM437x"
> +TARGET_NAME_k2g-evm =3D "SOC_K2G"
>  =20
>   EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDI=
R} TARGET=3D${TARGET_NAME}"
>  =20

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

