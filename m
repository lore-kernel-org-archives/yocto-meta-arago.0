Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2ED02529CD
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 20:38:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86KcdUo010287
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 15:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504730319;
	bh=7M158NwB9rkSnXNSpNTylts8YdSbg4/gm4usYDxWJ8U=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=hHS00bwtVm+X0O5bnP1u60KXBxYLZkxD728xVCPa+USduJcIT0QZ3k+NV5YrdgJ4f
	8l+lVOyl91xuOk4OkCAmebqizwX09elesLsD3zvKV0qYgVUnEcnkot/VDtCxalRjOa
	TUQ6hPH85+zsSEC/Yxxc5tv0p0jFBYHIlgyFNC8w=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86Kcd6N015667
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 15:38:39 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Wed, 6 Sep 2017 15:38:38 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Pang, Ivan" <i-pang@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH]
	ti-cgt-pru:   updated version to 2.1.5
Thread-Index: AQHTJ06uB0KfBPFQo0GGG1DIOJ7qd6KoUZVw
Date: Wed, 6 Sep 2017 20:38:38 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9582543A413@DFLE09.ent.ti.com>
References: <1504729693-32319-1-git-send-email-i-pang@ti.com>
In-Reply-To: <1504729693-32319-1-git-send-email-i-pang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] ti-cgt-pru: updated version to 2.1.5
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
X-List-Received-Date: Wed, 06 Sep 2017 20:38:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Pang, Ivan
> Sent: Wednesday, September 06, 2017 4:28 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] ti-cgt-pru:
> updated version to 2.1.5
>=20
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt-pru_2.1.5.bb | 49
> +++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
>=20
> diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb b/recipes-ti/devtool=
s/ti-
> cgt-pru_2.1.5.bb
> new file mode 100644
> index 0000000..5586d0f
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
> @@ -0,0 +1,49 @@
> +DESCRIPTION =3D "TI PRU Code Generation Tools"
> +HOMEPAGE =3D "https://www-
> a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause
> & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
> +
> +LIC_FILES_CHKSUM =3D "file://ti-cgt-
> pru_${PV}/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=3Dd7fea45
> a7968939ff953ae8a1e6719f4"
> +LIC_FILES_CHKSUM_class-target =3D "file://usr/share/doc/ti/cgt-
> pru/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=3Dd7fea45a79689
> 39ff953ae8a1e6719f4"
> +
> +require recipes-ti/includes/ti-paths.inc require
> +recipes-ti/includes/ti-unpack.inc
> +
> +BINFILE =3D "ti_cgt_pru_${PV}_linux_installer_x86.bin"
> +BINFILE_NAME =3D "cgt-pru-x86"
> +TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
> +TI_BIN_UNPK_CMDS =3D ""
> +
> +BINFILE_class-target =3D
> "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
> +BINFILE_NAME_class-target =3D "cgt-pru-arm"
> +
> +SRC_URI =3D "http://software-
> dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=3D${BINFI
> LE_NAME}"
> +
> +SRC_URI[cgt-pru-x86.md5sum] =3D "06ac11b90a55ee787ac20fcca9a27013"
> +SRC_URI[cgt-pru-x86.sha256sum] =3D
> "0f5b965ae1fda818ce5a81f1adbdae0a65047c6ae6cff1869e08e678122f8dff"
> +
> +SRC_URI[cgt-pru-arm.md5sum] =3D "bedda3b31d8918d5d1d3c6d886821d0a"
> +SRC_URI[cgt-pru-arm.sha256sum] =3D
> "f2711478f9160a73660a2b2f316ad446bc481141bb9889f1001441beccce3584"
> +
> +do_install() {
> +    install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
> +    cp -r ${S}/ti-cgt-pru_${PV}/. \
> +          ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
> +}
> +
> +do_install_class-target() {
> +    ${WORKDIR}/${BINFILE} --prefix ${D} }
> +
> +FILES_${PN} +=3D "${datadir}/ti/*"
> +
> +FILES_${PN}-dbg =3D "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
> +                   ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \ "
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +INSANE_SKIP_${PN} +=3D "arch staticdev already-stripped"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

