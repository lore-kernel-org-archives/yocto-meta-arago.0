Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 38D9452A5D
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 16:23:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29GMr4E022658
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 10:22:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489076573;
	bh=acLxvVwneMFlU27jjk8mv2tsYUrbw1PwKrInRchQd1s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aMyjtwVEBVewTu52kxjuzbBOD5JxRxdOnZB/Ph6u7Bd/iR+coW6V+hYOgt788m8/3
	3j5aDXWo64hXRbAXZXX9Zlo14ABjlGqT4YF1846u8M3EqRyxrmaZUFdCz4fvWu313W
	oprm36XA7et/iFu0A9JhRxdDWYXYP0cZ2g/cQkbg=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29GMm4O025551
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 10:22:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 10:22:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29GMlbc007460;
	Thu, 9 Mar 2017 10:22:47 -0600
Date: Thu, 9 Mar 2017 11:22:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>
Message-ID: <20170309162246.GE578@edge>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>
	<20170308143621.GM23302@edge>
	<05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
	<20170308211720.GB31499@edge>
	<009C030982313E4589C6BC55FBF1E82A25350895@DFLE09.ent.ti.com>
	<05CF4794C98B244ABDC620C109037622C03ECB39@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <05CF4794C98B244ABDC620C109037622C03ECB39@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Thu, 09 Mar 2017 16:23:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I can go either way. But we need to clean this up and keep on maintaining it 
in the future. For now, the most urgent matter is to fix Weston startup 
issues.

-- 
Denys


On Thu, Mar 09, 2017 at 05:29:09AM -0500, Balagopalakrishnan, Anand wrote:
> Hi Eric,
> 
> I would prefer a recipe update to address a specific issue/feature rather 
> than taking in all patches at once. This will help in better traceability 
> when we move to next Yocto version. For example, when we move to a later 
> Weston version, few patches may not be relevant. If we separate each feature 
> into a separate recipe commit, rebasing becomes easier.
> 
> Ideally, we should have a morty patch for each patch on Krogoth. In specific 
> cases, we may want to squash. Hence, we should logically segregate the 
> patches to be applied and have specific recipe updates targeting each of 
> them. We also want to change the name of this patch file removing 1.9.0 from 
> the file name.
> 
> Can you rebase this change on top of my v2 patch? We will need similar 
> updates for other patches as well - let's plan for respective patch owners 
> take care of that.
> 
> On a related note, just like kernel commits, each patch owner should be 
> tracking recipe commits as well when moving from one LTS to another. This 
> got missed out this time.
> 
> Regards,
> Anand
> 
> -----Original Message-----
> From: Ruei, Eric 
> Sent: Thursday, March 9, 2017 3:10 AM
> To: Dmytriyenko, Denys
> Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
> 
> Hi, Denys:
> 
> Anand's patch will fix one problem and we shall need the following 
> additional patch to get Weston up and running.
> 
> 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable, resolve the EGL config problem (LCPD-9399)
> 
> Best regards,
> 
> Eric
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 08, 2017 4:17 PM
> To: Ruei, Eric
> Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
> 
> Eric,
> 
> Thanks for reviewing all the patches and identifying their status!
> 
> I can probably merge Anand's patch right away, which would supposed to 
> unblock further Weston testing. And that will give you a bit more time to 
> prepare a followup patch with the rest of them, in case there are any 
> updates needed.
> 
> Please let me know otherwise. Thanks.
> 
> --
> Denys
> 
> 
> On Wed, Mar 08, 2017 at 03:56:13PM -0500, Ruei, Eric wrote:
> > Hi, Anand and Denys:
> > 
> > I have confirmed that all other 7 Weston patches are still applicable.
> > 
> > 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch : still 
> > applicable, need a minor update
> > 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable, 
> > resolve the EGL config problem (LCPD-9399)
> > 0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch: still 
> > applicable
> > 0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still applicable
> > 0001-udev-seat-restrict-udev-enumeration-to-card0.patch: still applicable, it is what Anand just re-enabled.
> > 0001-Add-soc-performance-monitor-utilites.patch : still applicable, TI-specific changes
> > 0001-compositor-drm-support-RGB565-with-pixman-renderer.patch: still applicable, Tomi has submitted this one  a while ago, but it is not                                                                                                                                      available at Weston 1.11.0.
> > 0001-compositor-drm-fix-hotplug-weston-termination-proble.patch: still 
> > applicable, good enough as long as the connecter id/crtc id <64
> > 
> > I did submit this patch to trigger discussions, but none has provided 
> > a better solution.
> > 
> > Should I submit another patch with all other patches after Anand's 
> > patch is applied? Or should we replace Anand's patch with this one 
> > which covers all Weston 1.9 patches?
> > 
> > Best regards,
> > 
> > Eric
> >                                                                                                                                           
> > 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org 
> > [mailto:meta-arago-bounces@arago-project.org] On Behalf Of 
> > Balagopalakrishnan, Anand
> > Sent: Wednesday, March 08, 2017 12:22 PM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev 
> > enumeration to /dev/dri/card0
> > 
> > Denys,
> > 
> > We need to review whether the other patches are required or not. This action will happen over the next 1-2 weeks by Karthik and Eric. Till that time, I would like to keep the patches in. 
> > 
> > In the meantime, the commented out lines can be removed from the bbappend file itself. If a patch is deemed to be required, we can submit a new recipe update later for SRC_URL. Is this fine? If so, I can submit v2 with this proposal.
> > 
> > Regards,
> > Anand
> > ________________________________________
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, March 08, 2017 8:06 PM
> > To: Balagopalakrishnan, Anand
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev 
> > enumeration to /dev/dri/card0
> > 
> > On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrote:
> > > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > > ---
> > >  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-----------
> > >  1 file changed, 12 insertions(+), 11 deletions(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > > b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > > index d0691ad..36585bd 100644
> > > ---
> > > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > > +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbapp
> > > +++ en
> > > +++ d
> > > @@ -2,19 +2,20 @@
> > >  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
> > >  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
> > >
> > > -PR_append = ".arago16"
> > > +PR_append = ".arago17"
> > >
> > >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > >
> > >  RDEPENDS_${PN} += "weston-conf"
> > >
> > > -#SRC_URI += " \
> > > -#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
> > > -#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
> > > -#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
> > > -#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
> > > -#    file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
> > > -#    file://0001-Add-soc-performance-monitor-utilites.patch \
> > > -#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
> > > -#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
> > > -#"
> > > +
> > > +SRC_URI += " \
> > > +     file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch 
> > > +\ "
> > > +#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
> > > +#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
> > > +#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
> > > +#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
> > > +#    file://0001-Add-soc-performance-monitor-utilites.patch
> > > +#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
> > > +#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
> > 
> > Anand,
> > 
> > What about the rest of the commented out patches? Do we still need them?
> > 
> > If we need them, will you be looking at up-porting them?
> > If we don't need them, can you please remove the corresponding comments from the recipe.
> > 
> > Thanks.
> > 
> > --
> > Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

