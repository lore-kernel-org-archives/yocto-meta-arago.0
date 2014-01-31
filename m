Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BB19B52A55
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 23:18:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VNIrk4010237
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:18:53 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNIrGH009086
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:18:53 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 17:18:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNIq5q000354;
	Fri, 31 Jan 2014 17:18:52 -0600
Date: Fri, 31 Jan 2014 18:18:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140131231851.GQ6814@edge>
References: <1391127157-6874-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015993A8B6@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C616729@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015993C6DE@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015993C6DE@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] ts-calibrate: Always export TSLIB_CALIBFILE	env variable
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
X-List-Received-Date: Fri, 31 Jan 2014 23:18:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2014 at 02:47:23PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Cooper Jr., Franklin
> >Sent: Thursday, January 30, 2014 5:01 PM
> >To: Maupin, Chase; meta-arago@arago-project.org
> >Subject: RE: [meta-arago] [PATCH] ts-calibrate: Always export
> >TSLIB_CALIBFILE env variable
> >
> >
> >
> >> -----Original Message-----
> >> From: Maupin, Chase
> >> Sent: Thursday, January 30, 2014 4:54 PM
> >> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> >> Subject: RE: [meta-arago] [PATCH] ts-calibrate: Always export
> >TSLIB_CALIBFILE
> >> env variable
> >>
> >> >-----Original Message-----
> >> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >> >Sent: Thursday, January 30, 2014 6:13 PM
> >> >To: meta-arago@arago-project.org
> >> >Cc: Cooper Jr., Franklin
> >> >Subject: [meta-arago] [PATCH] ts-calibrate: Always export
> >> >TSLIB_CALIBFILE env variable
> >> >
> >> >* Previously TSLIB_CALIBFILE env variable was only being
> >exported if
> >> >the mmc
> >> >  partition was mounted.
> >> >* Move the export statement outside of the if statement to
> >insure that
> >> >this
> >> >  important variable is always exported.
> >> >
> >> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> >---
> >> > .../recipes-graphics/tslib/ts-calibrate-init/init  |    3 ++-
> >> > .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
> >> > 2 files changed, 3 insertions(+), 2 deletions(-)
> >> >
> >> >diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-
> >> >calibrate-init/init b/meta-arago-extras/recipes-
> >graphics/tslib/ts-
> >> >calibrate-init/init
> >> >index 5d5c0aa..ab19da3 100644
> >> >--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
> >> >init/init
> >> >+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
> >> >init/init
> >> >@@ -31,9 +31,10 @@ mount | grep /media/mmcblk0p1 | grep vfat >
> >> >/dev/null 2>&1  if [ "$?" = "0" ]  then
> >> >     tsfile=/media/mmcblk0p1/pointercal
> >> >-    export TSLIB_CALIBFILE=$tsfile
> >> > fi
> >> >
> >> >+export TSLIB_CALIBFILE=$tsfile
> >>
> >> This is a nice to have but not strictly required right?  Because
> >the default is
> >> /etc/pointercal and you only need to reset this if you are
> >pointing to the SD card.
> >> Or am I missing something?
> >[Franklin] Your right if tslib by default assumes that file is
> >located at /etc/pointercal but at the time I didn't think that was
> >the case.
> >
> >After searching some more that is indeed the case:
> >http://manpages.ubuntu.com/manpages/raring/man5/ts.conf.5.html
> >
> >So we can take this patch or leave it.
> 
> I'm OK with it since it makes things clear, I was just checking in case 
> there was something I was missing.

Franklin, after what we've discussed above and the optional nature of this 
patch, if you still really want this in, would mind updating the patch with 
the new /run/media location, which I'm about to push? If not, we can just drop 
it... Thanks.


> >> > if [ ! -f $tsfile ] ; then
> >> >     echo -n "Calibrating touchscreen (first time only)"
> >> >     ts_calibrate
> >> >diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-
> >> >calibrate-init_1.0.bb b/meta-arago-extras/recipes-
> >> >graphics/tslib/ts-calibrate-init_1.0.bb
> >> >index dde5c42..0915941 100644
> >> >--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
> >> >init_1.0.bb
> >> >+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
> >> >init_1.0.bb
> >> >@@ -6,7 +6,7 @@ RDEPENDS_${PN} += "tslib"
> >> > LICENSE = "GPLv2"
> >> > LIC_FILES_CHKSUM =
> >>
> >>"file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988af
> >d
> >> >cc6c60"
> >> >
> >> >-PR = "r2"
> >> >+PR = "r3"
> >> >
> >> > S = "${WORKDIR}"
> >> >
> >> >--
> >> >1.7.0.4
> >> >
> >> >_______________________________________________
> >> >meta-arago mailing list
> >> >meta-arago@arago-project.org
> >> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

