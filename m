Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 048F05299A
	for <meta-arago@arago-project.org>;
	Tue, 28 Mar 2017 21:58:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SLwrN4022199
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 16:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490738333;
	bh=AI5iQCqffEeAiFhIHhn74kTcSkKdgdBP7TdgH9Zkvy4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S8N4kt4O8q7JUnGsW3YpXu9BQmE9I79rDX3NHPtYLIS2hDafUfPySiLJCnzC+s2Dr
	RgZl2NC5dleK4c4NNLFAUhMeeaxUp//8cqLQINPgyIDKC7TDUU8A6ajm8+ikPisLVL
	2JEBnHTPQ6+eFOwYTmkav7rwTjxH+uN+NDGPR8Jg=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SLwrsP009712
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 16:58:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 16:58:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SLwrMn004164;
	Tue, 28 Mar 2017 16:58:53 -0500
Date: Tue, 28 Mar 2017 17:58:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170328215852.GP29187@edge>
References: <1490648942-28605-1-git-send-email-e-ruei1@ti.com>
	<20170328214320.GM29187@edge>
	<009C030982313E4589C6BC55FBF1E82A2535AD83@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A2535AD83@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [krogoth][PATCH] kmscube: cleanup and include bug fix for HDMI
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
X-List-Received-Date: Tue, 28 Mar 2017 21:58:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, then, might have been a good idea to mention it was a backport from 
morty...

