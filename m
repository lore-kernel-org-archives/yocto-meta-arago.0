Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id ED39A52A69
	for <meta-arago@arago-project.org>;
	Wed, 27 Mar 2013 13:37:44 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2RDbgIh018113
	for <meta-arago@arago-project.org>; Wed, 27 Mar 2013 08:37:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2RDbgLk028474
	for <meta-arago@arago-project.org>; Wed, 27 Mar 2013 08:37:42 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 27 Mar 2013 08:37:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 01/17] wl12xx-firmware: Pull back in old
	r5.00.18 recipe.
Thread-Index: AQHOJQ9vc7pCb1hfCkisZ+LwbDnGlpi3G6oAgAJ6KdA=
Date: Wed, 27 Mar 2013 13:37:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C4134A3@DFLE08.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<20130325184556.GF30363@denix.org>
In-Reply-To: <20130325184556.GF30363@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 01/17] wl12xx-firmware: Pull back in old r5.00.18 recipe.
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
X-List-Received-Date: Wed, 27 Mar 2013 13:37:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. I'll send update patches today. Probably less than 17 patches if I squ=
ash some of the patches Chase mentioned.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 25, 2013 1:46 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 01/17] wl12xx-firmware: Pull back in old
> r5.00.18 recipe.
>=20
> So, due to all the comments from Chase, should I expect a v2 for all the =
17
> patches?
>=20
> Moreover, if I remember correctly, these 17 patches are required to go in
> before the 9 patches from Eyal, correct?
>=20
> --
> Denys
>=20
>=20
> On Tue, Mar 19, 2013 at 09:05:22PM -0500, Franklin S. Cooper Jr wrote:
> > * Current am180x-evm ships with a PG 2 wilink 6 module that isn't
> supported in
> >   newer wilink 6 releases.
> > * A newer PG 3 wilink 6 module is available for am180x-evm but needs to
> be
> >   purchased separately..
> > * Bring old r5.00.18 wl12x-firmware recipe with updated recipe name to
> add
> >   support for am180x-evm default wilink 6 module.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../wl12xx-firmware/wl12xx-firmware_r5.00.18.bb    |   28
> ++++++++++++++++++++
> >  1 files changed, 28 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-
> firmware/wl12xx-firmware_r5.00.18.bb
> >
> > diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware_r5.00.18.bb b/meta-arago-extras/recipes-bsp/wl12xx-
> firmware/wl12xx-firmware_r5.00.18.bb
> > new file mode 100644
> > index 0000000..12df963
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-
> firmware_r5.00.18.bb
> > @@ -0,0 +1,28 @@
> > +DESCRIPTION =3D "Firmware files for use with TI wl12xx"
> > +LICENSE =3D "TI-TSPA"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Dba590e1d103f891d0151609046aef9e8"
> > +
> > +PACKAGE_ARCH =3D "all"
> > +
> > +PR =3D "r0+gitr${SRCREV}"
> > +
> > +# This recipe provides the latest firmware files for wl12xx.
> > +# Therefore, use the contents of this recipe instead of the contents
> > +# of linux-firmware-wl12xx.
> > +RCONFLICTS_${PN} =3D "linux-firmware-wl12xx"
> > +RPROVIDES_${PN}  =3D "linux-firmware-wl12xx"
> > +
> > +SRCREV =3D "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
> > +SRC_URI =3D "git://github.com/TI-ECS/ti-utils.git;protocol=3Dgit"
> > +
> > +S =3D "${WORKDIR}/git/hw/firmware"
> > +
> > +do_compile() {
> > +    :
> > +}
> > +
> > +do_install() {
> > +    oe_runmake 'DEST_DIR=3D${D}' install
> > +}
> > +
> > +FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

