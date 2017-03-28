Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 10B2E5299A
	for <meta-arago@arago-project.org>;
	Tue, 28 Mar 2017 22:00:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SM06uD017335
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 17:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490738407;
	bh=YObCMu4lXIwuMUgIYu4WVKSdyjK+WE7brNQ4MlNybhE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=xq1T7Gli3zl6pv3kiTjRiOAMFzdtzDBclwd39wdqvMElgOjjxCCE4y7fMjm5I7JhU
	VohOp6oeBh5MDzGSifTuzSM7YF6VUQT/kgh3OK67XtQfmwHKQs7dJP6t2syu1iUIbe
	ENYtO8Pe7HpJmH4mVE/sxvxSuDBrGRB+XxvL5YB4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SM0112010876
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 17:00:01 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Tue, 28 Mar 2017 17:00:00 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [krogoth][PATCH] kmscube: cleanup and include bug
	fix for HDMI
Thread-Index: AQHSqAxRYOE3nUaVZ0u6YJMGhOJ/RKGqy+hQgABUygD//6xSUA==
Date: Tue, 28 Mar 2017 21:59:59 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A2535ADCD@DFLE09.ent.ti.com>
References: <1490648942-28605-1-git-send-email-e-ruei1@ti.com>
	<20170328214320.GM29187@edge>
	<009C030982313E4589C6BC55FBF1E82A2535AD83@DFLE09.ent.ti.com>
	<20170328215852.GP29187@edge>
In-Reply-To: <20170328215852.GP29187@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 28 Mar 2017 22:00:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Sure. I shall do that next time.

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 28, 2017 5:59 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [krogoth][PATCH] kmscube: cleanup and include bug=
 fix for HDMI

Ok, then, might have been a good idea to mention it was a backport from mor=
ty...

