Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 38A6652AF8
	for <meta-arago@arago-project.org>;
	Sat, 30 Apr 2016 00:00:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3U000S0002035
	for <meta-arago@arago-project.org>; Fri, 29 Apr 2016 19:00:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3U000F1015500
	for <meta-arago@arago-project.org>; Fri, 29 Apr 2016 19:00:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Apr 2016 18:59:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3TNxx7O016663	for
	<meta-arago@arago-project.org>; Fri, 29 Apr 2016 18:59:59 -0500
Date: Fri, 29 Apr 2016 19:59:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20160429235943.GF1546@edge>
References: <20160127210049.58111529C9@arago-project.org>
	<20160428194623.GA17066@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160428194623.GA17066@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [arago-commits] Gou, Hongmei : weston-init: update init scripts related to restarting Weston
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
X-List-Received-Date: Sat, 30 Apr 2016 00:00:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping.


On Thu, Apr 28, 2016 at 03:46:23PM -0400, Denys Dmytriyenko wrote:
> So, I was looking into Weston init script lately for another reason and 
> noticed there was a hole in its logic. From the logs I came to this commit 
> made few months ago. Particularly, I'm interested why the first part of the 
> change was made:
> 
> * Bypass restarting Weston if SD card has calibration file already
> 
> This seems incorrect, because if calibration file is only available on SD 
> card, it has to be copied to /etc and in order to take immediate effect, udev 
> has to be reloaded and weston has to be restarted, which how it used to be 
> before. Why is this now bypassed? Please provide details of what this change 
> is meant to address and how is it supposed to work. Thanks.
> 
> -- 
> Denys
> 
> 
> On Wed, Jan 27, 2016 at 09:00:49PM +0000, Arago Project git wrote:
> > Module: meta-arago
> > Branch: master
> > Commit: b057be5db06e0f2e0ebb649841e64f60a997c2c1
> > URL:    http://arago-project.org/git/meta-arago.git?a=commit;h=b057be5db06e0f2e0ebb649841e64f60a997c2c1
> > 
> > Author: Gou, Hongmei <h-gou@ti.com>
> > Date:   Thu Jan 28 01:48:05 2016 +0000
> > 
> > weston-init: update init scripts related to restarting Weston
> > 
> > * Bypass restarting Weston if SD card has calibration file already
> > 
> > * Increase the sleep time before Weston is restarted
> >   It takes some time to complete the Weston termination procedure.
> >   If Weston is restarted before the previous instance is fully
> >   terminated, the restart of Weston will fail.
> > 
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> >  .../recipes-graphics/wayland/weston-init.bbappend  |    2 +-
> >  .../recipes-graphics/wayland/weston-init/init      |    7 ++++---
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > index d9e15b6..4b5ad93 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > @@ -1,4 +1,4 @@
> > -PR_append = "-arago4"
> > +PR_append = "-arago5"
> >  
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >  
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > index 2e2ae36..494584f 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > @@ -63,8 +63,9 @@ case "$1" in
> >          # Check if SD card has a calibration rules file
> >          SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
> >          if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
> > -            # Copy it over to udev location
> > +            # Copy it over to udev location, and done
> >              cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
> > +            exit 0
> >          else
> >              # Run a calibration app and save output to udev rules
> >              echo    "Calibrating touchscreen (first time only)"
> > @@ -85,7 +86,7 @@ case "$1" in
> >          udevadm control --reload
> >          udevadm trigger
> >          killproc weston
> > -        sleep 1
> > +        sleep 2
> >          openvt -c 4 -f runWeston
> >    ;;
> >  
> > @@ -96,7 +97,7 @@ case "$1" in
> >  
> >    restart)
> >  	$0 stop
> > -        sleep 1
> > +        sleep 2
> >          $0 start
> >    ;;
> >  
> > 
> > _______________________________________________
> > arago-commits mailing list
> > arago-commits@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

