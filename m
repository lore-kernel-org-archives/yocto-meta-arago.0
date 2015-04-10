Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D2A3352A77
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 18:37:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AIbXI7029042
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:37:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIbVZN017318
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:37:32 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Fri, 10 Apr 2015 13:37:31 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] matrix-gui-browser: Update SRCREV to fix
	compilation warnings.
Thread-Index: AQHQc7sbKdJ3WpUx70upEJhWglpHvp1G5kCA//+s4EA=
Date: Fri, 10 Apr 2015 18:37:31 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411E434@DFLE09.ent.ti.com>
References: <1428690056-22471-1-git-send-email-j-stiffler@ti.com>
	<20150410183415.GB9147@edge>
In-Reply-To: <20150410183415.GB9147@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] matrix-gui-browser: Update SRCREV to fix compilation warnings.
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
X-List-Received-Date: Fri, 10 Apr 2015 18:37:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I did not try to simply "dos2unix", but I manually recreated the patch.


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, April 10, 2015 2:34 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] matrix-gui-browser: Update SRCREV to fix =
compilation warnings.

On Fri, Apr 10, 2015 at 02:20:56PM -0400, Jacob Stiffler wrote:
> * Changes also includes removal of DOS line endings in sources.

Finally! \o/ :)
But, there's a small problem now - DOS newlines do not survive patching pro=
cess, so the below patch won't apply... I'll need to do it manually in git.=
=20
Is it just dos2unix qt5-gui-widgets-move.patch?


> * Thus update source file patch and license checksum.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../matrix-gui-browser/qt5-gui-widgets-move.patch  |   23 ++++++++++----=
------
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    6 ++---
>  2 files changed, 15 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5=
-gui-widgets-move.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-=
browser/qt5-gui-widgets-move.patch
> index e725004..20a98d9 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-wi=
dgets-move.patch
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-wi=
dgets-move.patch
> @@ -1,12 +1,13 @@
> -diff -uNr git-orig/main.cpp git/main.cpp
> ---- git-orig/main.cpp	2013-09-29 20:06:36.000000000 -0400
> -+++ git/main.cpp	2013-09-29 20:11:52.762449142 -0400
> +diff --git a/main.cpp b/main.cpp
> +index fe27aab..51f9550 100644
> +--- a/main.cpp
> ++++ b/main.cpp
>  @@ -36,7 +36,7 @@
> -  *
> - */
> -=20
> --#include <QtGui>
> -+#include <QtWidgets>
> - #include <QWebView>
> - #include <QGraphicsWebView>
> - #include <iostream>=20
> +  *
> + */
> +=20
> +-#include <QtGui>
> ++#include <QtWidgets>
> + #include <QWebView>
> + #include <QGraphicsWebView>
> + #include <iostream>=20
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0=
.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> index 775b7ce..33387ea 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Simple Qt web display using webkit"
>  HOMEPAGE =3D "https://gitorious.org/matrix-gui-v2/matrix_browser"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D8=
84b90f5bf0d711fe32c4f04b5276496"
> +LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D9;endline=3D37;md5=3D7=
5a9adc782a6df0d3a5419743e9a9f18"
>  SECTION =3D "multimedia"
> =20
>  inherit qt-provider
> @@ -11,9 +11,9 @@ RDEPENDS_${PN} +=3D "${QT_RDEPENDS_FONTS}"
> =20
>  DEPENDS +=3D "${QT_DEPENDS_WEBKIT}"
> =20
> -PR =3D "r9"
> +PR =3D "r10"
> =20
> -SRCREV =3D "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
> +SRCREV =3D "f68ab545a60ca446635f9db00d64569cef9c9091"
>  BRANCH ?=3D "master"
> =20
>  SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protoc=
ol=3Dhttp;branch=3D${BRANCH}"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

