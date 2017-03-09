Return-Path: <anandb@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 62E8252A64
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 10:29:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29ATIpn021785
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 04:29:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489055358;
	bh=Sb5cTFFSwZAYW1zjurPVCHhNlgaRQdzU4JfMDUs0OIc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=mvRfkm48jEOGYtFNxUgJTnB4y9n9I/NDH0JPQtSqk/GxxnnPsH44l76glNK+iqTAj
	QofnKQa83nLfejQLx/7duI3kJRLuaeEi8MEIs3gmQjshPjn+Xu8l/W8ib2YbHvJZ0n
	hDvmJMX0g3ywb7g0SQ9rQ9A6oPQJr9aN0H2rNKNw=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29ATFgv013411
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 04:29:17 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29ATADG021755
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:59:12 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Thu, 9 Mar 2017 15:59:09 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to
	/dev/dri/card0
Thread-Index: AQHSl+HHv6vdLCNknUmZrPPOHopYeaGKpr6AgACJTuuAADilEP//rhUAgAAGP4CAAS5gwA==
Date: Thu, 9 Mar 2017 10:29:09 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C03ECB39@DBDE04.ent.ti.com>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>
	<20170308143621.GM23302@edge>
	<05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
	<20170308211720.GB31499@edge>
	<009C030982313E4589C6BC55FBF1E82A25350895@DFLE09.ent.ti.com>
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A25350895@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.114]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 09 Mar 2017 10:29:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

I would prefer a recipe update to address a specific issue/feature rather t=
han taking in all patches at once. This will help in better traceability wh=
en we move to next Yocto version. For example, when we move to a later West=
on version, few patches may not be relevant. If we separate each feature in=
to a separate recipe commit, rebasing becomes easier.

Ideally, we should have a morty patch for each patch on Krogoth. In specifi=
c cases, we may want to squash. Hence, we should logically segregate the pa=
tches to be applied and have specific recipe updates targeting each of them=
. We also want to change the name of this patch file removing 1.9.0 from th=
e file name.

Can you rebase this change on top of my v2 patch? We will need similar upda=
tes for other patches as well - let's plan for respective patch owners take=
 care of that.

On a related note, just like kernel commits, each patch owner should be tra=
cking recipe commits as well when moving from one LTS to another. This got =
missed out this time.=20

Regards,
Anand

-----Original Message-----
From: Ruei, Eric=20
Sent: Thursday, March 9, 2017 3:10 AM
To: Dmytriyenko, Denys
Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

Hi, Denys:

Anand's  patch will fix one problem  and we shall need the following additi=
onal patch to get Weston up and running.

0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable, resolve t=
he EGL config problem (LCPD-9399)

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys
Sent: Wednesday, March 08, 2017 4:17 PM
To: Ruei, Eric
Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

Eric,

Thanks for reviewing all the patches and identifying their status!

I can probably merge Anand's patch right away, which would supposed to unbl=
ock further Weston testing. And that will give you a bit more time to prepa=
re a followup patch with the rest of them, in case there are any updates ne=
eded.

Please let me know otherwise. Thanks.

--
Denys


On Wed, Mar 08, 2017 at 03:56:13PM -0500, Ruei, Eric wrote:
> Hi, Anand and Denys:
>=20
> I have confirmed that all other 7 Weston patches are still applicable.
>=20
> 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch : still=20
> applicable, need a minor update
> 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable,=20
> resolve the EGL config problem (LCPD-9399)
> 0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch: still=20
> applicable
> 0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still applicable
> 0001-udev-seat-restrict-udev-enumeration-to-card0.patch: still applicable=
, it is what Anand just re-enabled.
> 0001-Add-soc-performance-monitor-utilites.patch : still applicable, TI-sp=
ecific changes
> 0001-compositor-drm-support-RGB565-with-pixman-renderer.patch: still appl=
icable, Tomi has submitted this one  a while ago, but it is not            =
                                                                           =
                                               available at Weston 1.11.0.
> 0001-compositor-drm-fix-hotplug-weston-termination-proble.patch: still=20
> applicable, good enough as long as the connecter id/crtc id <64
>=20
> I did submit this patch to trigger discussions, but none has provided=20
> a better solution.
>=20
> Should I submit another patch with all other patches after Anand's=20
> patch is applied? Or should we replace Anand's patch with this one=20
> which covers all Weston 1.9 patches?
>=20
> Best regards,
>=20
> Eric
>                                                                          =
                                                                =20
>=20
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org=20
> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of=20
> Balagopalakrishnan, Anand
> Sent: Wednesday, March 08, 2017 12:22 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev=20
> enumeration to /dev/dri/card0
>=20
> Denys,
>=20
> We need to review whether the other patches are required or not. This act=
ion will happen over the next 1-2 weeks by Karthik and Eric. Till that time=
, I would like to keep the patches in.=20
>=20
> In the meantime, the commented out lines can be removed from the bbappend=
 file itself. If a patch is deemed to be required, we can submit a new reci=
pe update later for SRC_URL. Is this fine? If so, I can submit v2 with this=
 proposal.
>=20
> Regards,
> Anand
> ________________________________________
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 08, 2017 8:06 PM
> To: Balagopalakrishnan, Anand
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev=20
> enumeration to /dev/dri/card0
>=20
> On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrote:
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++---=
--------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > index d0691ad..36585bd 100644
> > ---
> > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbapp
> > +++ en
> > +++ d
> > @@ -2,19 +2,20 @@
> >  PACKAGECONFIG[fbdev] =3D "--enable-fbdev-compositor WESTON_NATIVE_BACK=
END=3D"fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
> >  PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-composit=
or,drm udev libgbm mtdev"
> >
> > -PR_append =3D ".arago16"
> > +PR_append =3D ".arago17"
> >
> >  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >
> >  RDEPENDS_${PN} +=3D "weston-conf"
> >
> > -#SRC_URI +=3D " \
> > -#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.=
patch \
> > -#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
> > -#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.=
patch \
> > -#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
> > -#    file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
> > -#    file://0001-Add-soc-performance-monitor-utilites.patch \
> > -#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.pa=
tch \
> > -#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.=
patch \
> > -#"
> > +
> > +SRC_URI +=3D " \
> > +     file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch=20
> > +\ "
> > +#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.=
patch
> > +#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
> > +#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.=
patch
> > +#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
> > +#    file://0001-Add-soc-performance-monitor-utilites.patch
> > +#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.pa=
tch
> > +#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.=
patch
>=20
> Anand,
>=20
> What about the rest of the commented out patches? Do we still need them?
>=20
> If we need them, will you be looking at up-porting them?
> If we don't need them, can you please remove the corresponding comments f=
rom the recipe.
>=20
> Thanks.
>=20
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

