Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 32A19529CA
	for <meta-arago@arago-project.org>;
	Tue, 12 Jun 2018 17:29:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5CHTEEQ014524
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 12:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528824554;
	bh=ryv7n2Sn2sdwhUJ7zNkKl4qAakbxe1abAtgZvV+GSaY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=hmLGRu5cSOBkxQw3CWDuPwqBxp/ufvxgN8kK5VyBvAvshGlONBerRPhAnrFeJGxHT
	Qpzuys4r2azFQbhn/ka9O10Fn/Rn/NJBK8FJNz+t59NlWvKPI9fieUoO9CO+A4yZ1q
	WMv4G1vTM/knZwQGPOeXI5tUgYyvSGX4xPkbsGwg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5CHTEZb029054
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 12:29:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 12 Jun 2018 12:29:13 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Tue, 12 Jun 2018 12:29:13 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] csl: Add
	special compile for IDK targets only
Thread-Index: AQHUAnCiwPQZrnSepE2y8MB8iWiPiKRc4L4Q
Date: Tue, 12 Jun 2018 17:29:13 +0000
Message-ID: <413602b7876b4d38a034fe9eee3c05e4@ti.com>
References: <1528823578-8427-1-git-send-email-x0157990@ti.com>
In-Reply-To: <1528823578-8427-1-git-send-email-x0157990@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] csl: Add special compile for IDK targets only
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
X-List-Received-Date: Tue, 12 Jun 2018 17:29:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK. " ti-cgt-arp32-native" is not available.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Senicic, Djordje
> Sent: Tuesday, June 12, 2018 1:13 PM
> To: meta-arago@arago-project.org
> Cc: Senicic, Djordje; Senicic, Djordje
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] csl: Add
> special compile for IDK targets only
>=20
> * AM57xx IDK requires also ARP32 tool chain for compilation
>=20
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../common-csl-ip/common-csl-ip-rtos_git.bbappend  | 28
> +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
> b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
> index dbf994a..2b0840e 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
> @@ -1 +1,27 @@
> -require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
> +require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
> +PR_append =3D ".tisdk1"
> +
> +# opencl-monitor does not distinguish between am57xx-evm and dra7xx-
> evm and thus
> +# requires the am57xx-evm CSL libraries for both devices.
> +TI_PDK_LIMIT_SOCS_append_dra7xx =3D " am574x"
> +
> +DEPENDS_append_dra7xx =3D " ti-cgt-arp32-native "
> +DEPENDS_append_am57xx =3D " ti-cgt-arp32-native "
> +
> +do_compile_append_am57xx-evm() {
> +
> +    if [ "${TI_PDK_XDCMAKE}" =3D=3D "1" ]
> +    then
> +        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC}
> XDCARGS=3D"${TI_PDK_XDC_ARGS}" ROOTDIR=3D"${ROOTDIR}" -PR .
> +        ${XDC_INSTALL_DIR}/xdc release XDCARGS=3D"${TI_PDK_XDC_ARGS}" -
> PR .
> +    else
> +        BUILD_DIR=3D${B}/`get_build_dir_bash`
> +        cd ${BUILD_DIR}
> +
> +        oe_runmake ${TI_PDK_MAKE_TARGET}
> +
> +        oe_runmake csl BOARD=3DidkAM572x CORE=3Darp32_1 BUILD_ARP32=3Dye=
s
> +        oe_runmake csl BOARD=3DidkAM574x CORE=3Darp32_1 BUILD_ARP32=3Dye=
s
> +    fi
> +}
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

