Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 72AC852990
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:20:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DKPuE025718;
	Tue, 1 Oct 2013 08:20:25 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DKPoQ032281;
	Tue, 1 Oct 2013 08:20:25 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:20:25 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 07/13] webkit-examples: enable building
	and packaging of examples
Thread-Index: AQHOvnWB/OmjafKCbE6X4PmFPGJhQZnf1Q5V
Date: Tue, 1 Oct 2013 13:20:24 +0000
Message-ID: <A7B97C37-84E1-4888-A8B4-6C7BE36F1D70@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-8-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-8-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/13] webkit-examples: enable building and packaging of examples
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
X-List-Received-Date: Tue, 01 Oct 2013 13:20:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../recipes-qt/qt5/qtwebkit-examples/examples-build.patch        | 9 ++++=
+++++
> .../recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend              | 5 ++++=
+
> 2 files changed, 14 insertions(+)
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/exa=
mples-build.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1=
.0.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-=
build.patch b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-b=
uild.patch
> new file mode 100644
> index 0000000..d7dc6ae
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-build.p=
atch
> @@ -0,0 +1,9 @@
> +diff -uNr qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.=
pro qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
> +--- qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-examples.pro   =
 2013-07-02 03:10:27.000000000 -0400
> ++++ qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro    2013=
-09-29 21:31:10.761137146 -0400
> +@@ -2,4 +2,4 @@
> +=20
> + load(qt_parts)
> +=20
> +-SUBDIRS +=3D doc
> ++SUBDIRS +=3D doc examples
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bba=
ppend b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
> new file mode 100644
> index 0000000..7e41331
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI +=3D "file://examples-build.patch"
> +
> +PR_append =3D "-arago0"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

