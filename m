Return-Path: <anandb@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8302852980
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 17:43:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29HhsIL013472
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 11:43:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489081434;
	bh=p+oYWbAnUQx+xDWNxxFazgDs/js2bwBXR2QJYh9+Wx8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EbKZhTaoR0oJ1I/3WWWM4agL+/nwUoxjjNTJmmktBLFxasMmTxI0sYm8gUAP6e935
	E/+c8hb20qoCOpUMLMCF98azuUoy5pzaWrHnh97+MXDvKphVSiCyPS6N3/ZAMPzj9h
	4aRVIw38rBqlzr2wAWvF0WXvnmsMAoxhagJoiI44=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29HhrS4010401
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 11:43:53 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29HhoYt020232
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 23:13:51 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Thu, 9 Mar 2017 23:13:49 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to
	/dev/dri/card0
Thread-Index: AQHSl+HHv6vdLCNknUmZrPPOHopYeaGKpr6AgACJTuuAADilEP//rhUAgAAGP4CAAS5gwIAAC2qAgABdC3D//7NRAIAAYnxm
Date: Thu, 9 Mar 2017 17:43:48 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C03ED70B@DBDE04.ent.ti.com>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>
	<20170308143621.GM23302@edge>
	<05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
	<20170308211720.GB31499@edge>
	<009C030982313E4589C6BC55FBF1E82A25350895@DFLE09.ent.ti.com>
	<05CF4794C98B244ABDC620C109037622C03ECB39@DBDE04.ent.ti.com>
	<20170309162246.GE578@edge>
	<05CF4794C98B244ABDC620C109037622C03ED4F9@DBDE04.ent.ti.com>,
	<009C030982313E4589C6BC55FBF1E82A25350F85@DFLE09.ent.ti.com>
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A25350F85@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Thu, 09 Mar 2017 17:43:54 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_05CF4794C98B244ABDC620C109037622C03ED70BDBDE04entticom_"

--_000_05CF4794C98B244ABDC620C109037622C03ED70BDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

You need not limit to 1 patch per day. Keep separate commits as was done fo=
r krogoth. All your commits will get rebased one on top of the other with a=
 bump in PR for each patch.

You can submit all the patches in 1 go. Denys can merge them individually. =
We will get all the patches in quickly. Also, we have traceability.

I follow the same approach for SGX um.

Regards,
Anand

Sent from my Android phone

-----Original Message-----
From: Ruei, Eric [e-ruei1@ti.com]
Received: Thursday, 09 Mar 2017, 22:51
To: Balagopalakrishnan, Anand [anandb@ti.com]; Dmytriyenko, Denys [denys@ti=
.com]
CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

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
From: Balagopalakrishnan, Anand
Sent: Thursday, March 09, 2017 11:27 AM
To: Dmytriyenko, Denys
Cc: Ruei, Eric; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

