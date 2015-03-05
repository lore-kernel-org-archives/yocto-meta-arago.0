Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 613D85297F
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 19:16:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25JGbMT031059
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:16:37 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25JGa2S005476
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:16:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 13:16:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25JGagV006874;
	Thu, 5 Mar 2015 13:16:36 -0600
Date: Thu, 5 Mar 2015 14:16:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150305191635.GX6052@edge>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
	<20150305185809.GV6052@edge>
	<4B26FB5A64EBA14C87266869E037F958141056AF@DFLE09.ent.ti.com>
	<DC215853-3726-4509-A47D-6EA9F3F1D771@ti.com>
MIME-Version: 1.0
In-Reply-To: <DC215853-3726-4509-A47D-6EA9F3F1D771@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 05 Mar 2015 19:16:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 05, 2015 at 02:07:21PM -0500, Cooper Jr., Franklin wrote:
> 
> 
> 
> > On Mar 5, 2015, at 1:00 PM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> > 
> > This is needed to the dual-camera-demo, though I'm not sure why exactly. 
> > 
> > Franklin can you comment on this?

> It's not needed for the dual camera demo it is needed since we don't have a 
> version of the Graphics SDK for 335x and am437x that works with 
> Wayland/Qtwayland.
> 
> Sometime "this year" we will have a graphics package for all devices that 
> supports Wayland.

Ok, that makes sense. Although there was some experimentation with WSEGL 
plugin, but that wasn't very clean and incomplete...

So, if this is a temporary workaround, I'd like to be less invasive, if 
possible. From a higher level configuration, do you plan to stick to Qt5, but 
switch it to eglfs backend, instead of wayland? When GFX for AM3/4 catches up 
and wayland is turned back on, will eglfs stay as an option?

-- 
Denys


> > -----Original Message-----
> > From: Dmytriyenko, Denys 
> > Sent: Thursday, March 05, 2015 1:58 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [RFC v2 0/4] Add WAYLAND_SUPPORT flag.
> > 
> >> On Thu, Mar 05, 2015 at 01:31:39PM -0500, Jacob Stiffler wrote:
> >> * This falg may be used to exclude wayland/weston from the file system.
> >> * QT platform will be set based on this value.
> >> * Add processor-sdk band to disable wayland for ti33x and ti43x.
> > 
> > So, what's the future of wayland in SDKs, then?
> > 
> > 
> >> Jacob Stiffler (4):
> >>  arago-prefs: Add WAYLAND_SUPPORT flag.
> >>  packagegroups: Implement WAYLAND_SUPPORT flag.
> >>  qtbase: Set qpa based in WAYLAND_SUPPORT flag.
> >>  branding-processor-sdk: Add processor-sdk brand.
> >> 
> >> .../conf/distro/include/arago-prefs.inc            |    2 ++
> >> .../conf/distro/include/branding-processor-sdk.inc |   34 ++++++++++++++++++++
> >> .../packagegroups/packagegroup-arago-qte.bb        |    4 +--
> >> .../packagegroup-arago-tisdk-graphics.bb           |    4 +--
> >> .../packagegroups/packagegroup-arago-tisdk-qte.bb  |    4 +--
> >> .../packagegroups/packagegroup-linaro-tc-test.bb   |    5 +--
> >> meta-arago-distro/recipes-qt/qt5/qtbase/qt_env.sh  |    1 -
> >> .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++--
> >> 8 files changed, 51 insertions(+), 12 deletions(-)  create mode 
> >> 100644 
> >> meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> >> 
> >> --
> >> 1.7.9.5
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

