Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 24B995299C
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2013 21:41:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9TLf5YG021771;
	Tue, 29 Oct 2013 16:41:05 -0500
Received: from DFLE72.ent.ti.com ([128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9TLf580021523;
	Tue, 29 Oct 2013 16:41:05 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 29 Oct 2013 16:41:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] qtwebkit: adjust one of the patches to apply clean on
	some hosts
Thread-Index: AQHO1OtxyL0IyMOYLkmRg89bNJ7hP5oMNT6g
Date: Tue, 29 Oct 2013 21:41:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C58B48F@DFLE08.ent.ti.com>
References: <1383081038-6177-1-git-send-email-denis@denix.org>
In-Reply-To: <1383081038-6177-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] qtwebkit: adjust one of the patches to apply clean on some hosts
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
X-List-Received-Date: Tue, 29 Oct 2013 21:41:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Tuesday, October 29, 2013 4:11 PM
> To: meta-arago@arago-project.org
> Cc: Dmytriyenko, Denys; Cooper Jr., Franklin
> Subject: [PATCH] qtwebkit: adjust one of the patches to apply clean on so=
me
> hosts
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Franklin Cooper Jr. <fcooper@ti.com>
> ---
>  .../recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch           | =
4 ++--
>  meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend              | =
2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-
> qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch b/meta-arago-
> distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
> index 46c93f7..89712a8 100644
> --- a/meta-arago-distro/recipes-
> qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cp
> +++ p.patch
> @@ -1,6 +1,6 @@
> -diff -Nurp8
> Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
> Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfaceGL_NoX.
> cpp
> +diff -Nurp8
> +Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.cpp
> +Source-
> new/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.
> +cpp
>  ---
> qtwebkit/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_
> NoX.cpp	1970-01-01 05:30:00.000000000 +0530
> -+++
> qtwebkit/Source/WebCore/platform/graphics/surfaces/qt_new/GraphicsSurfac
> eGL_NoX.cpp	2013-09-07 13:43:55.186851650 +0530
> ++++ qtwebkit-
> new/Source/WebCore/platform/graphics/surfaces/qt/GraphicsSurfaceGL_NoX.
> cpp	2013-09-07 13:43:55.186851650 +0530
>  @@ -0,0 +1,266 @@
>  +/*
>  + Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies) diff =
--git
> a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend b/meta-arago-
> distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
> index aed6b51..e86c8a2 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.1.1.bbappend
> @@ -11,4 +11,4 @@ SRC_URI +=3D " \
>  	file://WebCore.pri.patch \
>  "
>=20
> -PR_append =3D "-arago0"
> +PR_append =3D "-arago1"
> --
> 1.8.3.2