If Eric posts another patch with visual-id, Weston startup should be mostly=
 resolved.

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
>
> I would prefer a recipe update to address a specific issue/feature
> rather than taking in all patches at once. This will help in better
> traceability when we move to next Yocto version. For example, when we
> move to a later Weston version, few patches may not be relevant. If we
> separate each feature into a separate recipe commit, rebasing becomes eas=
ier.
>
> Ideally, we should have a morty patch for each patch on Krogoth. In
> specific cases, we may want to squash. Hence, we should logically
> segregate the patches to be applied and have specific recipe updates
> targeting each of them. We also want to change the name of this patch
> file removing 1.9.0 from the file name.
>
> Can you rebase this change on top of my v2 patch? We will need similar
> updates for other patches as well - let's plan for respective patch
> owners take care of that.
>
> On a related note, just like kernel commits, each patch owner should
> be tracking recipe commits as well when moving from one LTS to
> another. This got missed out this time.
>
> Regards,
> Anand
>
> -----Original Message-----
> From: Ruei, Eric
> Sent: Thursday, March 9, 2017 3:10 AM
> To: Dmytriyenko, Denys
> Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev
> enumeration to /dev/dri/card0
>
> Hi, Denys:
>
> Anand's patch will fix one problem and we shall need the following
> additional patch to get Weston up and running.
>
> 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable,
> resolve the EGL config problem (LCPD-9399)
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
> Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev
> enumeration to /dev/dri/card0
>
> Eric,
>
> Thanks for reviewing all the patches and identifying their status!
>
> I can probably merge Anand's patch right away, which would supposed to
> unblock further Weston testing. And that will give you a bit more time
> to prepare a followup patch with the rest of them, in case there are
> any updates needed.
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
> > 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch :
> > still applicable, need a minor update
> > 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable,
> > resolve the EGL config problem (LCPD-9399)
> > 0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch:
> > still applicable
> > 0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still
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
> > 0001-compositor-drm-fix-hotplug-weston-termination-proble.patch:
> > still applicable, good enough as long as the connecter id/crtc id
> > <64
> >
> > I did submit this patch to trigger discussions, but none has
> > provided a better solution.
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
> > We need to review whether the other patches are required or not. This a=
ction will happen over the next 1-2 weeks by Karthik and Eric. Till that ti=
me, I would like to keep the patches in.
> >
> > In the meantime, the commented out lines can be removed from the bbappe=
nd file itself. If a patch is deemed to be required, we can submit a new re=
cipe update later for SRC_URL. Is this fine? If so, I can submit v2 with th=
is proposal.
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
> > > d
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
> > > +
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
> >
> > Anand,
> >
> > What about the rest of the commented out patches? Do we still need them=
?
> >
> > If we need them, will you be looking at up-porting them?
> > If we don't need them, can you please remove the corresponding comments=
 from the recipe.
> >
> > Thanks.
> >
> > --
> > Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_05CF4794C98B244ABDC620C109037622C03ED70BDBDE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Hi Eric,
<br>
<br>
You need not limit to 1 patch per day. Keep separate commits as was done fo=
r krogoth. All your commits will get rebased one on top of the other with a=
 bump in PR for each patch.
<br>
<br>
You can submit all the patches in 1 go. Denys can merge them individually. =
We will get all the patches in quickly. Also, we have traceability.
<br>
<br>
I follow the same approach for SGX um. <br>
<br>
Regards, <br>
Anand <br>
<br>
Sent from my Android phone<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Ruei, Eric [e-ruei1@ti.com]<br>
<b>Received:</b> Thursday, 09 Mar 2017, 22:51<br>
<b>To:</b> Balagopalakrishnan, Anand [anandb@ti.com]; Dmytriyenko, Denys [d=
enys@ti.com]<br>
<b>CC:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumerat=
ion to /dev/dri/card0<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi, Anand and Denys:<br>
<br>
Yes, there is another critical one just getting Weston up and running.<br>
0002-Weston1.9.0-Allow-visual_id-to-be-0.patch<br>
<br>
And there are a few other import ones which should be added immediately.<br=
>
0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch<br>
0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch<br>
0001-compositor-drm-fix-hotplug-weston-termination-proble.patch<br>
<br>
The following two should be in, but not urgent:<br>
0001-compositor-drm-support-RGB565-with-pixman-renderer.patch<br>
0001-Add-soc-performance-monitor-utilites.patch<br>
<br>
I do not know how important Karthik's patch is, but it is still a valid pat=
ch:<br>
0001-weston-Enabling-DRM-backend-with-multiple-displays.patch<br>
<br>
I agree with Anand's idea in principle, but it may limit to one patch per d=
ay even though we know all those patches are required.<br>
<br>
Best regards,<br>
<br>
Eric<br>
<br>
<br>
<br>
<br>
<br>
-----Original Message-----<br>
From: Balagopalakrishnan, Anand <br>
Sent: Thursday, March 09, 2017 11:27 AM<br>
To: Dmytriyenko, Denys<br>
Cc: Ruei, Eric; meta-arago@arago-project.org<br>
Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0<br>
<br>
If Eric posts another patch with visual-id, Weston startup should be mostly=
 resolved.
