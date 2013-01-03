Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B7604529BC
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:52:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03KqSiZ021711;
	Thu, 3 Jan 2013 14:52:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03KqS7A026743;
	Thu, 3 Jan 2013 14:52:28 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:52:28 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 2/4] arago-source-ipk.conf: Rename qml-playground
	quick-playground
Thread-Index: AQHNwSbMMHjq9W3e00mtPo4GphkH75g4Zd8g
Date: Thu, 3 Jan 2013 20:52:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3599C3@DFLE09.ent.ti.com>
References: <1352760055-6119-1-git-send-email-fcooper@ti.com>
	<1352760055-6119-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1352760055-6119-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] arago-source-ipk.conf: Rename qml-playground quick-playground
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
X-List-Received-Date: Thu, 03 Jan 2013 20:52:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Monday, November 12, 2012 4:41 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 2/4] arago-source-ipk.conf: Rename qml-playground quick-
> playground
>=20
> * Rename qml-playground to quick-playground to match the recipe name.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-
> distro/conf/distro/arago-source-ipk.conf
> index 312f629..845e8b8 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -49,8 +49,8 @@ SRCIPK_INSTALL_DIR_pn-matrix-gui =3D "example-
> applications/${PN}-${PV}"
>  CREATE_SRCIPK_pn-qml-carinfo =3D "1"
>  SRCIPK_INSTALL_DIR_pn-qml-carinfo =3D "example-applications/${PN}-${PV}"
>=20
> -CREATE_SRCIPK_pn-qml-playground =3D "1"
> -SRCIPK_INSTALL_DIR_pn-qml-playground =3D "example-applications/${PN}-
> ${PV}"
> +CREATE_SRCIPK_pn-quick-playground =3D "1"
> +SRCIPK_INSTALL_DIR_pn-quick-playground =3D "example-applications/${PN}-
> ${PV}"
>=20
>  CREATE_SRCIPK_pn-qt-catalog =3D "1"
>  SRCIPK_INSTALL_DIR_pn-qt-catalog =3D "example-applications/${PN}-${PV}"
> --
> 1.7.0.4


