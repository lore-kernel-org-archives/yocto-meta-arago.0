Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 17202529BD
	for <meta-arago@arago-project.org>;
	Tue, 17 Feb 2015 20:16:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1HKGmGt010381
	for <meta-arago@arago-project.org>; Tue, 17 Feb 2015 14:16:48 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1HKGk1x022830
	for <meta-arago@arago-project.org>; Tue, 17 Feb 2015 14:16:46 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 17 Feb 2015 14:16:46 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] ipsecmgr: Add recipes for ipsec manager kernel module
	and libraries
Thread-Index: AQHQRX4f5dL3VtlmIUu1kA63rNFPLZz1UkwQ
Date: Tue, 17 Feb 2015 20:16:46 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058114382@DLEE11.ent.ti.com>
References: <1423606116-1967-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1423606116-1967-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ipsecmgr: Add recipes for ipsec manager kernel module and libraries
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
X-List-Received-Date: Tue, 17 Feb 2015 20:16:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: Nelson, Sam
> Sent: Tuesday, February 10, 2015 5:09 PM
> To: meta-arago@arago-project.org
> Cc: Nelson, Sam
> Subject: [PATCH] ipsecmgr: Add recipes for ipsec manager kernel module an=
d
> libraries
>=20
> - Provides module and libraries to offload IPSec security
>  policy & associated security association to NETCP for
>  crypto operations
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-support/ipsecmgr/ipsecmgr-mod_git.bb   |   20 +++++++++++++
>  .../recipes-support/ipsecmgr/ipsecmgr.inc          |    6 ++++
>  .../recipes-support/ipsecmgr/ipsecmgr_git.bb       |   30 ++++++++++++++=
++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-
> mod_git.bb
>  create mode 100644 meta-arago-extras/recipes-
> support/ipsecmgr/ipsecmgr.inc
>  create mode 100644 meta-arago-extras/recipes-
> support/ipsecmgr/ipsecmgr_git.bb
>=20
> diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.=
bb
> b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
> new file mode 100644
> index 0000000..b00da58
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "IPSec Manager kernel module"
> +DESCRIPTION =3D "Provides Module to offload IPSec security policy & asso=
ciated
> security association to NETCP for crypto operations"
> +
> +LIC_FILES_CHKSUM =3D
> "file://../../ipsecmgr_snoop.h;beginline=3D1;endline=3D33;md5=3Df7eadca4f=
b5599f50
> 8dc11fa1e752919"
> +
> +include ipsecmgr.inc
> +
> +MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
> +PR =3D "${MACHINE_KERNEL_PR}"
> +
> +EXTRA_OEMAKE +=3D "KDIR=3D"${STAGING_KERNEL_DIR}""
> +
> +inherit module
> +
> +S =3D "${WORKDIR}/git/src/module"
> +
> +do_install() {
> +# Install kernel module
> +	oe_runmake INSTALL_MOD_PATH=3D"${D}" install
> +}
> diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/me=
ta-
> arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
> new file mode 100644
> index 0000000..2aafa57
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
> @@ -0,0 +1,6 @@
> +LICENSE =3D "BSD-3-Clause"
> +BRANCH=3D"master"
> +SRC_URI =3D "git://arago-
> project.org/git/projects/ipsecmgr.git;protocol=3Dgit;branch=3D${BRANCH}"
> +#Commit ID corresponding to DEV.IPSECMGR.01.01.00.03
> +SRCREV =3D "1ea8355ae9142311901c842c97a58d2846b308e6"
> +PV     =3D "01.01.00.03"
> diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
> b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
> new file mode 100644
> index 0000000..790f7cb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "IPSec Manager libraries"
> +DESCRIPTION =3D "Provides library to offload IPSec security policy & ass=
ociated
> security association to NETCP for crypto operations"
> +
> +LIC_FILES_CHKSUM =3D
> "file://../ipsecmgr_snoop.h;beginline=3D1;endline=3D33;md5=3Df7eadca4fb55=
99f508d
> c11fa1e752919"
> +
> +include ipsecmgr.inc
> +
> +DEPENDS =3D "libnl-xfrm"
> +
> +CFLAGS +=3D "-I${STAGING_INCDIR}/libnl3"
> +
> +S =3D "${WORKDIR}/git/build"
> +LIB_INC_DIR =3D "${S}/.."
> +UTILS_LIB_INC_DIR =3D "${S}/../utils/iface/"
> +
> +do_compile() {
> +# Compile the library
> +	make clean
> +	make all
> +}
> +do_install() {
> +# Install libraries
> +	install -d ${D}${libdir}/
> +	install -c -m 666 libipsecmgr_snoop.a ${D}${libdir}/
> +	install -c -m 666 libipsecmgr_ipc.a ${D}${libdir}/
> +	install -c -m 666 libipsecmgr_syslog.a ${D}${libdir}/
> +	install -d ${D}${includedir}/
> +	install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
> +	install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
> +}
> --
> 1.7.9.5


