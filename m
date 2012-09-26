Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 934E252A68
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 03:14:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8Q3EWQf031849;
	Tue, 25 Sep 2012 22:14:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8Q3EWkG001099;
	Tue, 25 Sep 2012 22:14:32 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 25 Sep 2012 22:14:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] crda: Port crda recipe from oe-classic
Thread-Index: AQHNmzAUO3xsaOUtBkytrjjZeI/CYJeb87iA
Date: Wed, 26 Sep 2012 03:14:31 +0000
Message-ID: <42E43DBC-7C8E-4F65-AEAB-6888AC38591E@ti.com>
References: <1348587378-25412-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1348587378-25412-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] crda: Port crda recipe from oe-classic
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
X-List-Received-Date: Wed, 26 Sep 2012 03:14:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Will you be sending this to meta-oe or oe-core.  An indication of the final=
 destination would be nice.

Also, we seem to be adding a lot of recipes to arago that will need to be r=
emoved later.  Should we look into a layer or directory for these to help u=
s know what to check?

Sincerely,
Chase Maupin
On Sep 25, 2012, at 5:11 PM, "Franklin S. Cooper Jr" <fcooperjr27@gmail.com=
> wrote:

> * Port the crda recipe from oe-classic. The version in oe-classic
>  was version 1.1.1
> * Version 1.1.1 had compiling issues with the version of LIBNL used in oe=
-core.
>  Upgraded version of crda to 1.1.2 which fixed that issue.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> .../recipes-connectivity/crda/crda_1.1.2.bb        |   36 +++++++++++++++=
+++++
> 1 files changed, 36 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-extras/recipes-connectivity/crda/crda_1.1.2=
.bb
>=20
> diff --git a/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb b/=
meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
> new file mode 100644
> index 0000000..82047db
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/crda/crda_1.1.2.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION =3D "Wireless Central Regulatory Domain Agent"
> +HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
> +SECTION =3D "base"
> +PRIORITY =3D "optional"
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D07c4f6dea3845b02a18dc00c8c876=
99c"
> +
> +PR =3D "r0"
> +
> +DEPENDS =3D "libgcrypt libnl python-native python-m2crypto-native"
> +RDEPENDS_${PN} =3D "udev"
> +
> +SRC_URI =3D "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=
=3Dcrda \
> +    http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2=
011.04.28-regulatory.bin;name=3Dreg \
> +    "
> +
> +EXTRA_OEMAKE =3D "MAKEFLAGS=3D"
> +do_compile() {
> +    oe_runmake all_noverify
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +    install -d ${D}/usr/lib/crda/
> +    install -m 0644 ${WORKDIR}/2011.04.28-regulatory.bin ${D}/usr/lib/cr=
da/regulatory.bin
> +}
> +
> +SRC_URI[crda.md5sum] =3D "5226f65aebacf94baaf820f8b4e06df4"
> +SRC_URI[crda.sha256sum] =3D "e469348a5d0bb933df31995869130f68901de9be02e=
666437f52125698851864"
> +SRC_URI[reg.md5sum] =3D "1535e98bcaba732e2f8e8f62dac6f369"
> +SRC_URI[reg.sha256sum] =3D "bb6ba6f5dcdf7106a19c588b0e4d43ab7af26f6474fe=
01011a318b3dceaba33b"
> +
> +FILES_${PN} +=3D "\
> +    /lib/udev/rules.d/85-regulatory.rules \
> +    /usr/lib/crda/regulatory.bin \
> +    "
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

