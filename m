Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7CB66529F6
	for <meta-arago@arago-project.org>;
	Wed,  8 Mar 2017 21:17:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v28LHLhF007018
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 15:17:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489007841;
	bh=eIogOIyGidtaWAWt1eo5y8MrjNUa5OKaEkEYBS1fB44=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kBRdKNneAsGkarMXKCyyiCphM+qXBJNmTFj1pM7twLvymaREtP+gJ3MfcmUuW+PUn
	lsqWWUafwLFiDFsP/ZUWslWsoTd/MzCSLSrbOijoi4hsQ2qIxPYmHy1GYvlGfFezSk
	R3ZCZHAuN64hbQmuVmt728er5XCFFPUCp4QaF71I=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28LHLCv024824
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 15:17:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 15:17:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28LHKdh019305;
	Wed, 8 Mar 2017 15:17:20 -0600
Date: Wed, 8 Mar 2017 16:17:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170308211720.GB31499@edge>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>
	<20170308143621.GM23302@edge>
	<05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
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
X-List-Received-Date: Wed, 08 Mar 2017 21:17:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

Thanks for reviewing all the patches and identifying their status!

I can probably merge Anand's patch right away, which would supposed to unblock 
further Weston testing. And that will give you a bit more time to prepare a 
followup patch with the rest of them, in case there are any updates needed.

Please let me know otherwise. Thanks.

-- 
Denys


On Wed, Mar 08, 2017 at 03:56:13PM -0500, Ruei, Eric wrote:
> Hi, Anand and Denys:
> 
> I have confirmed that all other 7 Weston patches are still applicable.
> 
> 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch : still applicable, need a minor update
> 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable, resolve the EGL config problem (LCPD-9399)
> 0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch: still applicable
> 0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still applicable
> 0001-udev-seat-restrict-udev-enumeration-to-card0.patch: still applicable, it is what Anand just re-enabled.
> 0001-Add-soc-performance-monitor-utilites.patch : still applicable, TI-specific changes
> 0001-compositor-drm-support-RGB565-with-pixman-renderer.patch: still applicable, Tomi has submitted this one  a while ago, but it is not                                                                                                                                      available at Weston 1.11.0.
> 0001-compositor-drm-fix-hotplug-weston-termination-proble.patch: still applicable, good enough as long as the connecter id/crtc id <64
> 
> I did submit this patch to trigger discussions, but none has provided a 
> better solution.
> 
> Should I submit another patch with all other patches after Anand's patch is 
> applied? Or should we replace Anand's patch with this one which covers all 
> Weston 1.9 patches?
> 
> Best regards,
> 
> Eric
>                                                                                                                                           
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Balagopalakrishnan, Anand
> Sent: Wednesday, March 08, 2017 12:22 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
> 
> Denys,
> 
> We need to review whether the other patches are required or not. This action will happen over the next 1-2 weeks by Karthik and Eric. Till that time, I would like to keep the patches in. 
> 
> In the meantime, the commented out lines can be removed from the bbappend file itself. If a patch is deemed to be required, we can submit a new recipe update later for SRC_URL. Is this fine? If so, I can submit v2 with this proposal.
> 
> Regards,
> Anand
> ________________________________________
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 08, 2017 8:06 PM
> To: Balagopalakrishnan, Anand
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
> 
> On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrote:
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> >
> > diff --git 
> > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend 
> > b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > index d0691ad..36585bd 100644
> > --- 
> > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappen
> > +++ d
> > @@ -2,19 +2,20 @@
> >  PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
> >  PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
> >
> > -PR_append = ".arago16"
> > +PR_append = ".arago17"
> >
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >
> >  RDEPENDS_${PN} += "weston-conf"
> >
> > -#SRC_URI += " \
> > -#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
> > -#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
> > -#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
> > -#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
> > -#    file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
> > -#    file://0001-Add-soc-performance-monitor-utilites.patch \
> > -#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
> > -#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
> > -#"
> > +
> > +SRC_URI += " \
> > +     file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \ 
> > +"
> > +#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
> > +#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
> > +#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
> > +#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
> > +#    file://0001-Add-soc-performance-monitor-utilites.patch
> > +#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
> > +#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
> 
> Anand,
> 
> What about the rest of the commented out patches? Do we still need them?
> 
> If we need them, will you be looking at up-porting them?
> If we don't need them, can you please remove the corresponding comments from the recipe.
> 
> Thanks.
> 
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

