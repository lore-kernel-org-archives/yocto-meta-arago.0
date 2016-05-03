Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D2B57529A4
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 04:17:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u434HHFO031283
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 23:17:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u434HHke020663
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 23:17:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 May 2016 23:17:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u434HHdK005947;
	Mon, 2 May 2016 23:17:17 -0500
Date: Tue, 3 May 2016 00:17:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20160503041701.GS1546@edge>
References: <20160127210049.58111529C9@arago-project.org>
	<20160428194623.GA17066@denix.org> <20160429235943.GF1546@edge>
MIME-Version: 1.0
In-Reply-To: <20160429235943.GF1546@edge>
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
X-List-Received-Date: Tue, 03 May 2016 04:17:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hongmei, Eric, Jake,

Ping again. I will be reverting this if not clarified. Thanks.

-- 
Denys


On Fri, Apr 29, 2016 at 07:59:44PM -0400, Denys Dmytriyenko wrote:
> Ping.
> 
> 
> On Thu, Apr 28, 2016 at 03:46:23PM -0400, Denys Dmytriyenko wrote:
> > So, I was looking into Weston init script lately for another reason and 
> > noticed there was a hole in its logic. From the logs I came to this commit 
> > made few months ago. Particularly, I'm interested why the first part of the 
> > change was made:
> > 
> > * Bypass restarting Weston if SD card has calibration file already
> > 
> > This seems incorrect, because if calibration file is only available on SD 
> > card, it has to be copied to /etc and in order to take immediate effect, udev 
> > has to be reloaded and weston has to be restarted, which how it used to be 
> > before. Why is this now bypassed? Please provide details of what this change 
> > is meant to address and how is it supposed to work. Thanks.
> > 
> > -- 
> > Denys
> > 
> > 
> > On Wed, Jan 27, 2016 at 09:00:49PM +0000, Arago Project git wrote:
> > > Module: meta-arago
> > > Branch: master
> > > Commit: b057be5db06e0f2e0ebb649841e64f60a997c2c1
> > > URL:    http://arago-project.org/git/meta-arago.git?a=commit;h=b057be5db06e0f2e0ebb649841e64f60a997c2c1
> > > 
> > > Author: Gou, Hongmei <h-gou@ti.com>
> > > Date:   Thu Jan 28 01:48:05 2016 +0000
> > > 
> > > weston-init: update init scripts related to restarting Weston
> > > 
> > > * Bypass restarting Weston if SD card has calibration file already
> > > 
> > > * Increase the sleep time before Weston is restarted
> > >   It takes some time to complete the Weston termination procedure.
> > >   If Weston is restarted before the previous instance is fully
> > >   terminated, the restart of Weston will fail.
> > > 
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > ---
> > > 
> > >  .../recipes-graphics/wayland/weston-init.bbappend  |    2 +-
> > >  .../recipes-graphics/wayland/weston-init/init      |    7 ++++---
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > > index d9e15b6..4b5ad93 100644
> > > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > > @@ -1,4 +1,4 @@
> > > -PR_append = "-arago4"
> > > +PR_append = "-arago5"
> > >  
> > >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > >  
> > > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > > index 2e2ae36..494584f 100644
> > > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> > > @@ -63,8 +63,9 @@ case "$1" in
> > >          # Check if SD card has a calibration rules file
> > >          SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
> > >          if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
> > > -            # Copy it over to udev location
> > > +            # Copy it over to udev location, and done
> > >              cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
> > > +            exit 0
> > >          else
> > >              # Run a calibration app and save output to udev rules
> > >              echo    "Calibrating touchscreen (first time only)"
> > > @@ -85,7 +86,7 @@ case "$1" in
> > >          udevadm control --reload
> > >          udevadm trigger
> > >          killproc weston
> > > -        sleep 1
> > > +        sleep 2
> > >          openvt -c 4 -f runWeston
> > >    ;;
> > >  
> > > @@ -96,7 +97,7 @@ case "$1" in
> > >  
> > >    restart)
> > >  	$0 stop
> > > -        sleep 1
> > > +        sleep 2
> > >          $0 start
> > >    ;;
> > >  
> > > 
> > > _______________________________________________
> > > arago-commits mailing list
> > > arago-commits@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> > > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

