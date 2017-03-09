Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 00B90529F6
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 17:21:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29HLKHx010700
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 11:21:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489080080;
	bh=jaq15XHBYuKszr9wQoNkv6bAagmLwr1K4jk0QvolmAo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=XSr/02BYN5Emc0yR8CJMDM1oYlp+3NWPlJx/54pnxGXiNoQxoPpui6jd0aqO23Zdb
	nn0GTcZOlS1cJiA6//mETmT1bd8oeldXcM3CZfORTOQJvRcRxvhyWPMf/M++sZbUTi
	HjXeS9IoUf16eWb8QDW9gmG9N9w89ehmef+t1/c4=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29HLK3a019234
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 11:21:20 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Thu, 9 Mar 2017 11:21:20 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to
	/dev/dri/card0
Thread-Index: AQHSl+HHv6vdLCNknUmZrPPOHopYeaGKpr6AgACJTuuAADilEIAAbt4A//+hE3CAATwogIAAYs6AgAABNQD//6a2YA==
Date: Thu, 9 Mar 2017 17:21:20 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25350F85@DFLE09.ent.ti.com>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>
	<20170308143621.GM23302@edge>
	<05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
	<20170308211720.GB31499@edge>
	<009C030982313E4589C6BC55FBF1E82A25350895@DFLE09.ent.ti.com>
	<05CF4794C98B244ABDC620C109037622C03ECB39@DBDE04.ent.ti.com>
	<20170309162246.GE578@edge>
	<05CF4794C98B244ABDC620C109037622C03ED4F9@DBDE04.ent.ti.com>
In-Reply-To: <05CF4794C98B244ABDC620C109037622C03ED4F9@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
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
X-List-Received-Date: Thu, 09 Mar 2017 17:21:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Anand and Denys:

Yes, there is another critical one just getting Weston up and running.
0002-Weston1.9.0-Allow-visual_id-to-be-0.patch

And there are a few other import ones which should be added immediately.
0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
0001-compositor-drm-fix-hotplug-weston-termination-proble.patch

The following two should be in, but not urgent:
0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
0001-Add-soc-performance-monitor-utilites.patch

I do not know how important Karthik's patch is, but it is still a valid pat=
ch:
0001-weston-Enabling-DRM-backend-with-multiple-displays.patch

I agree with Anand's idea in principle, but it may limit to one patch per d=
ay even though we know all those patches are required.

Best regards,

Eric





-----Original Message-----
From: Balagopalakrishnan, Anand=20
Sent: Thursday, March 09, 2017 11:27 AM
To: Dmytriyenko, Denys
Cc: Ruei, Eric; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

If Eric posts another patch with visual-id, Weston startup should be mostly=
 resolved.=20

Yes, I would like separate patches from future maintenance perspective.

Regards,
Anand

-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, March 9, 2017 9:53 PM
To: Balagopalakrishnan, Anand
Cc: Ruei, Eric; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

I can go either way. But we need to clean this up and keep on maintaining i=
t in the future. For now, the most urgent matter is to fix Weston startup i=
ssues.

--
Denys


On Thu, Mar 09, 2017 at 05:29:09AM -0500, Balagopalakrishnan, Anand wrote:
> Hi Eric,
>=20
> I would prefer a recipe update to address a specific issue/feature=20
> rather than taking in all patches at once. This will help in better=20
> traceability when we move to next Yocto version. For example, when we=20
> move to a later Weston version, few patches may not be relevant. If we=20
> separate each feature into a separate recipe commit, rebasing becomes eas=
ier.
>=20
> Ideally, we should have a morty patch for each patch on Krogoth. In=20
> specific cases, we may want to squash. Hence, we should logically=20
> segregate the patches to be applied and have specific recipe updates=20
> targeting each of them. We also want to change the name of this patch=20
> file removing 1.9.0 from the file name.
>=20
> Can you rebase this change on top of my v2 patch? We will need similar=20
> updates for other patches as well - let's plan for respective patch=20
> owners take care of that.
>=20
> On a related note, just like kernel commits, each patch owner should=20
> be tracking recipe commits as well when moving from one LTS to=20
> another. This got missed out this time.
>=20
> Regards,
> Anand
>=20
> -----Original Message-----
> From: Ruei, Eric
> Sent: Thursday, March 9, 2017 3:10 AM
> To: Dmytriyenko, Denys
> Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev=20
> enumeration to /dev/dri/card0
>=20
> Hi, Denys:
>=20
> Anand's patch will fix one problem and we shall need the following=20
> additional patch to get Weston up and running.
>=20
> 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable,=20
> resolve the EGL config problem (LCPD-9399)
>=20
> Best regards,
>=20
> Eric
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 08, 2017 4:17 PM
> To: Ruei, Eric
> Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev=20
> enumeration to /dev/dri/card0
>=20
> Eric,
>=20
> Thanks for reviewing all the patches and identifying their status!
>=20
> I can probably merge Anand's patch right away, which would supposed to=20
> unblock further Weston testing. And that will give you a bit more time=20
> to prepare a followup patch with the rest of them, in case there are=20
> any updates needed.
>=20
> Please let me know otherwise. Thanks.
>=20
> --
> Denys
>=20
>=20
> On Wed, Mar 08, 2017 at 03:56:13PM -0500, Ruei, Eric wrote:
> > Hi, Anand and Denys:
> >=20
> > I have confirmed that all other 7 Weston patches are still applicable.
> >=20
> > 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch :=20
> > still applicable, need a minor update
> > 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable,=20
> > resolve the EGL config problem (LCPD-9399)
> > 0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch:=20
> > still applicable
> > 0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still=20
> > applicable
> > 0001-udev-seat-restrict-udev-enumeration-to-card0.patch: still applicab=
le, it is what Anand just re-enabled.
> > 0001-Add-soc-performance-monitor-utilites.patch : still applicable, TI-=
specific changes
> > 0001-compositor-drm-support-RGB565-with-pixman-renderer.patch: still ap=
plicable, Tomi has submitted this one  a while ago, but it is not          =
                                                                           =
                                                 available at Weston 1.11.0=
