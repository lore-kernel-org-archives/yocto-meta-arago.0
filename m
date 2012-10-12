Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B4AF9529CE
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:54:35 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDsYDc028316;
	Fri, 12 Oct 2012 08:54:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDsYYl023070;
	Fri, 12 Oct 2012 08:54:34 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:54:34 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] qt4-embedded: Port Arago patch
Thread-Index: AQHNqDrlF8x2BPP2UkCSBOGiYPQckZe1sV1Q
Date: Fri, 12 Oct 2012 13:54:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C420@DLEE12.ent.ti.com>
References: <1350021763-12973-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350021763-12973-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Fri, 12 Oct 2012 13:54:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
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
>  2 files changed, 53 insertions(+), 1 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-qt/qt4/files/0001-
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
> +@@ -46,10 +46,6 @@ int main(int argc, char *argv[])
> + {
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
>  # For our distribution purposes we only use LGPLv2.1
>  LICENSE =3D "LGPLv2.1"
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

> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

