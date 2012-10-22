Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7698252AB1
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 18:05:39 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MI5cSD011492;
	Mon, 22 Oct 2012 13:05:38 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MI5cUR011700;
	Mon, 22 Oct 2012 13:05:38 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 22 Oct 2012 13:05:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create
	graphics task
Thread-Index: AQHNqDo2FSGlgBI37kuulA+5ZdE6mpe2BMgAgAiX7hCAANB1gIAGQQog
Date: Mon, 22 Oct 2012 18:05:37 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3093DF@DFLE09.ent.ti.com>
References: <1350021454-12557-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C3D5@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C306CB0@DFLE09.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015926D377@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015926D377@DLEE12.ent.ti.com>
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
X-List-Received-Date: Mon, 22 Oct 2012 18:05:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Maupin, Chase=20
Sent: Thursday, October 18, 2012 8:32 AM
To: Cooper Jr., Franklin; Franklin S. Cooper Jr; meta-arago@arago-project.o=
rg
Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create graphic=
s task


> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Thursday, October 18, 2012 1:26 AM
> To: Maupin, Chase; Franklin S. Cooper Jr; meta-arago@arago-=20
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
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > Sent: Friday, October 12, 2012 12:58 AM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create=20
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
> > tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-=20
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
> Same issue with COMPATIBLE_MACHINE as your other recipe.  This will=20
> break devices like am180x-evm
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
> Where are the Qt example applications like qt-tstat, qml- playground,=20
> etc?  Are you putting those into a different task?
>=20
> Where is the sdk-host task to install the example application sources=20
> in the case of qt-tstat, etc being installed by this task?
>=20
> Franklin:
> Qt-tstat is being replaced with our new thermostat demo. I am going to=20
> work with Dave on that recipe when I get back.
> Qml-playground is currently having build issues with the new version=20
> of qt so I have not created that recipe yet.
>=20
> I am not placing the Qt demos inside of the graphics task. Qt- tstat=20
> doesn't require opengl and qml-playground looks like it can be used=20
> without opengl.
> I will probably create a task-arago-tisdk-qte recipe that adds=20
> task-arago-qte and any extra qt demos we will likely have in the=20
> future. Also a corresponding  task-arago-qte-sdk-target/host recipe.
>=20
> Also you said "etc" above. What other Qt demos am I missing?

I was thinking of the other Qt demos like deform.  Perhaps you have those i=
n your matrix task?

Franklin:
Deform, animated tiles, calculator and browser are automatically built when=
 Qt is built. Matrix-gui-qt4-demos contains the Matrix related files and sc=
ripts for those demos.
>=20
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

