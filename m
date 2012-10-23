Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9929C529AA
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 00:01:05 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9N014Dv024834;
	Mon, 22 Oct 2012 19:01:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9N014rf026464;
	Mon, 22 Oct 2012 19:01:04 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 22 Oct 2012 19:01:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create
	graphics task
Thread-Index: AQHNqDo2FSGlgBI37kuulA+5ZdE6mpe2BMgAgAiX7hCAANB1gIAGQQoggABVWwCAAA5lkA==
Date: Tue, 23 Oct 2012 00:01:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C30978C@DFLE09.ent.ti.com>
References: <1350021454-12557-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015925C3D5@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C306CB0@DFLE09.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015926D377@DLEE12.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C3093DF@DFLE09.ent.ti.com>
	<20121022180729.GP30921@edge>
In-Reply-To: <20121022180729.GP30921@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Tue, 23 Oct 2012 00:01:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, October 22, 2012 1:08 PM
To: Cooper Jr., Franklin
Cc: Maupin, Chase; Franklin S. Cooper Jr; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create graphic=
s task

On Mon, Oct 22, 2012 at 06:05:37PM +0000, Cooper Jr., Franklin wrote:
>=20
>=20
> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, October 18, 2012 8:32 AM
> To: Cooper Jr., Franklin; Franklin S. Cooper Jr;=20
> meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create=20
> graphics task
>=20
>=20
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Thursday, October 18, 2012 1:26 AM
> > To: Maupin, Chase; Franklin S. Cooper Jr; meta-arago@arago-=20
> > project.org
> > Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics:
> > Create graphics task
> >=20
> >=20
> >=20
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Friday, October 12, 2012 9:52 PM
> > To: Franklin S. Cooper Jr; meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: RE: [meta-arago] [PATCH] task-arago-tisdk-graphics:
> > Create graphics task
> >=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> > > bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> > > Sent: Friday, October 12, 2012 12:58 AM
> > > To: meta-arago@arago-project.org
> > > Cc: Cooper Jr., Franklin
> > > Subject: [meta-arago] [PATCH] task-arago-tisdk-graphics: Create=20
> > > graphics task
> > >
> > > * Create graphics task that groups the various packages from
> > the
> > > Graphics SDK
> > >   recipe.
> > >
> > > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > > ---
> > >  .../tasks/task-arago-tisdk-graphics-sdk-target.bb  |   11
> > > +++++++++++
> > >  .../tasks/task-arago-tisdk-graphics.bb             |   17
> > > +++++++++++++++++
> > >  2 files changed, 28 insertions(+), 0 deletions(-)  create mode
> > 100644
> > > meta-arago-distro/recipes-core/tasks/task-
> > > arago-tisdk-graphics-sdk-target.bb
> > >  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> > > arago-tisdk-graphics.bb
> > >
> > > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-=20
> > > core/tasks/task-arago-tisdk-graphics-sdk-target.bb
> > > new file mode 100644
> > > index 0000000..3de0809
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> > > graphics-sdk-target.bb
> > > @@ -0,0 +1,11 @@
> > > +DESCRIPTION =3D "Task to install graphics binaries on sdk
> > target"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D
> > >
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > > 4de20420"
> > > +COMPATIBLE_MACHINE =3D "ti33x|omap3"
> >=20
> > Same issue with COMPATIBLE_MACHINE as your other recipe.  This will=20
> > break devices like am180x-evm
> >=20
> > > +PR =3D "r0"
> > > +
> > > +inherit task
> > > +
> > > +RDEPENDS_${PN} =3D "\
> > > +    libgles-omap3-dev \
> > > +"
> > > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> > > tisdk-graphics.bb b/meta-arago-distro/recipes-core/tasks/task-
> > > arago-tisdk-graphics.bb
> > > new file mode 100644
> > > index 0000000..2c0b3a6
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> > > graphics.bb
> > > @@ -0,0 +1,17 @@
> > > +DESCRIPTION =3D "Task to install graphics binaries"
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D
> > >
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> > > 4de20420"
> > > +COMPATIBLE_MACHINE =3D "ti33x|omap3"
> >=20
> > COMPATIBLE_MACHINE issue
> >=20
> > > +PR =3D "r0"
> > > +
> > > +inherit task
> > > +
> > > +RDEPENDS_${PN} =3D "\
> > > +    libgles-omap3 \
> > > +    libgles-omap3-blitwsegl \
> > > +    libgles-omap3-flipwsegl \
> > > +    libgles-omap3-frontwsegl \
> > > +    libgles-omap3-linuxfbwsegl \
> > > +    libgles-omap3-rawdemos \
> > > +    omap3-sgx-modules \
> > > +"
> >=20
> > Where are the Qt example applications like qt-tstat, qml-=20
> > playground, etc?  Are you putting those into a different task?
> >=20
> > Where is the sdk-host task to install the example application=20
> > sources in the case of qt-tstat, etc being installed by this task?
> >=20
> > Franklin:
> > Qt-tstat is being replaced with our new thermostat demo. I am going=20
> > to work with Dave on that recipe when I get back.
> > Qml-playground is currently having build issues with the new version=20
> > of qt so I have not created that recipe yet.
> >=20
> > I am not placing the Qt demos inside of the graphics task. Qt- tstat=20
> > doesn't require opengl and qml-playground looks like it can be used=20
> > without opengl.
> > I will probably create a task-arago-tisdk-qte recipe that adds=20
> > task-arago-qte and any extra qt demos we will likely have in the=20
> > future. Also a corresponding  task-arago-qte-sdk-target/host recipe.
> >=20
> > Also you said "etc" above. What other Qt demos am I missing?
>=20
> I was thinking of the other Qt demos like deform.  Perhaps you have=20
> those in your matrix task?
>=20
> Franklin:
> Deform, animated tiles, calculator and browser are automatically built=20
> when Qt is built. Matrix-gui-qt4-demos contains the Matrix related=20
> files and scripts for those demos.

They may be built, but if you don't have them in any RDEPENDS, they won't b=
e installed...

Franklin:
I believe Qt has a RRECOMMENDS somewhere that automatically pulls in the qt=
4-embedded-examples and qt4-embedded-demos packages which includes the vari=
ous Qt demos. But in my new Qt task that I am working on I explicitly list =
these packages.

--
Denys

