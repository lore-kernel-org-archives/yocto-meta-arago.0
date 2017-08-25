Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2B90152961
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 22:09:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PM9M4f003878
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 17:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503698962;
	bh=CGUd4rM97onZFozhtUg9tC+6cFbQ+duQqtlCrFy1G9I=;
	h=From:To:CC:Subject:Date:References;
	b=kNv67kBOW0qXi9pru3kZMjBQFhYzDZ6mOawv4i753oGFz4BunJ6GdbmcfBMrY3OJf
	lg5uJ2bTIJW+WPi5HsLtvn4l1ir9cwU4viV2q5bqBwXIeZFYSb7G9dXq/f5pw0fQnz
	8DatM5BQRQ9FzCbuECfmfsgR3BKxBVRcaODhj/WQ=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PM9MfT028564
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 17:09:22 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 25 Aug 2017 17:09:21 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] matrix_browser: update for QWebEngine
	from QWebKit
Thread-Index: AQHTHS++rNa1JuCr5U+O0mxnvBhAtKKVGA+AgACK2YA=
Date: Fri, 25 Aug 2017 22:09:21 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A253A24D5@DFLE09.ent.ti.com>
References: <1503616027-50489-1-git-send-email-e-ruei1@ti.com>
	<20170824232137.GA4311@edge> 
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
X-List-Received-Date: Fri, 25 Aug 2017 22:09:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Do you require v2 as shown below?

Hongmei: can you merge the change if there are no other comments?

Best regards,

Eric


-----Original Message-----
From: Ruei, Eric=20
Sent: Friday, August 25, 2017 9:53 AM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] matrix_browser: update for QWebEngine fro=
m QWebKit

Hi, Denys:

Do you mean meta-arago component?=20

For example:

[meta-arago] [matrix-gui-browser: PATCH v2] matrix_browser: update for QWeb=
Engine from QWebKit

Best regards,

Eric



-----Original Message-----
From: Dmytriyenko, Denys
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
> diff --git a/MatrixWebView.cpp b/MatrixWebView.cpp index
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
> diff --git a/MatrixWebView.h b/MatrixWebView.h index fec7249..b6d2cc5
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
> diff --git a/matrix_browser.pro b/matrix_browser.pro index
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