<br>
<br>
Yes, I would like separate patches from future maintenance perspective.<br>
<br>
Regards,<br>
Anand<br>
<br>
-----Original Message-----<br>
From: Dmytriyenko, Denys<br>
Sent: Thursday, March 9, 2017 9:53 PM<br>
To: Balagopalakrishnan, Anand<br>
Cc: Ruei, Eric; meta-arago@arago-project.org<br>
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0<br>
<br>
I can go either way. But we need to clean this up and keep on maintaining i=
t in the future. For now, the most urgent matter is to fix Weston startup i=
ssues.<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Thu, Mar 09, 2017 at 05:29:09AM -0500, Balagopalakrishnan, Anand wrote:<=
br>
&gt; Hi Eric,<br>
&gt; <br>
&gt; I would prefer a recipe update to address a specific issue/feature <br=
>
&gt; rather than taking in all patches at once. This will help in better <b=
r>
&gt; traceability when we move to next Yocto version. For example, when we =
<br>
&gt; move to a later Weston version, few patches may not be relevant. If we=
 <br>
&gt; separate each feature into a separate recipe commit, rebasing becomes =
easier.<br>
&gt; <br>
&gt; Ideally, we should have a morty patch for each patch on Krogoth. In <b=
r>
&gt; specific cases, we may want to squash. Hence, we should logically <br>
&gt; segregate the patches to be applied and have specific recipe updates <=
br>
&gt; targeting each of them. We also want to change the name of this patch =
<br>
&gt; file removing 1.9.0 from the file name.<br>
&gt; <br>
&gt; Can you rebase this change on top of my v2 patch? We will need similar=
 <br>
&gt; updates for other patches as well - let's plan for respective patch <b=
r>
&gt; owners take care of that.<br>
&gt; <br>
&gt; On a related note, just like kernel commits, each patch owner should <=
br>
&gt; be tracking recipe commits as well when moving from one LTS to <br>
&gt; another. This got missed out this time.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Anand<br>
&gt; <br>
&gt; -----Original Message-----<br>
&gt; From: Ruei, Eric<br>
&gt; Sent: Thursday, March 9, 2017 3:10 AM<br>
&gt; To: Dmytriyenko, Denys<br>
&gt; Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org<br>
&gt; Subject: RE: [meta-arago] [PATCH 1/1] weston: restrict udev <br>
&gt; enumeration to /dev/dri/card0<br>
&gt; <br>
&gt; Hi, Denys:<br>
&gt; <br>
&gt; Anand's patch will fix one problem and we shall need the following <br=
>
&gt; additional patch to get Weston up and running.<br>
&gt; <br>
&gt; 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable, <br>
&gt; resolve the EGL config problem (LCPD-9399)<br>
&gt; <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Eric<br>
&gt; <br>
&gt; <br>
&gt; -----Original Message-----<br>
&gt; From: Dmytriyenko, Denys<br>
&gt; Sent: Wednesday, March 08, 2017 4:17 PM<br>
&gt; To: Ruei, Eric<br>
&gt; Cc: Balagopalakrishnan, Anand; meta-arago@arago-project.org<br>
&gt; Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev <br>
&gt; enumeration to /dev/dri/card0<br>
&gt; <br>
&gt; Eric,<br>
&gt; <br>
&gt; Thanks for reviewing all the patches and identifying their status!<br>
&gt; <br>
&gt; I can probably merge Anand's patch right away, which would supposed to=
 <br>
&gt; unblock further Weston testing. And that will give you a bit more time=
 <br>
&gt; to prepare a followup patch with the rest of them, in case there are <=
br>
&gt; any updates needed.<br>
&gt; <br>
&gt; Please let me know otherwise. Thanks.<br>
&gt; <br>
&gt; --<br>
&gt; Denys<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Mar 08, 2017 at 03:56:13PM -0500, Ruei, Eric wrote:<br>
&gt; &gt; Hi, Anand and Denys:<br>
&gt; &gt; <br>
&gt; &gt; I have confirmed that all other 7 Weston patches are still applic=
able.<br>
&gt; &gt; <br>
&gt; &gt; 0001-weston-Enabling-DRM-backend-with-multiple-displays.patch : <=
br>
&gt; &gt; still applicable, need a minor update<br>
&gt; &gt; 0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable,=
 <br>