.
> > 0001-compositor-drm-fix-hotplug-weston-termination-proble.patch:=20
> > still applicable, good enough as long as the connecter id/crtc id=20
> > <64
> >=20
> > I did submit this patch to trigger discussions, but none has=20
> > provided a better solution.
> >=20
> > Should I submit another patch with all other patches after Anand's=20
> > patch is applied? Or should we replace Anand's patch with this one=20
> > which covers all Weston 1.9 patches?
> >=20
> > Best regards,
> >=20
> > Eric
> >                                                                        =
                                                                  =20
> >=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org
> > [mailto:meta-arago-bounces@arago-project.org] On Behalf Of=20
> > Balagopalakrishnan, Anand
> > Sent: Wednesday, March 08, 2017 12:22 PM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev=20
> > enumeration to /dev/dri/card0
> >=20
> > Denys,
> >=20
> > We need to review whether the other patches are required or not. This a=
ction will happen over the next 1-2 weeks by Karthik and Eric. Till that ti=
me, I would like to keep the patches in.=20
> >=20
> > In the meantime, the commented out lines can be removed from the bbappe=
nd file itself. If a patch is deemed to be required, we can submit a new re=
cipe update later for SRC_URL. Is this fine? If so, I can submit v2 with th=
is proposal.
> >=20
> > Regards,
> > Anand
> > ________________________________________
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, March 08, 2017 8:06 PM
> > To: Balagopalakrishnan, Anand
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev=20
> > enumeration to /dev/dri/card0
> >=20
> > On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrot=
e:
> > > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > > ---
> > >  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-=
----------
> > >  1 file changed, 12 insertions(+), 11 deletions(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappen
> > > d=20
> > > b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappen
> > > d
> > > index d0691ad..36585bd 100644
> > > ---
> > > a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappen
> > > d
> > > +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bba
> > > +++ pp
> > > +++ en
> > > +++ d
> > > @@ -2,19 +2,20 @@
> > >  PACKAGECONFIG[fbdev] =3D "--enable-fbdev-compositor WESTON_NATIVE_BA=
CKEND=3D"fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
> > >  PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-compos=
itor,drm udev libgbm mtdev"
> > >
> > > -PR_append =3D ".arago16"
> > > +PR_append =3D ".arago17"
> > >
> > >  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > >
> > >  RDEPENDS_${PN} +=3D "weston-conf"
> > >
> > > -#SRC_URI +=3D " \
> > > -#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-disp=
l.patch \
> > > -#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
> > > -#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-=
Q.patch \
> > > -#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
> > > -#    file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch =
\
> > > -#    file://0001-Add-soc-performance-monitor-utilites.patch \
> > > -#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.=
patch \
> > > -#    file://0001-compositor-drm-fix-hotplug-weston-termination-probl=
e.patch \
> > > -#"
> > > +
> > > +SRC_URI +=3D " \
> > > +    =20
> > > +file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch
> > > +\ "
> > > +#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-disp=
l.patch
> > > +#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
> > > +#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-=
Q.patch
> > > +#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
> > > +#    file://0001-Add-soc-performance-monitor-utilites.patch
> > > +#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.=
patch
> > > +#    file://0001-compositor-drm-fix-hotplug-weston-termination-probl=
e.patch
> >=20
> > Anand,
> >=20
> > What about the rest of the commented out patches? Do we still need them=
?
> >=20
> > If we need them, will you be looking at up-porting them?
> > If we don't need them, can you please remove the corresponding comments=
 from the recipe.
> >=20
> > Thanks.
> >=20
> > --
> > Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

