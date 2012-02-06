Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D520E52079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 12:49:42 +0000 (UTC)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q16Cneim003395;
	Mon, 6 Feb 2012 06:49:40 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16CndWb029691;
	Mon, 6 Feb 2012 06:49:39 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Mon, 6 Feb 2012 06:49:39 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 5/5] task-arago-tisdk-addons: ported from
	old arago
Thread-Index: AQHM5I2+U+T+9ch3NUqQAMon5SG/05Yv0lLA
Date: Mon, 6 Feb 2012 12:49:38 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012765C11D@DLEE12.ent.ti.com>
References: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
	<1328216492-7294-5-git-send-email-Chase.Maupin@ti.com>
	<20120206051111.GC8770@denix.org>
In-Reply-To: <20120206051111.GC8770@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 5/5] task-arago-tisdk-addons: ported from old arago
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
X-List-Received-Date: Mon, 06 Feb 2012 12:49:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Sunday, February 05, 2012 11:11 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 5/5] task-arago-tisdk-addons:
> ported from old arago
>=20
> On Thu, Feb 02, 2012 at 03:01:32PM -0600, Chase Maupin wrote:
> > * Ported from old arago overlay and added licensing checksum
> > * Removed unsupported devices
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../recipes-tisdk/tasks/task-arago-tisdk-addons.bb |   22
> ++++++++++++++++++++
> >  1 files changed, 22 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-tisdk/tasks/task-
> arago-tisdk-addons.bb
> >
> > diff --git a/meta-arago-distro/recipes-tisdk/tasks/task-arago-
> tisdk-addons.bb b/meta-arago-distro/recipes-tisdk/tasks/task-arago-
> tisdk-addons.bb
> > new file mode 100644
> > index 0000000..8b1231c
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-tisdk/tasks/task-arago-tisdk-
> addons.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "Task to install additional utilities/demos for
> SDKs"
> > +PR =3D "r0"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4d
> e20420"
> > +
> > +inherit task
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +UTILS =3D " \
> > +    matrix-gui-settings-demos \
> > +    matrix-gui-armbenchmarks-demos \
> > +    task-arago-test \
> > +    gdbserver \
> > +    matrix-gui-oprofile-demos \
> > +    "
> > +
> > +# Add PRU examples for am180x-evm devices
> > +UTILS_append_am180x-evm =3D " ti-pru-sw-examples"
>=20
> While matrix pieces are now being updated and moved to meta-arago,
> I don't
> think ti-pru-sw* pieces have made it to either meta-arago or meta-
> ti...
>=20
> Would you like to port ti-pru-sw* first, or just comment it out
> from this task
> for now?

I'll comment it out for now, I don=92t want to forget it, but it is lower o=
n my priority list.

>=20
> --
> Denys
>=20
>=20
> > +RDEPENDS_${PN} =3D "\
> > +    ${UTILS} \
> > +    "
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >

