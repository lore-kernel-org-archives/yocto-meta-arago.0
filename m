Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 78698529C8
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 13:53:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PDrQr5014331
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 08:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503669206;
	bh=sUAkc2E1Vf+iSJ8KjdBgifOj9W87/QjAyAkxsuk2UPA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=kffbz7mLKMl3XyKfUen94Cg9gyYAoRCYK/saCRQLHNBiDEFLsCrkPvPyv/0jcFdRn
	2VWqATr8h8EoaqGcK8q3rViTXGGYKo2Jwa0CF/JFeD9ok4uQKQC00vYP8ACMGUiOTP
	N83HGx3w7bFUuHKZAlj7ziup6Z5ZQNkKs+E6j8Y8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PDrQs1016686
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 08:53:26 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 25 Aug 2017 08:53:25 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] matrix_browser: update for QWebEngine
	from QWebKit
Thread-Index: AQHTHS++rNa1JuCr5U+O0mxnvBhAtKKVGA+A
Date: Fri, 25 Aug 2017 13:53:25 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A253A2116@DFLE09.ent.ti.com>
References: <1503616027-50489-1-git-send-email-e-ruei1@ti.com>
	<20170824232137.GA4311@edge>
In-Reply-To: <20170824232137.GA4311@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] matrix_browser: update for QWebEngine from QWebKit
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
X-List-Received-Date: Fri, 25 Aug 2017 13:53:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Do you mean meta-arago component?=20

For example:

[meta-arago] [matrix-gui-browser: PATCH v2] matrix_browser: update for QWeb=
Engine from QWebKit

Best regards,

Eric



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, August 24, 2017 7:22 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] matrix_browser: update for QWebEngine fro=
m QWebKit

Eric,

Please indicate the component this patch is meant for in square brackets.


On Thu, Aug 24, 2017 at 07:07:07PM -0400, Eric Ruei wrote:
> Replace QWebkit with QWebEngine because QWebkit is obslete.
>=20
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  MatrixWebView.cpp  | 5 +----
>  MatrixWebView.h    | 5 ++---
>  main.cpp           | 1 -
>  matrix_browser.pro | 2 +-
>  4 files changed, 4 insertions(+), 9 deletions(-)  mode change 100755=20
> =3D> 100644 main.cpp
>=20
> diff --git a/MatrixWebView.cpp b/MatrixWebView.cpp index=20
> 48459b7..72c4967 100644
> --- a/MatrixWebView.cpp
> +++ b/MatrixWebView.cpp
> @@ -37,9 +37,6 @@
>   *
>  */
> =20
> -#include <QtWidgets>
> -#include <QtNetwork>
> -#include <QtWebKitWidgets>
>  #include "MatrixWebView.h"
>  #include <sys/types.h>
>  #include <sys/socket.h>
> @@ -53,7 +50,7 @@ MatrixWebView::MatrixWebView(const QUrl& url)
>      if (::socketpair(AF_UNIX, SOCK_STREAM, 0, sigtermFd))
>         qFatal("Couldn't create TERM socketpair");
> =20
> -    view =3D new QWebView(this);
> +    view =3D new QWebEngineView(this);
>      view->load(url);
>      setCentralWidget(view);
> =20
> diff --git a/MatrixWebView.h b/MatrixWebView.h index fec7249..b6d2cc5=20
> 100644
> --- a/MatrixWebView.h
> +++ b/MatrixWebView.h
> @@ -40,8 +40,7 @@
>  #define MATRIXWEBVIEW_H
> =20
>  #include <QtWidgets>
> -#include <QWebView>
> -#include <QGraphicsWebView>
> +#include <QWebEngineView>
>  #include <QSocketNotifier>
>  #include <QMainWindow>
> =20
> @@ -62,7 +61,7 @@ public slots:
>  private:
>      static int sigtermFd[2];
>      QSocketNotifier *snTerm;
> -    QWebView *view;
> +    QWebEngineView *view;
>  };
> =20
>  #endif
> diff --git a/main.cpp b/main.cpp
> old mode 100755
> new mode 100644
> index a1ccd80..dceece5
> --- a/main.cpp
> +++ b/main.cpp
> @@ -36,7 +36,6 @@
>   *
>  */
> =20
> -#include <QtWidgets>
>  #include <iostream>
>  #include <QApplication>
>  #include "MatrixWebView.h"
> diff --git a/matrix_browser.pro b/matrix_browser.pro index=20
> a6d8e1c..c6d9894 100755
> --- a/matrix_browser.pro
> +++ b/matrix_browser.pro
> @@ -6,7 +6,7 @@ TEMPLATE =3D app
>  TARGET =3D matrix_browser
>  DEPENDPATH +=3D .
>  INCLUDEPATH +=3D .
> -QT       +=3D   webkit webkitwidgets
> +QT       +=3D   webenginewidgets
>  # Input
>  SOURCES +=3D main.cpp MatrixWebView.cpp  HEADERS =3D MatrixWebView.h
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

