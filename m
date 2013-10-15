Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7C6715299B
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 15:46:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FFkWTh031591
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 10:46:33 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFkWbb006647
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 10:46:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 15 Oct 2013 10:46:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FFkWR3025676;
	Tue, 15 Oct 2013 10:46:32 -0500
Date: Tue, 15 Oct 2013 11:46:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131015154631.GC25798@edge>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<1381807317-3759-3-git-send-email-denis@denix.org>
	<20131015032654.GB25798@edge>
	<7D46E86EC0A8354091174257B2FED101597B1D50@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101597B1D92@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597B1D92@DLEE11.ent.ti.com>
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
X-List-Received-Date: Tue, 15 Oct 2013 15:46:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 15, 2013 at 11:43:14AM -0400, Maupin, Chase wrote:
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Maupin, Chase
> >Sent: Tuesday, October 15, 2013 10:42 AM
> >To: Dmytriyenko, Denys; meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to
> >disable eglfs/gles for now
> >
> >
> >>-----Original Message-----
> >>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >>bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> >>Sent: Monday, October 14, 2013 10:27 PM
> >>To: meta-arago@arago-project.org
> >>Subject: Re: [meta-arago] [PATCH 3/5] qtbase: update bbappend to
> >>disable eglfs/gles for now
> >>
> >>On Mon, Oct 14, 2013 at 11:21:55PM -0400, Denys Dmytriyenko
> >wrote:
> >>> From: Denys Dmytriyenko <denys@ti.com>
> >>>
> >>> Until Graphics SDK gets updated to work with 3.12 kernel.
> >>>
> >>> Note: this effectively disables QtWebKit-based apps like
> >matrix-
> >>browser, as
> >>> that depends on QtDeclarative and hence QtQuick, which requires
> >>GLES.
> >
> >Hold on.  So QtWebKit won't work without GLES?  If so then we
> >still have a problem with Qt5 support by default since not all
> >devices have an SGX right?
> 
> Or was this dependency always there?

Right, that's what we've been discussing with Prabu. Only plain QtWidgets can 
work w/o any GL now. QtQuick/QtDeclarative is where GL dependency comes from.

Also, in future versions of Qt5 they are moving away from WebKit to Chromium 
as a web renderer, so it will bring a whole new level of pain...


> >>BTW, I'll be adding conditional setting of this Qt5 PACKAGECONFIG
> >>in the
> >>global distro config based on "sgx" machine flag...
> >>
> >>
> >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>> ---
> >>>  meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-arago-distro/recipes-
> >>qt/qt5/qtbase_5.1.1.bbappend b/meta-arago-distro/recipes-
> >>qt/qt5/qtbase_5.1.1.bbappend
> >>> index eaf1433..d35a948 100644
> >>> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> >>> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.1.1.bbappend
> >>> @@ -1,6 +1,6 @@
> >>>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>>
> >>> -PACKAGECONFIG_GL = "gles2 icu linuxfb"
> >>> +PACKAGECONFIG_GL = "icu linuxfb"
> >>>
> >>>  SRC_URI += " \
> >>>  	file://0001-qeglfswindow.cpp.patch \
> >>> --
> >>> 1.8.3.2
> >>>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

