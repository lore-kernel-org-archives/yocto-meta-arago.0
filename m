Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DAEEE52A38
	for <meta-arago@arago-project.org>;
	Sun, 17 Nov 2013 17:07:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAHH7nqG001502
	for <meta-arago@arago-project.org>; Sun, 17 Nov 2013 11:07:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAHH7nvZ009026
	for <meta-arago@arago-project.org>; Sun, 17 Nov 2013 11:07:49 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Sun, 17 Nov 2013 11:07:49 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
Thread-Index: AQHO47da7WmYu2K8GkWU0zHcYL/HGJopp3vQ
Date: Sun, 17 Nov 2013 17:07:48 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C5A52EB@DFLE08.ent.ti.com>
References: <1384711613-29582-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1384711613-29582-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
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
X-List-Received-Date: Sun, 17 Nov 2013 17:07:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch is based on the 6 patches Denys submitted earlier.

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Sunday, November 17, 2013 12:07 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
>=20
> * By default Qt5 is looking at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin i=
nstead
>   of the proper location i686-arago-linux/usr/bin/qt5.
> * Update qmake.conf to insure qmake looks at the proper location for host
>   binaries.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte=
.bb
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> index e3bf80f..6220578 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?=3D "-qte-sdk"
>=20
>  require meta-toolchain-arago.bb
>=20
> -PR =3D "r16"
> +PR =3D "r17"
>=20
>  # There could be qt5, qt4e and qt4x11 providers, but we don't support qt=
4x11
> for now  QT_DIR_NAME =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5'=
,
> 'qtopia', d)}"
> @@ -46,6 +46,12 @@ toolchain_create_sdk_env_script_append() {
>  	echo 'Libraries =3D $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
>  	echo 'Headers =3D $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
>=20
> +	if [ "${QT_PROVIDER}" =3D "qt5" ]
> +	then
> +		echo 'HostBinaries =3D ../${SDK_SYS}/usr/bin/qt5' >> $qt_conf
> +	fi
> +
> +
>  	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
>  	# and QTCreator
>  	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf
> .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
> --
> 1.7.0.4


