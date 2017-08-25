Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 6A30F52961
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 22:11:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PMBSaZ020078
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 17:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503699088;
	bh=FYUEGAD5oLrVLAxHUmhCTjyjkCN4Bp7skVGouKgZ5Z8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QxCyxyEJeLBO8T1ycQeatXzuVhEgngNmDlBIFOpgItStKzCZYG46TgaaTIW/XVYGW
	+uBKQ/e2Iaua91ReFzCaHS/s8KmnKDLgt/j2qp3ggrr4ZYHopwo3XnktfLMOvlakWW
	iNs9ZeriuaTwfWR5fNv/AsfrFNgXOXyrAMGFQykc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PMBNm8000476
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 17:11:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 17:11:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 17:11:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PMBMol016238;
	Fri, 25 Aug 2017 17:11:22 -0500
Date: Fri, 25 Aug 2017 18:11:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170825221118.GE4311@edge>
References: <1503616027-50489-1-git-send-email-e-ruei1@ti.com>
	<20170824232137.GA4311@edge>
	<009C030982313E4589C6BC55FBF1E82A253A2116@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A253A2116@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Fri, 25 Aug 2017 22:11:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

See here for several examples of different components:

http://arago-project.org/pipermail/meta-arago/2017-July/thread.html

-- 
Denys


On Fri, Aug 25, 2017 at 09:53:25AM -0400, Ruei, Eric wrote:
> Hi, Denys:
> 
> Do you mean meta-arago component? 
> 
> For example:
> 
> [meta-arago] [matrix-gui-browser: PATCH v2] matrix_browser: update for QWebEngine from QWebKit
> 
> Best regards,
> 
> Eric
> 
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, August 24, 2017 7:22 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] matrix_browser: update for QWebEngine from QWebKit
> 
> Eric,
> 
> Please indicate the component this patch is meant for in square brackets.
> 
> 
> On Thu, Aug 24, 2017 at 07:07:07PM -0400, Eric Ruei wrote:
> > Replace QWebkit with QWebEngine because QWebkit is obslete.
> > 
> > 
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  MatrixWebView.cpp  | 5 +----
> >  MatrixWebView.h    | 5 ++---
> >  main.cpp           | 1 -
> >  matrix_browser.pro | 2 +-
> >  4 files changed, 4 insertions(+), 9 deletions(-)  mode change 100755 
> > => 100644 main.cpp
> > 
> > diff --git a/MatrixWebView.cpp b/MatrixWebView.cpp index 
> > 48459b7..72c4967 100644
> > --- a/MatrixWebView.cpp
> > +++ b/MatrixWebView.cpp
> > @@ -37,9 +37,6 @@
> >   *
> >  */
> >  
> > -#include <QtWidgets>
> > -#include <QtNetwork>
> > -#include <QtWebKitWidgets>
> >  #include "MatrixWebView.h"
> >  #include <sys/types.h>
> >  #include <sys/socket.h>
> > @@ -53,7 +50,7 @@ MatrixWebView::MatrixWebView(const QUrl& url)
> >      if (::socketpair(AF_UNIX, SOCK_STREAM, 0, sigtermFd))
> >         qFatal("Couldn't create TERM socketpair");
> >  
> > -    view = new QWebView(this);
> > +    view = new QWebEngineView(this);
> >      view->load(url);
> >      setCentralWidget(view);
> >  
> > diff --git a/MatrixWebView.h b/MatrixWebView.h index fec7249..b6d2cc5 
> > 100644
> > --- a/MatrixWebView.h
> > +++ b/MatrixWebView.h
> > @@ -40,8 +40,7 @@
> >  #define MATRIXWEBVIEW_H
> >  
> >  #include <QtWidgets>
> > -#include <QWebView>
> > -#include <QGraphicsWebView>
> > +#include <QWebEngineView>
> >  #include <QSocketNotifier>
> >  #include <QMainWindow>
> >  
> > @@ -62,7 +61,7 @@ public slots:
> >  private:
> >      static int sigtermFd[2];
> >      QSocketNotifier *snTerm;
> > -    QWebView *view;
> > +    QWebEngineView *view;
> >  };
> >  
> >  #endif
> > diff --git a/main.cpp b/main.cpp
> > old mode 100755
> > new mode 100644
> > index a1ccd80..dceece5
> > --- a/main.cpp
> > +++ b/main.cpp
> > @@ -36,7 +36,6 @@
> >   *
> >  */
> >  
> > -#include <QtWidgets>
> >  #include <iostream>
> >  #include <QApplication>
> >  #include "MatrixWebView.h"
> > diff --git a/matrix_browser.pro b/matrix_browser.pro index 
> > a6d8e1c..c6d9894 100755
> > --- a/matrix_browser.pro
> > +++ b/matrix_browser.pro
> > @@ -6,7 +6,7 @@ TEMPLATE = app
> >  TARGET = matrix_browser
> >  DEPENDPATH += .
> >  INCLUDEPATH += .
> > -QT       +=   webkit webkitwidgets
> > +QT       +=   webenginewidgets
> >  # Input
> >  SOURCES += main.cpp MatrixWebView.cpp  HEADERS = MatrixWebView.h
> > --
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

