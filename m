Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B1B0952975
	for <meta-arago@arago-project.org>;
	Mon,  5 Jun 2017 22:13:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55MDokU013885
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 17:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496700830;
	bh=V1FeAmdDYYeNxBBN1VNjd+TPKCrA0WaO+lUoPLuCIqE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JOjm6pAax79iXsQPBWJ1MTLuu5V2qzVs6LJMOK7Fhf3rfDs2d7c/t/mdxus0eUl+X
	E2UUceV0V4B8LxKnE4tDJk2Tq1wdcZRprT73IRldAeog+UP5KdCCm3gauBLkCeFdsE
	66EgsX0qPv/CXvWLq2Ei4EhIqYmSf2m5lMFDD4qg=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55MDoGg025267
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 17:13:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 17:13:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55MDoxF012556;
	Mon, 5 Jun 2017 17:13:50 -0500
Date: Mon, 5 Jun 2017 18:13:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170605221333.GU9756@edge>
References: <1496691014-53218-1-git-send-email-e-ruei1@ti.com>
	<20170605215928.GS9756@edge>
	<009C030982313E4589C6BC55FBF1E82A25386196@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A25386196@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH 1/2] qtwebbrowser-example: add QT web browser example
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
X-List-Received-Date: Mon, 05 Jun 2017 22:13:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 05, 2017 at 06:08:24PM -0400, Ruei, Eric wrote:
> Hi, Denys:
> 
> Please see my answers in-line below:
> 
> Best regards,
> 
> Eric
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, June 05, 2017 5:59 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/master][PATCH 1/2] qtwebbrowser-example: add QT web browser example
> 
> Eric,
> 
> Is it a standalone app? Why did you call it qtwebbrowser-example?
> [ER] Yes, it is a standalone QT app.
>          I call it qtwebbrowser-example to indicate that it is a QT demo example, not a QT module such as qtwebengine.
>          What name do you suggest?

It is always recommended to keep the original name of the source, which seems 
to be "qtwebbrowser":

http://code.qt.io/cgit/qt-apps/qtwebbrowser.git/


> Also, would it make sense to keep the main recipe in meta-arago-extra and 
> apply the fullscreen patch in meta-arago-distro? BTW, the patch is missing 
> Upstream-Status field.
> [ER] Yes, I can do that.
> 
> It seems you are copying the sources to the target as well - is it expected?
> [ER] Yes, we would like the source code to be available just like some other QT demo programs.

Well, I don't believe this is really an example, but rather a standalone 
application. Even though, it may be possible to package the source code - then 
you'd want to install the binary into bindir, package it into the main package 
and package sources into something like ${PN}-example or such.


> Also, when using "cp" to copy files, please use below or similar:
> cp -R --no-dereference --preserve=mode,links
> [ER] Yes, I will follow your reference.
> 
> --
> Denys
> 
> 
> On Mon, Jun 05, 2017 at 03:30:13PM -0400, Eric Ruei wrote:
> > - This is a touch-friendly web broswer based on qtwebengine and QML
> > 
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  ...0001-qtwebbrowser-disable-FullScreen-mode.patch | 28 ++++++++++++++++++
> >  .../recipes-qt/qt5/qtwebbrowser-example_1.0.bb     | 33 ++++++++++++++++++++++
> >  2 files changed, 61 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
> >  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
> > 
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
> > new file mode 100644
> > index 0000000..9cac96a
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
> > @@ -0,0 +1,28 @@
> > +From 268cf8dec9486fd875ab7fae241273e7b5b2a143 Mon Sep 17 00:00:00 2001
> > +From: Eric Ruei <e-ruei1@ti.com>
> > +Date: Fri, 2 Jun 2017 15:29:01 -0400
> > +Subject: [PATCH] qtwebbrowser: disable FullScreen mode
> > +
> > +We need to disable full-screen mode because there is no way to exit in that mode
> > +
> > +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > +---
> > + src/main.cpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/main.cpp b/src/main.cpp
> > +index 2181f15..5f146b6 100644
> > +--- a/src/main.cpp
> > ++++ b/src/main.cpp
> > +@@ -101,7 +101,7 @@ int main(int argc, char **argv)
> > +     if (view.size().isEmpty())
> > +         view.setGeometry(0, 0, 800, 600);
> > + #else
> > +-    view.showFullScreen();
> > ++    view.show();
> > + #endif
> > + 
> > +     app.exec();
> > +-- 
> > +1.9.1
> > +
> > diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
> > new file mode 100644
> > index 0000000..a063207
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
> > @@ -0,0 +1,33 @@
> > +SUMMARY = "Qt Touch-Friendly WebBroswer"
> > +HOMEPAGE = "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
> > +SECTION = "multimedia"
> > +LICENSE = "GPL-3.0 & GFDL-1.3"
> > +LIC_FILES_CHKSUM = " \
> > +    file://LICENSE.GPLv3;md5=a40e2bb02b1ac431f461afd03ff9d1d6 \
> > +    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> > +"
> > +DEPENDS += "qtwebengine"
> > +
> > +PR = "r1"
> > +
> > +BRANCH = "dev"
> > +SRCREV = "023733af5523a5ad84359926224fa106001215f4"
> > +
> > +SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH} \
> > +    file://0001-qtwebbrowser-disable-FullScreen-mode.patch \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit qt-provider
> > +
> > +# Install qtwebbrowser under /usr/share/qt5/examples/webengine
> > +do_install() {
> > +    install -d ${D}${datadir}/qt5/examples/webengine/webbrowser/src
> > +    install -m 0755 src/qtwebbrowser ${D}${datadir}/qt5/examples/webengine/webbrowser/qtwebbrowser
> > +    cp -r ${S}/* ${D}${datadir}/qt5/examples/webengine/webbrowser/.
> > +}
> > +
> > +FILES_${PN} +=  " \
> > +/usr/share/qt5/examples/webengine/webbrowser/* \
> > +"
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

