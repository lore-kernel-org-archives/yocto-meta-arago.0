Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 77BE7529F7
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 16:26:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62GQOBo012819
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 11:26:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62GQOxS008443
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 11:26:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 11:26:23 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/3] wl12xx-firmware: Update to Wilink 6
	version of wl1271-nvs.bin
Thread-Index: AQHOYv6VuJzUAka84UGd8+2yVZ5NGJkq7TsAgAldpwCAHcEOAP//rudg
Date: Tue, 2 Jul 2013 16:26:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C4E9984@DFLE08.ent.ti.com>
References: <1370555268-22244-1-git-send-email-fcooper@ti.com>
	<1370555268-22244-3-git-send-email-fcooper@ti.com>
	<20130607184912.GE15158@edge> <20130613175043.GT3741@edge>
	<20130702161314.GH4941@edge>
In-Reply-To: <20130702161314.GH4941@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] wl12xx-firmware: Update to Wilink 6 version of wl1271-nvs.bin
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
X-List-Received-Date: Tue, 02 Jul 2013 16:26:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I do. Haven't talked to the team yet but I would like to see if we can figu=
re out a better way to handle this.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, July 02, 2013 11:13 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/3] wl12xx-firmware: Update to Wilink 6
> version of wl1271-nvs.bin
>=20
> Franklin,
>=20
> ping^2 - do you want to address this?
>=20
>=20
> On Thu, Jun 13, 2013 at 01:50:44PM -0400, Denys Dmytriyenko wrote:
> > ping
> >
> > On Fri, Jun 07, 2013 at 02:49:12PM -0400, Denys Dmytriyenko wrote:
> > > On Thu, Jun 06, 2013 at 04:47:48PM -0500, Franklin S. Cooper Jr wrote=
:
> > > > * The version of the wl1271-nvs.bin included in the current reposit=
ory was
> meant
> > > >   for Wilink 7 not Wilink 6.
> > > > * This caused firmware errors which caused Wilink 6 not to work on =
any
> boards
> > > >   that don't rerun a calibration script.
> > > > * Use the Wilink 6 version of the nvs file to use a version support=
ed by
> Wilink
> > > >   6 so by default wireless will work.
> > >
> > > Any chance to get this resolved in the upstream TI-OpenLink
> > > repository, instead of dumping a binary here in the metadata?
> > >
> > >
> > > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > > ---
> > > >  .../wl1271-nvs.bin-wilink6                         |  Bin 0 -> 912=
 bytes
> > > >  .../wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb   |    7 ++++++-
> > > >  2 files changed, 6 insertions(+), 1 deletions(-)  create mode
> > > > 100644
> > > > meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.s
> > > > p4.01/wl1271-nvs.bin-wilink6
> > > >
> > > > diff --git
> > > > a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5
> > > > .sp4.01/wl1271-nvs.bin-wilink6
> > > > b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5
> > > > .sp4.01/wl1271-nvs.bin-wilink6
> > > > new file mode 100644
> > > > index
> > > >
> 0000000000000000000000000000000000000000..bb6ff93e585cbc92e1270
> a3a
> > > > 01779d0614616441
> > > > GIT binary patch
> > > > literal 912
> > > >
> zcmZR~4PgKR#zHU!VnP7pOvbNJCKJPte=3DuQe^tV53Y#dx%Jp6*9;?i;|3|b5Z4CV}
> W
> > > > z3@!|Q4517$4Dk$!46zIm*tCv{0Yl)=3D-
> +%xA1ET;4n3$M|2ofe?Y>HMf1I=3DIpnZ(2j
> > > > zl4oRO;AD{y;9&Uv{`q~70KYvdp8-
> uCq=3Dw<mHwGSwAAcA)1U~#=3D;1U6gQAU(AHZaJ_
> > > > qE2*h#O35p!s;Z00$|<O*2H*jpU|?bp6%`c}73GuDrOf&vrW*iCk}^R6
> > > >
> > > > literal 0
> > > > HcmV?d00001
> > > >
> > > > diff --git
> > > > a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5
> > > > .sp4.01.bb
> > > > b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5
> > > > .sp4.01.bb
> > > > index 2232e1c..96b15e0 100644
> > > > ---
> > > > a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5
> > > > .sp4.01.bb
> > > > +++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmwar
> > > > +++ e_r5.sp4.01.bb
> > > > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3Dba590e1d103f891d0151609046aef9e8"
> > > >
> > > >  PACKAGE_ARCH =3D "all"
> > > >
> > > > -PR =3D "r3+gitr${SRCPV}"
> > > > +PR =3D "r4+gitr${SRCPV}"
> > > >
> > > >  # This recipe provides the latest firmware files for wl12xx.
> > > >  # Therefore, use the contents of this recipe instead of the
> > > > contents @@ -16,6 +16,7 @@ RPROVIDES_${PN}  =3D "linux-firmware-
> wl12xx"
> > > >  SRCREV =3D "c8d6b8e6ddf81091e1b1c99ebfb6751cc62b2c63"
> > > >  SRC_URI =3D "git://github.com/TI-OpenLink/ti-utils.git;protocol=3D=
git \
> > > >             file://Makefile \
> > > > +           file://wl1271-nvs.bin-wilink6 \
> > > >            "
> > > >
> > > >  S =3D "${WORKDIR}/git/hw/firmware"
> > > > @@ -26,6 +27,10 @@ do_compile() {
> > > >
> > > >  do_install() {
> > > >      cp ${WORKDIR}/Makefile ${S}
> > > > +    # Remove Wilink 7 version
> > > > +    rm ${S}/wl1271-nvs.bin
> > > > +    # Copy and use Wilink 6 version
> > > > +    cp ${WORKDIR}/wl1271-nvs.bin-wilink6 ${S}/wl1271-nvs.bin
> > > >      oe_runmake 'DEST_DIR=3D${D}' install  }
> > > >
> > > > --
> > > > 1.7.0.4
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

