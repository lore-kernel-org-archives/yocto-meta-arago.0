Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B291E52972
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 16:10:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FGAJc2017767
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 11:10:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FGAJcd010144
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 11:10:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 15 Oct 2013 11:10:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FGAIFK016421;
	Tue, 15 Oct 2013 11:10:18 -0500
Date: Tue, 15 Oct 2013 12:10:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131015161018.GE25798@edge>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<1381807317-3759-3-git-send-email-denis@denix.org>
	<20131015032654.GB25798@edge>
	<7D46E86EC0A8354091174257B2FED101597B1D50@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101597B1D92@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C577071@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C577071@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/5] qtbase: update bbappend to disable eglfs/gles for now
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
X-List-Received-Date: Tue, 15 Oct 2013 16:10:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 15, 2013 at 11:47:39AM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Maupin, Chase
> > Sent: Tuesday, October 15, 2013 10:43 AM
> > To: Maupin, Chase; Dmytriyenko, Denys; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to disable
> > eglfs/gles for now
> > 
> > 
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Maupin, Chase
> > >Sent: Tuesday, October 15, 2013 10:42 AM
> > >To: Dmytriyenko, Denys; meta-arago@arago-project.org
> > >Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to
> > >disable eglfs/gles for now
> > >
> > >
> > >>-----Original Message-----
> > >>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > >>Sent: Monday, October 14, 2013 10:27 PM
> > >>To: meta-arago@arago-project.org
> > >>Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to
> > >>disable eglfs/gles for now
> > >>
> > >>On Mon, Oct 14, 2013 at 11:21:55PM -0400, Denys Dmytriyenko
> > >wrote:
> > >>> From: Denys Dmytriyenko <denys@ti.com>
> > >>>
> > >>> Until Graphics SDK gets updated to work with 3.12 kernel.
> > >>>
> > >>> Note: this effectively disables QtWebKit-based apps like
> > >matrix-
> > >>browser, as
> > >>> that depends on QtDeclarative and hence QtQuick, which requires
> > >>GLES.
> > >
> > >Hold on.  So QtWebKit won't work without GLES?  If so then we still
> > >have a problem with Qt5 support by default since not all devices have
> > >an SGX right?
> [Franklin] Agreed
> > 
> > Or was this dependency always there?
> [Franklin] No. Good example is AM18x.
> 
> I'm curious if there is a option to disable gles support for Webkit 2 or 
> after looking at this link 
> (http://qt-project.org/doc/qt-5.0/qtwebkitexamples/qtwebkitexamples-index.html) 
> if there is an option to use Webkit 1 which shouldn't have this dependency.

I don't think it can be built separately. QtWebKit handles both WebKit1 and 
WebKit2. But the problem comes not from QtWebKit, but rather from 
QtDeclarative/QtQuick and there's a bug report for that:

https://bugreports.qt-project.org/browse/QTBUG-32587


> > >>BTW, I'll be adding conditional setting of this Qt5 PACKAGECONFIG in
> > >>the global distro config based on "sgx" machine flag...
> > >>
> > >>
> > >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >>> ---
> > >>>  meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/meta-arago-distro/recipes-
> > >>qt/qt5/qtbase_5.1.1.bbappend b/meta-arago-distro/recipes-
> > >>qt/qt5/qtbase_5.1.1.bbappend
> > >>> index eaf1433..d35a948 100644
> > >>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> > >>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> > >>> @@ -1,6 +1,6 @@
> > >>>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > >>>
> > >>> -PACKAGECONFIG_GL = "gles2 icu linuxfb"
> > >>> +PACKAGECONFIG_GL = "icu linuxfb"
> > >>>
> > >>>  SRC_URI += " \
> > >>>  	file://0001-qeglfswindow.cpp.patch \
> > >>> --
> > >>> 1.8.3.2
> > >>>
> > >>_______________________________________________
> > >>meta-arago mailing list
> > >>meta-arago@arago-project.org
> > >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

