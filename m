Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8ECDD529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 17:19:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15HJWm6027323
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:19:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15HJVpx007655
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 11:19:31 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 11:19:31 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] sysvinit: Changing default setting to add
	HWCLOCKACCESS=no
Thread-Index: AQHQQWQm/DPOi+6I00O7Jlhuj4Lm6pziR/3wgABoMAD//5wAIA==
Date: Thu, 5 Feb 2015 17:19:30 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F92B2@DFLE08.ent.ti.com>
References: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F91C3@DFLE08.ent.ti.com>
	<20150205165237.GJ9943@edge>
	<8F29D6B095ED194EA1980491A5E029710C7F926D@DFLE08.ent.ti.com>
	<20150205171423.GL9943@edge>
In-Reply-To: <20150205171423.GL9943@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] sysvinit: Changing default setting to add HWCLOCKACCESS=no
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
X-List-Received-Date: Thu, 05 Feb 2015 17:19:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 05, 2015 11:14 AM
> To: Cooper Jr., Franklin
> Cc: Nelson, Sam; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] sysvinit: Changing default setting to a=
dd
> HWCLOCKACCESS=3Dno
>=20
> On Thu, Feb 05, 2015 at 12:08:09PM -0500, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Thursday, February 05, 2015 10:53 AM
> > > To: Cooper Jr., Franklin
> > > Cc: Nelson, Sam; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] sysvinit: Changing default setting
> > > to add HWCLOCKACCESS=3Dno
> > >
> > > This was supposed to be an RFC, by the way...
> > >
> > >
> > > On Thu, Feb 05, 2015 at 04:45:43PM +0000, Cooper Jr., Franklin wrote:
> > > > I see references to several boards that have enabled rtc in its
> > > > dts file. I didn't check all the boards we support in meta-ti but
> > > > additional boards may use it. So we shouldn't disable it for these =
boards.
> > >
> > > Exactly, so the proposal was to disable it by default and enable
> > > through machine overrides for those boards that have it.
>=20
> > [Franklin] I'm assuming there was some conversation in the background
> > regarding this patch
>=20
> Well, not about the patch, but about the problem this patch is trying to =
fix :)
>=20
>=20
> > I wasn't aware of since the above two points weren't clear. But no
> > problem doing with what you suggested as long as enabling it for the
> > right boards is being done as part of a patch series with this one.
>=20
> Do we have a list of boards that have RTC? Just glancing over what I have=
 I
> don't see any...
[Franklin] am437x sk, am437x gp evm and am57x based on looking at the dt.
>=20
> As an alternative, we can keep it enabled by default and disable it just =
for
> Keystone to make Sam happy. But I've seen that error on pretty much every
> platform lately.
[Franklin] I would prefer that approach instead. And true about the error b=
ut it could  be a bug or error that needs to be fixed so I rather not hide =
it especially since I haven't received any questions regarding it before.
>=20
>=20
> > > > Honestly if the error is harmless I would say just ignore it.
> > >
> > > That was my initial response - the error is harmless, just ignore
> > > it. Not good for OOB experience, I guess :)
> > >
> > >
> > > > Use some variable that will
> > > > conditional add that string depending on the machine if you want
> > > > to disable it for the machines you care about.
> > >
> > > Just use machine overrides directly, no need to invent another variab=
le...
> > [Franklin] I'll go with whatever you prefer.
> > >
> > >
> > > > Honestly creating a file just to cat it's value to another file I
> > > > feel is a bit of an overkill especially since that file isn't
> > > > generic and is meant for hwclock. So just using echoing something w=
ould
> probably be better.
> > > >
> > > > DISABLE_RTC =3D ""
> > > > DISABLE_<machine> =3D "yes"
> > > > ....
> > > >
> > > > do_install_append() {
> > > > 	if [ "${DISABLE_RTC}" =3D "yes" ]
> > > > 	then
> > > > 		echo "#This is to indicate hwclock is not supported" >>
> > > ${D}${sysconfdir}/default/rcS
> > > > 		echo "HWCLOCKACCESS=3Dno"
> > > > 	fi
> > > > }
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > > > Sent: Thursday, February 05, 2015 10:16 AM
> > > > > To: meta-arago@arago-project.org
> > > > > Subject: [meta-arago] [PATCH] sysvinit: Changing default setting
> > > > > to add HWCLOCKACCESS=3Dno
> > > > >
> > > > > - realtime clock is not commonly present and hence adding
> > > > >   HWCLOCKACCESS=3Dno
> > > > > - Avoids error message if rc device not present
> > > > >
> > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > ---
> > > > >  .../recipes-core/sysvinit/files/hwclock.rcS        |    2 ++
> > > > >  .../sysvinit/sysvinit_2.88dsf.bbappend             |    9 ++++++=
+++
> > > > >  2 files changed, 11 insertions(+)  create mode 100644
> > > > > meta-arago-distro/recipes-
> > > core/sysvinit/files/hwclock.rcS
> > > > >  create mode 100644 meta-arago-distro/recipes-
> > > > > core/sysvinit/sysvinit_2.88dsf.bbappend
> > > > >
> > > > > diff --git
> > > > > a/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> > > b/meta-
> > > > > arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> > > > > new file mode 100644
> > > > > index 0000000..3e26c20
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> > > > > @@ -0,0 +1,2 @@
> > > > > +# This is to indicate hwclock is not supported HWCLOCKACCESS=3Dn=
o
> > > > > diff --git a/meta-arago-distro/recipes-
> > > core/sysvinit/sysvinit_2.88dsf.bbappend
> > > > > b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbapp
> > > > > end
> > > > > new file mode 100644
> > > > > index 0000000..6e08c83
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.b
> > > > > +++ bappend
> > > > > @@ -0,0 +1,9 @@
> > > > > +PR_append =3D "-arago0"
> > > > > +
> > > > > +# look for files in this layer first FILESEXTRAPATHS_prepend :=
=3D
> > > > > +"${THISDIR}/files:"
> > > > > +SRC_URI +=3D "file://hwclock.rcS"
> > > > > +do_install_append () {
> > > > > +# Add hwclock configuration
> > > > > +	cat ${WORKDIR}/hwclock.rcS >> ${D}${sysconfdir}/default/rcS }
> > > > > --
> > > > > 1.7.9.5
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