On Tue, Mar 28, 2017 at 05:56:38PM -0400, Ruei, Eric wrote:
> Hi, Denys:
>=20
> The changes have already been applied to morty by Karthik.
>=20
> Best regards,
>=20
> Eric
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 28, 2017 5:43 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [krogoth][PATCH] kmscube: cleanup and=20
> include bug fix for HDMI
>=20
> Is it applicable to morty or do you need to submit a separate patch?
>=20
>=20
> On Mon, Mar 27, 2017 at 05:09:02PM -0400, Eric Ruei wrote:
> > All local patches merged to git repository
> >=20
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  ...001-kmscube.c-init_drm-enable-AM3-support.patch | 28 --------=20
> > ...nit_drm-select-the-current-CRTC-display-m.patch | 76 ---------------=
-------
> >  .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  7 +-
> >  3 files changed, 1 insertion(+), 110 deletions(-)  delete mode=20
> > 100644=20
> > meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it _drm-enable-AM3-support.patch  delete mode 100644=20
> > meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-in
> > it _drm-select-the-current-CRTC-display-m.patch
> >=20
> > diff --git
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-
> > in
> > it_drm-enable-AM3-support.patch
> > b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-
> > in
> > it_drm-enable-AM3-support.patch
> > deleted file mode 100644
> > index 64b7b04..0000000
> > ---
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-
> > in
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
> > - 	static const char *modules[] =3D {
> > --			"omapdrm", "i915", "radeon", "nouveau", "vmwgfx", "exynos"
> > -+			"omapdrm", "tilcdc", "i915", "radeon", "nouveau", "vmwgfx", "exyno=
s"
> > - 	};
> > - 	drmModeRes *resources;
> > - 	drmModeConnector *connector =3D NULL;
> > ---
> > -1.9.1
> > -
> > diff --git
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-
> > in it_drm-select-the-current-CRTC-display-m.patch
> > b/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-
> > in it_drm-select-the-current-CRTC-display-m.patch
> > deleted file mode 100644
> > index e6db0a3..0000000
> > ---
> > a/meta-arago-extras/recipes-graphics/kmscube/kmscube/0001-kmscube.c-
> > in it_drm-select-the-current-CRTC-display-m.patch
> > +++ /dev/null
> > @@ -1,76 +0,0 @@
> > -From c2fd69466fcf1de1d20ee437470b40584964b32d Mon Sep 17 00:00:00
> > 2001
> > -From: Eric Ruei <e-ruei1@ti.com>
> > -Date: Thu, 10 Dec 2015 12:41:15 -0500
> > -Subject: [PATCH] kmscube.c: init_drm(): select the current CRTC=20
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
> > - 	drmModeConnector *connector =3D NULL;
> > - 	drmModeEncoder *encoder =3D NULL;
> > -+	drmModeCrtc *crtc =3D NULL;
> > -+
> > - 	int i, j;
> > - 	uint32_t maxRes, curRes;
> > -
> > -@@ -119,10 +121,8 @@ static int init_drm(void)
> > - 	for (i =3D 0; i < resources->count_connectors; i++) {
> > - 		connector =3D drmModeGetConnector(drm.fd, resources->connectors[i])=
;
> > - 		if (connector->connection =3D=3D DRM_MODE_CONNECTED) {
> > --			/* choose the first supported mode */
> > --			drm.mode[drm.ndisp] =3D &connector->modes[0];
> > --			drm.connector_id[drm.ndisp] =3D connector->connector_id;
> > -
> > -+			/* find the matched encoders */
> > - 			for (j=3D0; j<resources->count_encoders; j++) {
> > - 				encoder =3D drmModeGetEncoder(drm.fd, resources->encoders[j]);
> > - 				if (encoder->encoder_id =3D=3D connector->encoder_id)
> > -@@ -137,6 +137,35 @@ static int init_drm(void)
> > - 				return -1;
> > - 			}
> > -
> > -+			/* choose the current or first supported mode */
> > -+			crtc =3D drmModeGetCrtc(drm.fd, encoder->crtc_id);
> > -+			for (j =3D 0; j < connector->count_modes; j++)
> > -+			{
> > -+				if (crtc->mode_valid)
> > -+				{
> > -+					if ((connector->modes[j].hdisplay =3D=3D crtc->width) &&
> > -+					(connector->modes[j].vdisplay =3D=3D crtc->height))
> > -+					{
> > -+						drm.mode[drm.ndisp] =3D &connector->modes[j];
> > -+						break;
> > -+					}
> > -+				}
> > -+				else
> > -+				{
> > -+					if ((connector->modes[j].hdisplay =3D=3D crtc->x) &&
> > -+					   (connector->modes[j].vdisplay =3D=3D crtc->y))
> > -+					{
> > -+						drm.mode[drm.ndisp] =3D &connector->modes[j];
> > -+						break;
> > -+					}
> > -+				}
> > -+			}
> > -+
> > -+			if(j >=3D connector->count_modes)
> > -+				drm.mode[drm.ndisp] =3D &connector->modes[0];
> > -+
> > -+			drm.connector_id[drm.ndisp] =3D connector->connector_id;
> > -+
> > - 			drm.encoder[drm.ndisp]  =3D (uint32_t) encoder;
> > - 			drm.crtc_id[drm.ndisp] =3D encoder->crtc_id;
> > - 			drm.connectors[drm.ndisp] =3D connector;
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
> > @@ -11,15 +11,10 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  inherit autotools pkgconfig
> > =20
> >  PR =3D "r5"
> > -SRCREV =3D "1c8a0d26c5b1918432fd94d2ac9894b3dcdb2814"
> > +SRCREV =3D "0fa27a594fd3290644f5666eac62dc570f26f866"
> > =20
> >  SRC_URI =3D "git://git.ti.com/glsdk/kmscube.git;protocol=3Dgit"
> > =20
> > -SRC_URI_append =3D " \
> > -    file://0001-kmscube.c-init_drm-select-the-current-CRTC-display-m.p=
atch \
> > -    file://0001-kmscube.c-init_drm-enable-AM3-support.patch \
> > -"
> > -
> >  S =3D "${WORKDIR}/git"
> > =20
> >  INSANE_SKIP_kmscube +=3D "dev-deps"
> > --
> > 1.9.1
> >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

