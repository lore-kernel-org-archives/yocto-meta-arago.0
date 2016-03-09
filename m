Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CA31A52A4F
	for <meta-arago@arago-project.org>;
	Wed,  9 Mar 2016 21:53:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u29Lrt6v010044
	for <meta-arago@arago-project.org>; Wed, 9 Mar 2016 15:53:55 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u29Lrtiq019619
	for <meta-arago@arago-project.org>; Wed, 9 Mar 2016 15:53:55 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 9 Mar 2016 15:53:55 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] libnl-xfrm: under {includedir}, create
	symbolic link at netlink which             references to folder
	libnl3/netlink
Thread-Index: AQHReM3KR1uY/1G4u0ua19a3wg2Pep9RqrbA
Date: Wed, 9 Mar 2016 21:53:54 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B9443A@DLEE08.ent.ti.com>
References: <1457395340-11832-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1457395340-11832-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libnl-xfrm: under {includedir}, create symbolic link at netlink which references to folder libnl3/netlink
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
X-List-Received-Date: Wed, 09 Mar 2016 21:53:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Monday, March 07, 2016 7:02 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei
> Subject: [meta-arago] [PATCH v2] libnl-xfrm: under {includedir}, create
> symbolic link at netlink which references to folder libnl3/netlink
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> v2 changes: modify the commit message
>=20
>  meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.=
bb
> b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> index 74733f0..526ad0a 100644
> --- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> +++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
> @@ -14,6 +14,8 @@ BRANCH=3D"hawking_dev"
>  SRCREV =3D "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
>  SRC_URI =3D "git://arago-project.org/git/projects/libnl-
> xfrm.git;protocol=3Dgit;branch=3D${BRANCH}"
>=20
> +PR =3D "r1"
> +
>  S =3D "${WORKDIR}/git"
>=20
>  LIBNL_XFRM_LIB =3D "lib/libnl-xfrm.a"
> @@ -34,6 +36,8 @@ do_install_append() {
>  	install -c -m 755 ${S}/${LIBNL_XFRM_LIB} ${D}${libdir}/
>  	install -c -m 755 ${S}/include/netlink/xfrm/*.h
> ${D}${includedir}/libnl3/netlink/xfrm/
>  	install -c -m 755 ${S}/lib/libnl-xfrm.so ${D}${libdir}/libnl-xfrm.so.1.=
0.0
> +	cd ${D}${includedir}/
> +	ln -s libnl3/netlink netlink
>  	cd ${D}${libdir}/
>  	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so.1
>  	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so
> --
> 1.9.1


