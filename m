Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 528EF5299D
	for <meta-arago@arago-project.org>;
	Thu, 21 Nov 2013 17:47:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALHlhKj008926
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 11:47:43 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALHlhQC004380
	for <meta-arago@arago-project.org>; Thu, 21 Nov 2013 11:47:43 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 21 Nov 2013 11:47:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALHlh5x028834;
	Thu, 21 Nov 2013 11:47:43 -0600
Date: Thu, 21 Nov 2013 12:47:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20131121174742.GQ29952@edge>
References: <1384711613-29582-1-git-send-email-fcooper@ti.com>
	<20131118183244.GH19813@edge>
	<8F29D6B095ED194EA1980491A5E029710C5A7B41@DFLE08.ent.ti.com>
	<20131118212014.GL19813@edge> <20131121044356.GH29952@edge>
MIME-Version: 1.0
In-Reply-To: <20131121044356.GH29952@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
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
X-List-Received-Date: Thu, 21 Nov 2013 17:47:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 20, 2013 at 11:43:56PM -0500, Denys Dmytriyenko wrote:
> On Mon, Nov 18, 2013 at 04:20:14PM -0500, Denys Dmytriyenko wrote:
> > On Mon, Nov 18, 2013 at 01:41:00PM -0500, Cooper Jr., Franklin wrote:
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Monday, November 18, 2013 12:33 PM
> > > > To: Cooper Jr., Franklin
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago-qte: Fix location for
> > > > host Qt tools
> > > > 
> > > > On Sun, Nov 17, 2013 at 12:06:53PM -0600, Franklin S. Cooper Jr wrote:
> > > > > * By default Qt5 is looking at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin
> > > > instead
> > > > >   of the proper location i686-arago-linux/usr/bin/qt5.
> > > > > * Update qmake.conf to insure qmake looks at the proper location for host
> > > > >   binaries.
> > > > 
> > > > What is this needed for exactly? I hadn't had any issues using qmake and
> > > > command-line build with the v3 of the patches. Is it specific to QtCreator?
> > 
> > > [Franklin] Building via command line. Some reason qmake thinks moc is 
> > > located at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin which resulted in a file 
> > > not found error. Im not sure when moc is needed but when I tried to build 
> > > the thermostat demo from src I ran into this issue.
> > 
> > I'm looking into this now and playing with the idea of packaging qt.conf that 
> > gets created during the nativesdk build. Although that one maybe an overkill. 
> > If that doesn't work, I'll push an updated version of this patch...
> 
> Sorry, took me a bit longer due to some extra testing, but it appears I can't 
> re-use the generated qt.conf in this Canadian cross-compilation when 3 archs 
> are involved - config file for A->B cross is different from B->C. I just sent 
> the updated patch that sets couple host variables in qt.conf inside SDK, that 
> should cover most of other cases.

Franklin,

Have you been able to do any tests with the updated patch I sent last night? 
If it works for you, I'd like to push it along with the initial Qt5 SDK 
patches to meta-arago/master.

-- 
Denys


> > > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > > ---
> > > > >  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    8 +++++++-
> > > > >  1 files changed, 7 insertions(+), 1 deletions(-)
> > > > >
> > > > > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > > b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > > > index e3bf80f..6220578 100644
> > > > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> > > > > @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
> > > > >
> > > > >  require meta-toolchain-arago.bb
> > > > >
> > > > > -PR = "r16"
> > > > > +PR = "r17"
> > > > >
> > > > >  # There could be qt5, qt4e and qt4x11 providers, but we don't support
> > > > qt4x11 for now
> > > > >  QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia',
> > > > d)}"
> > > > > @@ -46,6 +46,12 @@ toolchain_create_sdk_env_script_append() {
> > > > >  	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
> > > > >  	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
> > > > >
> > > > > +	if [ "${QT_PROVIDER}" = "qt5" ]
> > > > > +	then
> > > > > +		echo 'HostBinaries = ../${SDK_SYS}/usr/bin/qt5' >> $qt_conf
> > > > > +	fi
> > > > > +
> > > > > +
> > > > >  	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
> > > > >  	# and QTCreator
> > > > >  	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf
> > > > .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
> > > > > --
> > > > > 1.7.0.4
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