On Tue, Mar 28, 2017 at 05:56:38PM -0400, Ruei, Eric wrote:
> Hi, Denys:
> 
> The changes have already been applied to morty by Karthik.
> 
> Best regards,
> 
> Eric
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, March 28, 2017 5:43 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [krogoth][PATCH] kmscube: cleanup and include bug fix for HDMI
> 
> Is it applicable to morty or do you need to submit a separate patch?
> 
> 
> On Mon, Mar 27, 2017 at 05:09:02PM -0400, Eric Ruei wrote:
> > All local patches merged to git repository
> > 
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 --------  
> > ...nit_drm-select-the-current-CRTC-display-m.patch | 76 ----------------------
> >  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  7 +-
> >  3 files changed, 1 insertion(+), 110 deletions(-)  delete mode 100644 
> > meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init
> > _drm-enable-AM3-support.patch  delete mode 100644 
> > meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-init
> > _drm-select-the-current-CRTC-display-m.patch
> > 
> > diff --git 
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it_drm-enable-AM3-support.patch 
> > b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it_drm-enable-AM3-support.patch
> > deleted file mode 100644
> > index 64b7b04..0000000
> > --- 
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it_drm-enable-AM3-support.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From 82a3cc3ddec96fba7204f5ecab0890801a0b54b4 Mon Sep 17 00:00:00 
> > 2001
> > -From: Eric Ruei <e-ruei1@ti.com>
> > -Date: Thu, 25 Feb 2016 09:49:24 -0500
> > -Subject: [PATCH] kmscube.c: init_drm(): enable AM3 support
> > -
> > -Enable AM3 support by adding "tilcdc" to the modules list.
> > -
> > -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ----
> > - kmscube.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/kmscube.c b/kmscube.c
> > -index 5a18c32..919b3e7 100644
> > ---- a/kmscube.c
> > -+++ b/kmscube.c
> > -@@ -84,7 +84,7 @@ struct drm_fb {
> > - static int init_drm(void)
> > - {
> > - 	static const char *modules[] = {
> > --			"omapdrm", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> > -+			"omapdrm", "tilcdc", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> > - 	};
> > - 	drmModeRes *resources;
> > - 	drmModeConnector *connector = NULL;
> > ---
> > -1.9.1
> > -
> > diff --git 
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it_drm-select-the-current-CRTC-display-m.patch 
> > b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it_drm-select-the-current-CRTC-display-m.patch
> > deleted file mode 100644
> > index e6db0a3..0000000
> > --- 
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it_drm-select-the-current-CRTC-display-m.patch
> > +++ /dev/null
> > @@ -1,76 +0,0 @@
> > -From c2fd69466fcf1de1d20ee437470b40584964b32d Mon Sep 17 00:00:00 
> > 2001
> > -From: Eric Ruei <e-ruei1@ti.com>
> > -Date: Thu, 10 Dec 2015 12:41:15 -0500
> > -Subject: [PATCH] kmscube.c: init_drm(): select the current CRTC 
> > display mode
> > - is valid
> > -
> > -Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ----
> > - kmscube.c | 35 ++++++++++++++++++++++++++++++++---
> > - 1 file changed, 32 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/kmscube.c b/kmscube.c
> > -index 5a18c32..51a2c28 100644
> > ---- a/kmscube.c
> > -+++ b/kmscube.c
> > -@@ -89,6 +89,8 @@ static int init_drm(void)
> > - 	drmModeRes *resources;
> > - 	drmModeConnector *connector = NULL;
> > - 	drmModeEncoder *encoder = NULL;
> > -+	drmModeCrtc *crtc = NULL;
> > -+
> > - 	int i, j;
> > - 	uint32_t maxRes, curRes;
> > -
> > -@@ -119,10 +121,8 @@ static int init_drm(void)
> > - 	for (i = 0; i < resources->count_connectors; i++) {
> > - 		connector = drmModeGetConnector(drm.fd, resources->connectors[i]);
> > - 		if (connector->connection == DRM_MODE_CONNECTED) {
> > --			/* choose the first supported mode */
> > --			drm.mode[drm.ndisp] = &connector->modes[0];
> > --			drm.connector_id[drm.ndisp] = connector->connector_id;
> > -
> > -+			/* find the matched encoders */
> > - 			for (j=0; j<resources->count_encoders; j++) {
> > - 				encoder = drmModeGetEncoder(drm.fd, resources->encoders[j]);
> > - 				if (encoder->encoder_id == connector->encoder_id)
> > -@@ -137,6 +137,35 @@ static int init_drm(void)
> > - 				return -1;
> > - 			}
> > -
> > -+			/* choose the current or first supported mode */
> > -+			crtc = drmModeGetCrtc(drm.fd, encoder->crtc_id);
> > -+			for (j = 0; j < connector->count_modes; j++)
> > -+			{
> > -+				if (crtc->mode_valid)
> > -+				{
> > -+					if ((connector->modes[j].hdisplay == crtc->width) &&
> > -+					(connector->modes[j].vdisplay == crtc->height))
> > -+					{
> > -+						drm.mode[drm.ndisp] = &connector->modes[j];
> > -+						break;
> > -+					}
> > -+				}
> > -+				else
> > -+				{
> > -+					if ((connector->modes[j].hdisplay == crtc->x) &&
> > -+					   (connector->modes[j].vdisplay == crtc->y))
> > -+					{
> > -+						drm.mode[drm.ndisp] = &connector->modes[j];
> > -+						break;
> > -+					}
> > -+				}
> > -+			}
> > -+
> > -+			if(j >= connector->count_modes)
> > -+				drm.mode[drm.ndisp] = &connector->modes[0];
> > -+
> > -+			drm.connector_id[drm.ndisp] = connector->connector_id;
> > -+
> > - 			drm.encoder[drm.ndisp]  = (uint32_t) encoder;
> > - 			drm.crtc_id[drm.ndisp] = encoder->crtc_id;
> > - 			drm.connectors[drm.ndisp] = connector;
> > ---
> > -1.9.1
> > -
> > -
> > diff --git 
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb 
> > b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> > index 1e9a8bf..ded977d 100644
> > --- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> > +++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> > @@ -11,15 +11,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  inherit autotools pkgconfig
> >  
> >  PR = "r5"
> > -SRCREV = "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
> > +SRCREV = "0fa27a594fd3290644f5666eac62dc570f26f866"
> >  
> >  SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
> >  
> > -SRC_URI_append = " \
> > -    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.patch \
> > -    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \
> > -"
> > -
> >  S = "${WORKDIR}/git"
> >  
> >  INSANE_SKIP_kmscube += "dev-deps"
> > --
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

