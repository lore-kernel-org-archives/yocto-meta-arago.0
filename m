Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7AD7252AA4
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 13:31:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9IDVexD001572;
	Thu, 18 Oct 2012 08:31:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9IDVeFi006815;
	Thu, 18 Oct 2012 08:31:40 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 18 Oct 2012 08:31:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create
	graphics task
Thread-Index: AQHNqDpKvdiozlJi6UKAxp3tY2sDzJe1sAbQgAlGSoCAACLnMA==
Date: Thu, 18 Oct 2012 13:31:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015926D377@DLEE12.ent.ti.com>
References: <1350021454-12557-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C3D5@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C306CB0@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C306CB0@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] task-arago-tisdk-graphics: Create graphics task
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
X-List-Received-Date: Thu, 18 Oct 2012 13:31:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, October 18, 2012 1:26 AM
> To: Maupin, Chase; Franklin S. Cooper Jr; meta-arago@arago-
> project.org
> Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics:
> Create graphics task
>=20
>=20
>=20
> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, October 12, 2012 9:52 PM
> To: Franklin S. Cooper Jr; meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics:
> Create graphics task
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Friday, October 12, 2012 12:58 AM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create
> > graphics task
> >
> > * Create graphics task that groups the various packages from
> the
> > Graphics SDK
> >   recipe.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../tasks/task-arago-tisdk-graphics-sdk-target.bb  |   11
> > +++++++++++
> >  .../tasks/task-arago-tisdk-graphics.bb             |   17
> > +++++++++++++++++
> >  2 files changed, 28 insertions(+), 0 deletions(-)  create mode
> 100644
> > meta-arago-distro/recipes-core/tasks/task-
> > arago-tisdk-graphics-sdk-target.bb
> >  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> > arago-tisdk-graphics.bb
> >
> > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-
> > core/tasks/task-arago-tisdk-graphics-sdk-target.bb
> > new file mode 100644
> > index 0000000..3de0809
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> > graphics-sdk-target.bb
> > @@ -0,0 +1,11 @@
> > +DESCRIPTION =3D "Task to install graphics binaries on sdk
> target"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> >
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > 4de20420"
> > +COMPATIBLE_MACHINE =3D "ti33x|omap3"
>=20
> Same issue with COMPATIBLE_MACHINE as your other recipe.  This
> will break devices like am180x-evm
>=20
> > +PR =3D "r0"
> > +
> > +inherit task
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    libgles-omap3-dev \
> > +"
> > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > tisdk-graphics.bb b/meta-arago-distro/recipes-core/tasks/task-
> > arago-tisdk-graphics.bb
> > new file mode 100644
> > index 0000000..2c0b3a6
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> > graphics.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "Task to install graphics binaries"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> >
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > 4de20420"
> > +COMPATIBLE_MACHINE =3D "ti33x|omap3"
>=20
> COMPATIBLE_MACHINE issue
>=20
> > +PR =3D "r0"
> > +
> > +inherit task
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    libgles-omap3 \
> > +    libgles-omap3-blitwsegl \
> > +    libgles-omap3-flipwsegl \
> > +    libgles-omap3-frontwsegl \
> > +    libgles-omap3-linuxfbwsegl \
> > +    libgles-omap3-rawdemos \
> > +    omap3-sgx-modules \
> > +"
>=20
> Where are the Qt example applications like qt-tstat, qml-
> playground, etc?  Are you putting those into a different task?
>=20
> Where is the sdk-host task to install the example application
> sources in the case of qt-tstat, etc being installed by this
> task?
>=20
> Franklin:
> Qt-tstat is being replaced with our new thermostat demo. I am
> going to work with Dave on that recipe when I get back.
> Qml-playground is currently having build issues with the new
> version of qt so I have not created that recipe yet.
>=20
> I am not placing the Qt demos inside of the graphics task. Qt-
> tstat doesn't require opengl and qml-playground looks like it can
> be used without opengl.
> I will probably create a task-arago-tisdk-qte recipe that adds
> task-arago-qte and any extra qt demos we will likely have in the
> future. Also a corresponding  task-arago-qte-sdk-target/host
> recipe.
>=20
> Also you said "etc" above. What other Qt demos am I missing?

I was thinking of the other Qt demos like deform.  Perhaps you have those i=
n your matrix task?

>=20
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

