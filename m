Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D694552A95
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 20:21:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s24KLeoI030893
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:21:41 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24KLe8t028643
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 14:21:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 14:21:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s24KLetg019357;
	Tue, 4 Mar 2014 14:21:40 -0600
Date: Tue, 4 Mar 2014 15:21:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140304202140.GO22125@edge>
References: <1393959849-32619-1-git-send-email-fcooper@ti.com>
	<20140304191348.GM22125@edge>
	<8F29D6B095ED194EA1980491A5E029710C65D344@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C65D344@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dylan|ti2013.12.x][PATCH] Revert "arago-prefs: set PREFERRED VERSION of libdrm to latest"
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
X-List-Received-Date: Tue, 04 Mar 2014 20:21:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 04, 2014 at 02:59:25PM -0500, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, March 04, 2014 1:14 PM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [dylan|ti2013.12.x][PATCH] Revert "arago-prefs: set
> > PREFERRED VERSION of libdrm to latest"
> > 
> > Have you seen this:
> > http://arago-project.org/pipermail/meta-arago/2014-February/003143.html

> [Franklin] Yes. Chase responded that his original patch was meant for dora 
> and up.
> 
> My patch is only for Dylan and ti2013.12.x.

Just making sure you noticed it was a warning, not an error...


> > On Tue, Mar 04, 2014 at 01:04:09PM -0600, Franklin S. Cooper Jr wrote:
> > > This reverts commit 8303758bc661f660a39b75e0ff7aa2a0ca6fea56.
> > >
> > > libdrm v2.4.46 doesn't exist for the dylan (ti2013.12.x) maintenance
> > > branch
> > > ---
> > >  .../conf/distro/include/arago-prefs.inc            |    3 ---
> > >  1 files changed, 0 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > > b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > > index 5f7b023..d5176fd 100644
> > > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > > @@ -4,9 +4,6 @@ include conf/distro/include/qt5-versions.inc
> > >  # Use the latest version of ltp-ddt for kernel versions 3.8+
> > > PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
> > >
> > > -# Use the latest version of libdrm
> > > -PREFERRED_VERSION_libdrm = "2.4.46"
> > > -
> > >  PREFERRED_PROVIDER_virtual/gettext = "gettext"
> > >
> > >  ARAGO_QT_PROVIDER =
> > "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-
> > embedded',d)}"
> > > --
> > > 1.7.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

