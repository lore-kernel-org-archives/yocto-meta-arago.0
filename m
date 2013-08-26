Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 214D4529E4
	for <meta-arago@arago-project.org>;
	Mon, 26 Aug 2013 18:04:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7QI44qO008389
	for <meta-arago@arago-project.org>; Mon, 26 Aug 2013 13:04:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7QI44DT009933
	for <meta-arago@arago-project.org>; Mon, 26 Aug 2013 13:04:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 26 Aug 2013 13:04:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
	LOCALVERSION	and AUTOREV
Thread-Index: AQHOoERNyVGqYPsC8kOE6zc7+d2x8pmjSKeQgABWWwD//7ZVQIAElH+A///hktA=
Date: Mon, 26 Aug 2013 18:04:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C52CC93@DFLE08.ent.ti.com>
References: <1377291818-28047-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
	<20130823211516.GI27308@edge>
	<8F29D6B095ED194EA1980491A5E029710C52B79D@DFLE08.ent.ti.com>
	<20130826144807.GA20807@denix.org>
In-Reply-To: <20130826144807.GA20807@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 3/4] linux-ti-staging: enable LOCALVERSION	and AUTOREV
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
X-List-Received-Date: Mon, 26 Aug 2013 18:04:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, August 26, 2013 9:48 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable LOCALVER=
SION
> and AUTOREV
>=20
> On Fri, Aug 23, 2013 at 09:54:44PM +0000, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, August 23, 2013 4:15 PM
> > > To: Cooper Jr., Franklin
> > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
> > > LOCALVERSION and AUTOREV
> > >
> > > On Fri, Aug 23, 2013 at 09:08:06PM +0000, Cooper Jr., Franklin wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > > Sent: Friday, August 23, 2013 4:04 PM
> > > > > To: meta-arago@arago-project.org
> > > > > Subject: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
> > > > > LOCALVERSION and AUTOREV
> > > > >
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > ---
> > > > > v2 - removed the comment about upstreaming LOCALVERSION, may not
> > > > > happen
> > > > >
> > > > >  .../recipes-kernel/linux/linux-ti-staging_git.bbappend  | 17
> > > > > +++++++++++++++++
> > > > >  1 file changed, 17 insertions(+)  create mode 100644
> > > > > meta-arago-distro/recipes-kernel/linux/linux-ti-
> > > > > staging_git.bbappend
> > > > >
> > > > > diff --git
> > > > > a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb
> > > > > appe
> > > > > nd
> > > > > b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_git.bb
> > > > > appe
> > > > > nd
> > > > > new file mode 100644
> > > > > index 0000000..f99482c
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_gi
> > > > > +++ t.bb
> > > > > +++ append
> > > > > @@ -0,0 +1,17 @@
> > > > > +MACHINE_KERNEL_PR_append =3D "-arago0"
> > > > > +
> > > > > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
> > > > > +
> > > > > +require copy-defconfig.inc
> > >
> > > > [Franklin] Are we really planning on have different defconfigs for
> > > > each machine? I thought with DT all machines will share the same
> defconfig.
> > >
> > > Yes, linux-ti-staging uses a blank defconfig that points to
> omap2plus_defconfig.
> > >
> > > But copy-defconfig just saves the current config for SDK use - they
> > > will be the same for machines using this recipe. But still, there
> > > are currently only 2 OMAP machines supported by this kernel and will
> > > be 2 Sitara machines with this patchset. If/when we switch remaining
> > > SDK machines to use the latest kernel, we can revisit this matter, I =
guess.
> > [Franklin]
> > I guess my point was that copy-defconfig.inc renames the .config to
> > tisdk_${MACHINE}_defconfig. Can we set CONFIG_NAME to
> "omap2plus_defconfig"
> > since we should stick with that defconfig name for all machines?
>=20
> And what I was trying to say before, is that "all machines" is currently =
only 2 out
> of several and even then, omap2plus_defconfig in the kernel may not match
> exactly the one produced by the SDK - there may be some mangling involved=
 to
> adjust some config options to sane defaults (although we no longer includ=
e
> linux.inc with that code), plus we run "make oldconfig" on it, which chec=
ks
> dependecies between config options and may change some os them. In other
> words: omap2plus_defconfig !=3D .config which we package in the SDK. It i=
s like
> the difference between pristine sources and sources that were patched and
> configured...
[Franklin]  I was hoping we would get rid of all the tweaks to the defconfi=
g so that omap2plus_defconfig =3D=3D .config . This would mean we push all =
modifications we needed to mainline. Similar to my response to Chase if tha=
t isn't the plan then I have no issue with the approach.
>=20
> --
> Denys
>=20
>=20
> > > > > +SRCREV =3D "${AUTOREV}"
> > > > > +
> > > > > +KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> > > > > True).partition('+')[2][0:7]}"
> > > > > +
> > > > > +kernel_do_configure_prepend() {
> > > > > +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> > > > > +    then
> > > > > +        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > > > > +        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > > > > +    fi
> > > > > +}
> > > > > --
> > > > > 1.8.3.2
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

