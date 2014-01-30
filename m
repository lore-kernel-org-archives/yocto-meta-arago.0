Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AA09D52A55
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:36:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMaUIN018716
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:36:30 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMaUWI027694
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:36:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 16:36:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMaUiu010978;
	Thu, 30 Jan 2014 16:36:30 -0600
Date: Thu, 30 Jan 2014 17:36:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140130223629.GH6814@edge>
References: <1391125952-5569-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6165AF@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6165AF@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Update sd card partition mount location
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
X-List-Received-Date: Thu, 30 Jan 2014 22:36:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Correct, give me some time - I was debugging Dan's issue :) Will send the 
patch tonight.

-- 
Denys

On Thu, Jan 30, 2014 at 10:28:24PM +0000, Cooper Jr., Franklin wrote:
> Another patch should be sent soon that is tweaking mount.sh that this patch 
> depends on.
> 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Thursday, January 30, 2014 5:53 PM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [PATCH] Update sd card partition mount location
> > 
> > * The location where the mmc partitions will be mounted has changed from
> > /media/
> >    to /run/media/ (/var/run/media).
> > * Update the various scripts that care about the location of the mmc partitions
> >   that are mounted in /media.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-tisdk/parse-ip/parse-ip.bb             |    2 +-
> >  .../recipes-tisdk/parse-ip/parse-ip/init           |    4 ++--
> >  .../recipes-graphics/tslib/ts-calibrate-init/init  |    4 ++--
> >  .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb b/meta-arago-
> > distro/recipes-tisdk/parse-ip/parse-ip.bb
> > index cf3ad89..f20db31 100644
> > --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip.bb
> > @@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> >  SRC_URI = "file://init"
> > 
> > -PR = "r1"
> > +PR = "r2"
> > 
> >  S = "${WORKDIR}"
> > 
> > diff --git a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init b/meta-arago-
> > distro/recipes-tisdk/parse-ip/parse-ip/init
> > index 0020ea2..4050efb 100644
> > --- a/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> > +++ b/meta-arago-distro/recipes-tisdk/parse-ip/parse-ip/init
> > @@ -32,9 +32,9 @@
> > 
> >  case "$1" in
> >      start )
> > -        if [ -e /media/mmcblk0p1 ]
> > +        if [ -e /run/media/mmcblk0p1 ]
> >          then
> > -            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk
> > '{print $1}'` > /media/mmcblk0p1/.ipaddr
> > +            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk
> > '{print $1}'` > /run/media/mmcblk0p1/.ipaddr
> >              sync
> >  	    sync
> >  	fi
> > diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-
> > arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> > index ab19da3..db5c278 100644
> > --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> > +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
> > @@ -27,10 +27,10 @@ fi
> > 
> >  #TODO how can we find the SD card and not eMMC?  can we look for a "boot"
> >  # LABEL?
> > -mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
> > +mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
> >  if [ "$?" = "0" ]
> >  then
> > -    tsfile=/media/mmcblk0p1/pointercal
> > +    tsfile=/run/media/mmcblk0p1/pointercal
> >  fi
> > 
> >  export TSLIB_CALIBFILE=$tsfile
> > diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > index 0915941..747a9ef 100644
> > --- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > @@ -6,7 +6,7 @@ RDEPENDS_${PN} += "tslib"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM =
> > "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60
> > "
> > 
> > -PR = "r3"
> > +PR = "r4"
> > 
> >  S = "${WORKDIR}"
> > 
> > --
> > 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

