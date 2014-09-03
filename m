Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C57F152A75
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 19:40:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83JeKXi026387
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 14:40:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83JeJXf027072
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 14:40:19 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 14:40:19 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-firmware:
	specify	the branch being used for this version
Thread-Index: AQHPx3RwApAa+1DUGEK0cvo121pC6Jvve7JwgABUg4D//+hF4IAAX/UA//+tS5CAAFd/AP//sG+w
Date: Wed, 3 Sep 2014 19:40:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C727913@DFLE08.ent.ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
	<1409748091-12617-2-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C726FE9@DFLE08.ent.ti.com>
	<20140903144505.GQ18620@edge>
	<8F29D6B095ED194EA1980491A5E029710C72778E@DFLE08.ent.ti.com>
	<20140903190336.GW18620@edge>
	<8F29D6B095ED194EA1980491A5E029710C727881@DFLE08.ent.ti.com>
	<20140903192043.GX18620@edge>
In-Reply-To: <20140903192043.GX18620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [for dora] [PATCH v2 01/12] wl18xx-firmware: specify	the branch being used for this version
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
X-List-Received-Date: Wed, 03 Sep 2014 19:40:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, September 03, 2014 2:21 PM
> To: Cooper Jr., Franklin
> Cc: R, Karthik; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-firmware:
> specify the branch being used for this version
>=20
> On Wed, Sep 03, 2014 at 03:13:24PM -0400, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, September 03, 2014 2:04 PM
> > > To: Cooper Jr., Franklin
> > > Cc: R, Karthik; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-firmware=
:
> > > specify the branch being used for this version
> > >
> > > On Wed, Sep 03, 2014 at 02:23:43PM -0400, Cooper Jr., Franklin wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Wednesday, September 03, 2014 9:45 AM
> > > > > To: Cooper Jr., Franklin
> > > > > Cc: R, Karthik; meta-arago@arago-project.org
> > > > > Subject: Re: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-
> firmware:
> > > > > specify the branch being used for this version
> > > > >
> > > > > On Wed, Sep 03, 2014 at 02:42:45PM +0000, Cooper Jr., Franklin
> wrote:
> > > > > > Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> > > > >
> > > > > Do you use Dora?
> > >
> > > > [Franklin] I'm not sure if I understand your question. I try to
> > > > review patches no matter what branch it is for if I have time.
> > >
> > > I was just curious if you had any specific interest in these patches
> > > for the old branch, that's all.
> > >
> > > Don't get me wrong. I do appreciate your help with the review
> > > process! And I'm very grateful for your support!
> > >
> > > But these patches are just backports from master and were previously
> > > reviewed and Acked already, so I was just wondering why would you
> > > spend your time on them and skip all my recent patches I had submitte=
d:
>=20
> > [Franklin] Just making sure that backports were done right since there
> > are always room for error. For AMSDK SDK 7.0 users I still recommend
> > that they use dora if they can't use the SDK config. So I am
> > interested in making sure things that are pulled in to dora isn't
> > breaking things for am335x and am437x.
>=20
> I thought AMSDK 7.0 was Dylan based... I don't think we ever productized
> Dora, so GLSDK will be the first one, while we already switched to Daisy.
[Franklin] Your right :). That was atleast my incorrect reasoning when I wa=
s reviewing them in the morning. =20
>=20
>=20
> > > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-
> arago/2958
> > > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-
> arago/2960
> > > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-
> arago/3005
> > > http://thread.gmane.org/gmane.linux.embedded.yocto.meta-
> arago/3022
> > >
> > > I was just wondering about the selection process... If it's just a ma=
tter of
> > > time availability, that is fine with me too - not an issue at all.
>=20
> > [Franklin] Honest answer is time and an equally bad answer is sometimes=
 I
> > miss things when scanning my inbox.
>=20
> No big deal, thanks.
>=20
>=20
> > > > > > > -----Original Message-----
> > > > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> arago-
> > > > > > > bounces@arago-project.org] On Behalf Of R, Karthik
> > > > > > > Sent: Wednesday, September 03, 2014 7:41 AM
> > > > > > > To: meta-arago@arago-project.org
> > > > > > > Subject: [meta-arago] [for dora] [PATCH v2 01/12] wl18xx-
> firmware:
> > > > > > > specify the branch being used for this version
> > > > > > >
> > > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > >
> > > > > > > Bitbake fetcher now requires the branch to be specified when
> SRCREV
> > > > > > > is not on master
> > > > > > >
> > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > Acked-by: Chase Maupin <chase.maupin@ti.com>
> > > > > > > Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> > > > > > > Tested-by: Karthik Ramanan <a0393906@ti.com>
> > > > > > > ---
> > > > > > >  .../recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
> > > | 2
> > > > > +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/meta-arago-extras/recipes-bsp/wl18xx-
> firmware/wl18xx-
> > > > > > > firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> > > > > > > firmware/wl18xx-firmware_r8.a8.10.bb
> > > > > > > index 5db1c99..b59f1c4 100644
> > > > > > > --- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > > > > firmware_r8.a8.10.bb
> > > > > > > +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> > > > > > > firmware_r8.a8.10.bb
> > > > > > > @@ -13,7 +13,7 @@ RCONFLICTS_${PN} +=3D "wl12xx-firmware"
> > > > > > >
> > > > > > >  # Tag: ol_r8.a8.10
> > > > > > >  SRCREV =3D "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
> > > > > > > -SRC_URI =3D "git://github.com/TI-
> > > OpenLink/wl18xx_fw.git;protocol=3Dgit
> > > > > > > \
> > > > > > > +SRC_URI =3D "git://github.com/TI-
> > > > > > > OpenLink/wl18xx_fw.git;protocol=3Dgit;branch=3Dmbss \
> > > > > > >             file://0001-Add-Makefile-for-SDK.patch \
> > > > > > >            "
> > > > > > >
> > > > > > > --
> > > > > > > 2.0.1
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-arago mailing list
> > > > > > > meta-arago@arago-project.org
> > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

