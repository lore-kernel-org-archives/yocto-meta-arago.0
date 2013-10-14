Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 73C98529BD
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 14:30:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EEU84t010653;
	Mon, 14 Oct 2013 09:30:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EEU8P8002627;
	Mon, 14 Oct 2013 09:30:08 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 09:30:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] qtwebkit-examples: fix pushed
	upstream,	remove locally
Thread-Index: AQHOyKRUZ+yDTFcmTEOkt25c+6GTYpn0Qmvw
Date: Mon, 14 Oct 2013 14:30:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C575553@DFLE08.ent.ti.com>
References: <1381731127-17880-1-git-send-email-denis@denix.org>
In-Reply-To: <1381731127-17880-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] qtwebkit-examples: fix pushed upstream, remove locally
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
X-List-Received-Date: Mon, 14 Oct 2013 14:30:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, October 14, 2013 1:12 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/3] qtwebkit-examples: fix pushed upstream,
> remove locally
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-qt/qt5/qtwebkit-examples/examples-build.patch        | 9 ---=
------
>  .../recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend              | 5 ---=
--
>  2 files changed, 14 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
> examples/examples-build.patch
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
> examples_5.1.0.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-
> build.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples=
-
> build.patch
> deleted file mode 100644
> index d7dc6ae..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-
> build.patch
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -diff -uNr qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.=
pro
> qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
> ---- qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.pro
> 	2013-07-02 03:10:27.000000000 -0400
> -+++ qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
> 	2013-09-29 21:31:10.761137146 -0400
> -@@ -2,4 +2,4 @@
> -
> - load(qt_parts)
> -
> --SUBDIRS +=3D doc
> -+SUBDIRS +=3D doc examples
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-
> examples_5.1.0.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit-
> examples_5.1.0.bbappend
> deleted file mode 100644
> index 7e41331..0000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -SRC_URI +=3D "file://examples-build.patch"
> -
> -PR_append =3D "-arago0"
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

