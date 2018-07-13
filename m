Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id ABAD652978
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 18:11:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DIBEZN016603
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531505474;
	bh=oboOCt2tDbQ5f/9gBIoZHTb91AuiXBuoB9lusNdssdI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=NFlnG1M4aN506s8+2mE67pvfZY7HHooAautHhcUu5iJ9k4QWFRP65yfDqhKDwJ7Rg
	G1m2PFCn0PjMJKdV3SMBvB5/z/Pfy0aYqqGUmTIjT2uCyysWLkQdb+UT+e52/h9scj
	v6ZStS5nbEMJh0ki7/uqA7m4xTW1ec2fFr26nQA8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIBEeD029059
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:11:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:11:13 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Fri, 13 Jul 2018 13:11:13 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [rocko/master][PATCH]
	external-linaro-toolchain: switch from USE_LDCONFIG to ldconfig distro
	feature
Thread-Index: AQHUGinfcAyWYZLJDkaq9J6MIhdwW6SNdSdA
Date: Fri, 13 Jul 2018 18:11:13 +0000
Message-ID: <eeae1baa144343818d0811021cade386@ti.com>
References: <20180712214524.12947-1-denys@ti.com>
In-Reply-To: <20180712214524.12947-1-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [rocko/master][PATCH] external-linaro-toolchain: switch from USE_LDCONFIG to ldconfig distro feature
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
X-List-Received-Date: Fri, 13 Jul 2018 18:11:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Can you please apply this set to the ti2018.01 branch?

Thank you,
Jake

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, July 12, 2018 5:45 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [rocko/master][PATCH] external-linaro-
> toolchain: switch from USE_LDCONFIG to ldconfig distro feature
>=20
> Corresponding change was made upstream and USE_LDCONFIG is no longer
> set.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/meta/external-linaro-toolchain.bbappend        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-
> toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-
> linaro-toolchain.bbappend
> index 6ebcb4be..8230790d 100644
> --- a/meta-arago-extras/recipes-core/meta/external-linaro-
> toolchain.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/external-linaro-
> toolchain.bbappend
> @@ -26,7 +26,7 @@ RDEPENDS_libubsan +=3D "libstdc++"
>  PKGV =3D "${ELT_VER_LIBC}"
>  PKGV_glibc-thread-db =3D "${ELT_VER_LIBC}"
>=20
> -FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/*
> ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig
> ${sysconfdir}/ld.so.conf', '', d)}"
> +FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/*
> ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig',
> '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
>  FILES_${PN} +=3D "\
>  	${libdir}/bin \
>  	${libdir}/locale \
> --
> 2.17.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

