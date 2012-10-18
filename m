Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 03FBB52AB2
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 06:34:48 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9I6YmvR009904;
	Thu, 18 Oct 2012 01:34:48 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9I6YmOB018693;
	Thu, 18 Oct 2012 01:34:48 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 18 Oct 2012 01:34:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] qt4-embedded: Port Arago patch
Thread-Index: AQHNqDrkIL1FWGwuHkGAq91/YabcDJe2BZQAgAid4mA=
Date: Thu, 18 Oct 2012 06:34:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C306CC1@DFLE09.ent.ti.com>
References: <1350021763-12973-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C420@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015925C420@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] qt4-embedded: Port Arago patch
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
X-List-Received-Date: Thu, 18 Oct 2012 06:34:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Maupin, Chase=20
Sent: Friday, October 12, 2012 9:55 PM
To: Franklin S. Cooper Jr; meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: RE: [meta-arago] [PATCH] qt4-embedded: Port Arago patch

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 1:03 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] qt4-embedded: Port Arago patch
>=20
> * Port patch from Arago to apply to Qt v4.8.0
> * Add patch that maximizes the weatherinfo and imageviewer demos.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...d-Maximize-weatherinfo-and-imageviewer-de.patch |   47
> ++++++++++++++++++++
>  .../recipes-qt/qt4/qt4-embedded_4.8.0.bbappend     |    7 +++-
>  2 files changed, 53 insertions(+), 1 deletions(-)  create mode 100644=20
> meta-arago-distro/recipes-qt/qt4/files/0001-
> qt4-embedded-Maximize-weatherinfo-and-imageviewer-de.patch
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt4/files/0001-qt4-
> embedded-Maximize-weatherinfo-and-imageviewer-de.patch b/meta-
> arago-distro/recipes-qt/qt4/files/0001-qt4-embedded-Maximize-
> weatherinfo-and-imageviewer-de.patch
> new file mode 100644
> index 0000000..d7dc847
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt4/files/0001-qt4-embedded-
> Maximize-weatherinfo-and-imageviewer-de.patch
> @@ -0,0 +1,47 @@
> +From d79e87d256320e3b735e0bb02d1c6588dd211972 Mon Sep 17
> 00:00:00 2001
> +From: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> +Date: Sun, 2 Sep 2012 14:34:47 -0500
> +Subject: [PATCH] qt4-embedded: Maximize weatherinfo and
> imageviewer demos
> +
> +* Port patch from arago that maximizes the weatherinfo and
> imageviewer demos
> +

Missing Upstream-Status

Franklin:
I will add an Upstream-Status stating that this patch is not going to be up=
streamed since this patch is specific to our SDK.

> +Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> +---
> + demos/embedded/weatherinfo/weatherinfo.cpp |    5 -----
> + examples/widgets/imageviewer/main.cpp      |    4 ----
> + 2 files changed, 0 insertions(+), 9 deletions(-)
> +
> +diff --git a/demos/embedded/weatherinfo/weatherinfo.cpp
> b/demos/embedded/weatherinfo/weatherinfo.cpp
> +index 0614149..c47504d 100644
> +--- a/demos/embedded/weatherinfo/weatherinfo.cpp
> ++++ b/demos/embedded/weatherinfo/weatherinfo.cpp
> +@@ -492,12 +492,7 @@ int main(int argc, char *argv[])
> +     QApplication app(argc, argv);
> +
> +     WeatherInfo w;
> +-#if defined(Q_OS_SYMBIAN)
> +     w.showMaximized();
> +-#else
> +-    w.resize(520, 288);
> +-    w.show();
> +-#endif
> +
> +     return app.exec();
> + }
> +diff --git a/examples/widgets/imageviewer/main.cpp
> b/examples/widgets/imageviewer/main.cpp
> +index 8d1a068..35fb80d 100644
> +--- a/examples/widgets/imageviewer/main.cpp
> ++++ b/examples/widgets/imageviewer/main.cpp
> +@@ -46,10 +46,6 @@ int main(int argc, char *argv[])  {
> +     QApplication app(argc, argv);
> +     ImageViewer imageViewer;
> +-#if defined(Q_OS_SYMBIAN)
> +     imageViewer.showMaximized();
> +-#else
> +-    imageViewer.show();
> +-#endif
> +     return app.exec();
> + }
> +--
> +1.7.0.4
> diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend
> index 462a746..73cd7f3 100644
> --- a/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend
> @@ -2,4 +2,9 @@
>  # For our distribution purposes we only use LGPLv2.1  LICENSE =3D=20
> "LGPLv2.1"
>=20
> -PR_append =3D "-arago1"
> +PR_append =3D "-arago2"
> +
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +
> +SRC_URI +=3D "file://0001-qt4-embedded-Maximize-weatherinfo-and-
> imageviewer-de.patch"

This is appending qt4-embedded.  What about the qt4-embedded-gles version

Franklin:
I had a similar append for qt4-embedded-gles that I didn't send out before =
I left. I plan on creating an include file like in Arago that will include =
all of the shared settings used by qt4-embedded and qt4-embedded-gles.

> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

