Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9B07852981
	for <meta-arago@arago-project.org>;
	Wed, 27 Aug 2014 23:57:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7RNvPdX018380;
	Wed, 27 Aug 2014 18:57:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7RNvP4s026213;
	Wed, 27 Aug 2014 18:57:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 18:57:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7RNvPnv031894;
	Wed, 27 Aug 2014 18:57:25 -0500
Date: Wed, 27 Aug 2014 19:57:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140827235724.GA18620@edge>
References: <1409173360-3221-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C71101D@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C71101D@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] cryptodev-module: fix autoloading issue with	dashed module name
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
X-List-Received-Date: Wed, 27 Aug 2014 23:57:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 27, 2014 at 09:42:34PM +0000, Cooper Jr., Franklin wrote:
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
> I never noticed that you could use "module_autoload". A lot better than the 
> approach I was thinking of :)

Well, two things to keep in mind with this:

1. There seems to be a bug with modules having a dash in the name when it's 
used in the left side of the assignment, i.e. the variable name.
2. The syntax has completely changed in master, so Daisy is the last place 
where it would work as is.

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Wednesday, August 27, 2014 4:03 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] cryptodev-module: fix autoloading issue with
> > dashed module name
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-kernel/cryptodev/cryptodev-module_1.6.bbappend            | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> > module_1.6.bbappend b/meta-arago-distro/recipes-
> > kernel/cryptodev/cryptodev-module_1.6.bbappend
> > index 00d7919..7be7536 100644
> > --- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> > module_1.6.bbappend
> > +++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-
> > module_1.6.bbappend
> > @@ -1,6 +1,6 @@
> > -PR_append = "-arago1"
> > +PR_append = "-arago2"
> > 
> > -module_autoload_cryptodev-module = "cryptodev-module"
> > +module_autoload_cryptodev = "cryptodev-module"
> > 
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > 
> > --
> > 2.0.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