&gt; &gt; resolve the EGL config problem (LCPD-9399)<br>
&gt; &gt; 0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch: =
<br>
&gt; &gt; still applicable<br>
&gt; &gt; 0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still <br>
&gt; &gt; applicable<br>
&gt; &gt; 0001-udev-seat-restrict-udev-enumeration-to-card0.patch: still ap=
plicable, it is what Anand just re-enabled.<br>
&gt; &gt; 0001-Add-soc-performance-monitor-utilites.patch : still applicabl=
e, TI-specific changes<br>
&gt; &gt; 0001-compositor-drm-support-RGB565-with-pixman-renderer.patch: st=
ill applicable, Tomi has submitted this one&nbsp; a while ago, but it is no=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 available at Weston 1.11.0.<br>
&gt; &gt; 0001-compositor-drm-fix-hotplug-weston-termination-proble.patch: =
<br>
&gt; &gt; still applicable, good enough as long as the connecter id/crtc id=
 <br>
&gt; &gt; &lt;64<br>
&gt; &gt; <br>
&gt; &gt; I did submit this patch to trigger discussions, but none has <br>
&gt; &gt; provided a better solution.<br>
&gt; &gt; <br>
&gt; &gt; Should I submit another patch with all other patches after Anand'=
s <br>
&gt; &gt; patch is applied? Or should we replace Anand's patch with this on=
e <br>
&gt; &gt; which covers all Weston 1.9 patches?<br>
&gt; &gt; <br>
&gt; &gt; Best regards,<br>
&gt; &gt; <br>
&gt; &gt; Eric<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;
<br>
&gt; &gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: meta-arago-bounces@arago-project.org<br>
&gt; &gt; [<a href=3D"mailto:meta-arago-bounces@arago-project.org">mailto:m=
eta-arago-bounces@arago-project.org</a>] On Behalf Of
<br>
&gt; &gt; Balagopalakrishnan, Anand<br>
&gt; &gt; Sent: Wednesday, March 08, 2017 12:22 PM<br>
&gt; &gt; To: Dmytriyenko, Denys<br>
&gt; &gt; Cc: meta-arago@arago-project.org<br>
&gt; &gt; Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev <br>
&gt; &gt; enumeration to /dev/dri/card0<br>
&gt; &gt; <br>
&gt; &gt; Denys,<br>
&gt; &gt; <br>
&gt; &gt; We need to review whether the other patches are required or not. =
This action will happen over the next 1-2 weeks by Karthik and Eric. Till t=
hat time, I would like to keep the patches in.
<br>
&gt; &gt; <br>
&gt; &gt; In the meantime, the commented out lines can be removed from the =
bbappend file itself. If a patch is deemed to be required, we can submit a =
new recipe update later for SRC_URL. Is this fine? If so, I can submit v2 w=
ith this proposal.<br>
&gt; &gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Anand<br>
&gt; &gt; ________________________________________<br>
&gt; &gt; From: Dmytriyenko, Denys<br>
&gt; &gt; Sent: Wednesday, March 08, 2017 8:06 PM<br>
&gt; &gt; To: Balagopalakrishnan, Anand<br>
&gt; &gt; Cc: meta-arago@arago-project.org<br>
&gt; &gt; Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev <br>
&gt; &gt; enumeration to /dev/dri/card0<br>
&gt; &gt; <br>
&gt; &gt; On Wed, Mar 08, 2017 at 01:28:25PM &#43;0530, Anand Balagopalakri=
shnan wrote:<br>
&gt; &gt; &gt; Signed-off-by: Anand Balagopalakrishnan &lt;anandb@ti.com&gt=
;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&nbsp; .../wayland/weston_1.11.0.bbappend&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----------<b=
r>
&gt; &gt; &gt;&nbsp; 1 file changed, 12 insertions(&#43;), 11 deletions(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; &gt; a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.b=
bappen<br>
&gt; &gt; &gt; d <br>
&gt; &gt; &gt; b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.b=
bappen<br>
&gt; &gt; &gt; d<br>
&gt; &gt; &gt; index d0691ad..36585bd 100644<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.b=
bappen<br>
&gt; &gt; &gt; d<br>
&gt; &gt; &gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-graphics/wayland=
/weston_1.11.0.bba<br>
&gt; &gt; &gt; &#43;&#43;&#43; pp<br>
&gt; &gt; &gt; &#43;&#43;&#43; en<br>
&gt; &gt; &gt; &#43;&#43;&#43; d<br>
&gt; &gt; &gt; @@ -2,19 &#43;2,20 @@<br>
&gt; &gt; &gt;&nbsp; PACKAGECONFIG[fbdev] =3D &quot;--enable-fbdev-composit=
or WESTON_NATIVE_BACKEND=3D&quot;fbdev-backend.so&quot;,--disable-fbdev-com=
positor,udev mtdev&quot;<br>
&gt; &gt; &gt;&nbsp; PACKAGECONFIG[kms] =3D &quot;--enable-drm-compositor,-=
-disable-drm-compositor,drm udev libgbm mtdev&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -PR_append =3D &quot;.arago16&quot;<br>
&gt; &gt; &gt; &#43;PR_append =3D &quot;.arago17&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&q=
uot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; RDEPENDS_${PN} &#43;=3D &quot;weston-conf&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -#SRC_URI &#43;=3D &quot; \<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-weston1.9.0-Enab=
ling-DRM-backend-with-multiple-displ.patch">
file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch</a> =
\<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0002-Weston1.9.0-Allo=
w-visual_id-to-be-0.patch">file://0002-Weston1.9.0-Allow-visual_id-to-be-0.=
patch</a> \<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0003-Weston1.9.0-Fix-=
virtual-keyboard-display-issue-for-Q.patch">
file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch</a> =
\<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0004-Weston1.9.0-Fix-=
touch-screen-crash-issue.patch">
file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch</a> \<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-udev-seat-restri=
ct-udev-enumeration-to-card0.patch">
file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch</a> \<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-Add-soc-performa=
nce-monitor-utilites.patch">file://0001-Add-soc-performance-monitor-utilite=
s.patch</a> \<br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-compositor-drm-s=
upport-RGB565-with-pixman-renderer.patch">
file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch</a> \<=
br>
&gt; &gt; &gt; -#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-compositor-drm-f=
ix-hotplug-weston-termination-proble.patch">
file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch</a> =
\<br>
&gt; &gt; &gt; -#&quot;<br>
&gt; &gt; &gt; &#43;<br>
&gt; &gt; &gt; &#43;SRC_URI &#43;=3D &quot; \<br>
&gt; &gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; &gt; &#43;file://0001-udev-seat-restrict-udev-enumeration-to-card=
0.patch<br>
&gt; &gt; &gt; &#43;\ &quot;<br>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-weston1.9.0-=
Enabling-DRM-backend-with-multiple-displ.patch">
file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch</a><=
br>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0002-Weston1.9.0-=
Allow-visual_id-to-be-0.patch">file://0002-Weston1.9.0-Allow-visual_id-to-b=
e-0.patch</a><br>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0003-Weston1.9.0-=
Fix-virtual-keyboard-display-issue-for-Q.patch">
file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch</a><=
br>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0004-Weston1.9.0-=
Fix-touch-screen-crash-issue.patch">
file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch</a><br>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-Add-soc-perf=
ormance-monitor-utilites.patch">file://0001-Add-soc-performance-monitor-uti=
lites.patch</a><br>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-compositor-d=
rm-support-RGB565-with-pixman-renderer.patch">
file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch</a><br=
>
&gt; &gt; &gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-compositor-d=
rm-fix-hotplug-weston-termination-proble.patch">
file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch</a><=
br>
&gt; &gt; <br>
&gt; &gt; Anand,<br>
&gt; &gt; <br>
&gt; &gt; What about the rest of the commented out patches? Do we still nee=
d them?<br>
&gt; &gt; <br>
&gt; &gt; If we need them, will you be looking at up-porting them?<br>
&gt; &gt; If we don't need them, can you please remove the corresponding co=
mments from the recipe.<br>
&gt; &gt; <br>
&gt; &gt; Thanks.<br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-arago mailing list<br>
&gt; &gt; meta-arago@arago-project.org<br>
&gt; &gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta=
-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br=
>
</div>
</span></font>
</body>
</html>

--_000_05CF4794C98B244ABDC620C109037622C03ED70BDBDE04entticom_--
