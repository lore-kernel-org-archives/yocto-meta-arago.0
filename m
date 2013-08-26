Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7379F529E4
	for <meta-arago@arago-project.org>;
	Mon, 26 Aug 2013 17:58:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7QHwaZ7009773
	for <meta-arago@arago-project.org>; Mon, 26 Aug 2013 12:58:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7QHwafI001748
	for <meta-arago@arago-project.org>; Mon, 26 Aug 2013 12:58:36 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 26 Aug 2013 12:58:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
	LOCALVERSION	and AUTOREV
Thread-Index: AQHOoERNyVGqYPsC8kOE6zc7+d2x8pmjSKeQgABWWwD//7ZVQIAEJF4AgABQC7A=
Date: Mon, 26 Aug 2013 17:58:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C52CC7E@DFLE08.ent.ti.com>
References: <1377291818-28047-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C52B698@DFLE08.ent.ti.com>
	<20130823211516.GI27308@edge>
	<8F29D6B095ED194EA1980491A5E029710C52B79D@DFLE08.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596E7A49@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596E7A49@DLEE11.ent.ti.com>
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
X-List-Received-Date: Mon, 26 Aug 2013 17:58:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Maupin, Chase
> Sent: Monday, August 26, 2013 8:11 AM
> To: Cooper Jr., Franklin; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable LOCALVER=
SION
> and AUTOREV
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Friday, August 23, 2013 4:55 PM
> >To: Dmytriyenko, Denys
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
> >LOCALVERSION and AUTOREV
> >
> >
> >
> >> -----Original Message-----
> >> From: Dmytriyenko, Denys
> >> Sent: Friday, August 23, 2013 4:15 PM
> >> To: Cooper Jr., Franklin
> >> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> >> Subject: Re: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
> >LOCALVERSION
> >> and AUTOREV
> >>
> >> On Fri, Aug 23, 2013 at 09:08:06PM +0000, Cooper Jr., Franklin
> >wrote:
> >> >
> >> >
> >> > > -----Original Message-----
> >> > > From: meta-arago-bounces@arago-project.org [mailto:meta-
> >arago-
> >> > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >> > > Sent: Friday, August 23, 2013 4:04 PM
> >> > > To: meta-arago@arago-project.org
> >> > > Subject: [meta-arago] [PATCHv2 3/4] linux-ti-staging: enable
> >> > > LOCALVERSION and AUTOREV
> >> > >
> >> > > From: Denys Dmytriyenko <denys@ti.com>
> >> > >
> >> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> > > ---
> >> > > v2 - removed the comment about upstreaming LOCALVERSION, may
> >not
> >> > > happen
> >> > >
> >> > >  .../recipes-kernel/linux/linux-ti-staging_git.bbappend  |
> >17
> >> > > +++++++++++++++++
> >> > >  1 file changed, 17 insertions(+)  create mode 100644
> >> > > meta-arago-distro/recipes-
> >kernel/linux/linux-ti-
> >> > > staging_git.bbappend
> >> > >
> >> > > diff --git
> >> > > a/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_git.bbappe
> >> > > nd
> >> > > b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_git.bbappe
> >> > > nd
> >> > > new file mode 100644
> >> > > index 0000000..f99482c
> >> > > --- /dev/null
> >> > > +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
> >staging_git.bb
> >> > > +++ append
> >> > > @@ -0,0 +1,17 @@
> >> > > +MACHINE_KERNEL_PR_append =3D "-arago0"
> >> > > +
> >> > > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
> >> > > +
> >> > > +require copy-defconfig.inc
> >>
> >> > [Franklin] Are we really planning on have different defconfigs
> >for
> >> > each machine? I thought with DT all machines will share the
> >same defconfig.
> >>
> >> Yes, linux-ti-staging uses a blank defconfig that points to
> >omap2plus_defconfig.
> >>
> >> But copy-defconfig just saves the current config for SDK use -
> >they will be the
> >> same for machines using this recipe. But still, there are
> >currently only 2 OMAP
> >> machines supported by this kernel and will be 2 Sitara machines
> >with this
> >> patchset. If/when we switch remaining SDK machines to use the
> >latest kernel,
> >> we can revisit this matter, I guess.
> >[Franklin]
> >I guess my point was that copy-defconfig.inc renames the .config to
> >tisdk_${MACHINE}_defconfig. Can we set CONFIG_NAME  to
> >"omap2plus_defconfig" since we should stick with that defconfig name
> >for all machines?
>=20
> Franklin this would have some of the following impacts:
>=20
> 1. You would need to update all your documentation 2. If you ever do deci=
de
> you need a tweak for individual machines in the defconfig such as having
> something turned on for other machines that you do not want turned on for=
 a
> particular machine due to size or boot time impacts, you will end up need=
ing this
> functionality back.
> 3. You will probably get some questions about why AMxxx is using an
> "omap2plus" configuration.
> 4. I'm not sure how much of the kernel config magic is still used in oe-c=
ore,
> where they would modify the config with certain options (and this is prob=
ably
> bypassed right now) but again, those kinds of changes would be lost.
>=20
> Currently you can just say find the config matching a simple pattern and =
people
> know exactly what you built with.
[Franklin]=20
Ok. I wasn't sure if we were going to put in the effort to unify defconfigs=
 and deal with the tradeoffs. But if that's not the case then I have no iss=
ue.
>=20
> >>
> >>
> >> > > +SRCREV =3D "${AUTOREV}"
> >> > > +
> >> > > +KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> >> > > True).partition('+')[2][0:7]}"
> >> > > +
> >> > > +kernel_do_configure_prepend() {
> >> > > +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> >> > > +    then
> >> > > +        echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> >> > > +        echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> >> > > +    fi
> >> > > +}
> >> > > --
> >> > > 1.8.3.2
> >> > >
> >> > > _______________________________________________
> >> > > meta-arago mailing list
> >> > > meta-arago@arago-project.org
> >> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> > _______________________________________________
> >> > meta-arago mailing list
> >> > meta-arago@arago-project.org
> >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

