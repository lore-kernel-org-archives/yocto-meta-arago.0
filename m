Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5B22C529BC
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:53:11 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r03KrADd021792;
	Thu, 3 Jan 2013 14:53:10 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r03KrARX027508;
	Thu, 3 Jan 2013 14:53:10 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 3 Jan 2013 14:53:10 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 3/4] task-arago-tisdk-qte: Add Qt quick-playground
	application.
Thread-Index: AQHNwSbOWmiryohyv02FNEqj3PrM05g4ZhGQ
Date: Thu, 3 Jan 2013 20:53:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3599D6@DFLE09.ent.ti.com>
References: <1352760055-6119-1-git-send-email-fcooper@ti.com>
	<1352760055-6119-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1352760055-6119-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] task-arago-tisdk-qte: Add Qt quick-playground application.
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
X-List-Received-Date: Thu, 03 Jan 2013 20:53:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Monday, November 12, 2012 4:41 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [PATCH 3/4] task-arago-tisdk-qte: Add Qt quick-playground applic=
ation.
>=20
> * Add quick-playground to the list of Qt applications to include in the S=
itara
>   SDK.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../tasks/task-arago-tisdk-qte-sdk-host.bb         |    4 +++-
>  .../recipes-core/tasks/task-arago-tisdk-qte.bb     |    4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sd=
k-
> host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-
> host.bb
> index b68d1c7..d42afca 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.=
bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte-sdk-host.=
bb
> @@ -1,12 +1,14 @@
>  DESCRIPTION =3D "Task to add Qt embedded related sources into the sdk"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> 20420"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  QT_DEMOS =3D "\
>      qt-tstat-src \
> +    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick=
-
> playground-src', '', d)} \
>  "
>=20
>  RDEPENDS_${PN} =3D "\
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
> b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
> index 63ef58a..56f5178 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-qte.bb
> @@ -1,14 +1,16 @@
>  DESCRIPTION =3D "Task to add Qt embedded related packages"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> 20420"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  QT_DEMOS =3D "\
>      qt4-embedded-examples \
>      qt4-embedded-demos \
>      qt-tstat \
> +    ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick=
-
> playground', '', d)} \
>  "
>=20
>  RDEPENDS_${PN} =3D "\
> --
> 1.7.0.4


