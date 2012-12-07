Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1BB3852A43
	for <meta-arago@arago-project.org>;
	Fri,  7 Dec 2012 13:59:49 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB7DxmTK001922
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2012 07:59:48 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB7DxmSa010866
	for <meta-arago@arago-project.org>; Fri, 7 Dec 2012 07:59:48 -0600
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 7 Dec 2012 07:59:48 -0600
From: "Hernandez, Carlos" <ceh@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] Define arago-test-image
Thread-Index: AQHN1ABP8vGJC9P5b0C+aer/MGSZB5gM1gGAgACHSIA=
Date: Fri, 7 Dec 2012 13:59:47 +0000
Message-ID: <32B5D12402BE454796026F6AC58AA86E2E698299@DLEE09.ent.ti.com>
References: <50BFA673.6040800@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C342343@DFLE09.ent.ti.com>
	<50C0FFE3.2090304@ti.com> <20121206203356.GD17596@denix.org>
	<50C11ADD.5010803@ti.com> <20121206235213.GE17596@denix.org>
In-Reply-To: <20121206235213.GE17596@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v2] Define arago-test-image
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
X-List-Received-Date: Fri, 07 Dec 2012 13:59:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The main reason to have task-arago-test-addons is to avoid affecting TISDK =
builds that already include task-arago-test.=20
I also don't see any harm in having both, if give us more flexibility.

Carlos

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, December 06, 2012 6:52 PM
> To: Hernandez, Carlos
> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org; Cooper Jr., Frankli=
n
> Subject: Re: [meta-arago] [PATCH v2] Define arago-test-image
>=20
> On Thu, Dec 06, 2012 at 05:23:25PM -0500, Carlos Hernandez wrote:
> > Please find v2 attached.
>=20
> Sorry, but any reason you need a whole new task (task-arago-test-addons)
> in
> addition to the one you are already adding for the test (task-arago-test)=
?
> Right now there's only 1 package listed there (bridge-utils) - do you pla=
n
> on
> addin more to that task later on?
>=20
> Denys
>=20
> > Thanks, Carlos On 12/06/2012 03:33 PM, Denys Dmytriyenko wrote:
> > > On Thu, Dec 06, 2012 at 03:28:19PM -0500, Carlos Hernandez wrote:
> > >> Franklin,
> > >>
> > >> That's a fair point. I did it to keep some independence between the
> > >> arago-test and arago-tisdk images but I'm OK including
> > >> task-arago-tisdk-addons instead of task-arago-test-addons. I guess w=
e
> > >> could separate into different task files only if needed in the futur=
e.
> > >>
> > >> One task that will need to be added to task-arago-tisdk-addons is
> > >> bridge-utils.
> > >> bridge-utils is currently only included by task-arago-test-addons.
> > >>
> > >> Let me know if you are OK adding bridge-utils and I can submit
> another
> > >> patch with these changes.
> > > You could also add bridge-utils to your task-arago-test recipe.
> > >
> > > Or, you could just add bridge-utils besides the regular task-arago-
> tisdk-addons
> > > to IMAGE_INSTALL in your test image recipe:
> > >
> > > IMAGE_INSTALL +=3D "\
> > >     task-arago-base \
> > >     task-arago-console \
> > >     task-arago-base-tisdk \
> > >     task-arago-tisdk-connectivity \
> > >     task-arago-tisdk-crypto \
> > >     task-arago-tisdk-multimedia \
> > >     task-arago-tisdk-addons \
> > >     task-arago-test \
> > >     bridge-utils \
> > >     "
> > >
> > > Denys
> > >
> > >> Thanks for the review,
> > >> Carlos
> > >>
> > >> On 12/06/2012 02:30 PM, Cooper Jr., Franklin wrote:
> > >>> Can't task-arago-tisdk-addons be used instead of creating this new
> task-arago-test-addons recipe? The majority of the content in arago-test-
> addons is provided by task-arago-addons and the remainder is provided by
> tasks your pulling into the test image recipe. Other than having a
> slightly bloated file system with additional tools/libraries is there any
> reason you can't reuse some of the other tasks?
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >>>> bounces@arago-project.org] On Behalf Of Hernandez, Carlos
> > >>>> Sent: Wednesday, December 05, 2012 1:54 PM
> > >>>> To: meta-arago@arago-project.org
> > >>>> Subject: [meta-arago] [PATCH] Define arago-test-image
> > >>>>
> > >>>> This filesystem image includes test appplications used by Linux
> validation team.
> > >>>>
> > >>>> Please consider it for meta-arago project. Thanks, Carlos
> > >>>>
> > >>>>
> > >>>>
> > >> _______________________________________________
> > >> meta-arago mailing list
> > >> meta-arago@arago-project.org
> > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >>
> >
>=20
> > From 390814230637c81f4c5e95b49f869d40857e3663 Mon Sep 17 00:00:00 2001
> > From: Carlos Hernandez <ceh@ti.com>
> > Date: Thu, 6 Dec 2012 17:31:45 -0500
> > Subject: [PATCH] Define arago-test-image
> >
> > This filesystem image includes test appplications used by
> > Linux validation team.
> >
> > Signed-off-by: Carlos Hernandez <ceh@ti.com>
> > ---
> >  .../recipes-core/images/arago-test-image.bb        |   22
> ++++++++++++++++++++
> >  .../recipes-core/tasks/task-arago-test-addons.bb   |   22
> ++++++++++++++++++++
> >  2 files changed, 44 insertions(+), 0 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-core/images/arago-test-
> image.bb
> >  create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-
> test-addons.bb
> >
> > diff --git a/meta-arago-distro/recipes-core/images/arago-test-image.bb
> b/meta-arago-distro/recipes-core/images/arago-test-image.bb
> > new file mode 100644
> > index 0000000..3f52729
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
> > @@ -0,0 +1,22 @@
> > +# Arago System Test image
> > +# gives you test applications
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> > +
> > +require arago-image.inc
> > +
> > +COMPATIBLE_MACHINE =3D
> "omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
> > +
> > +IMAGE_INSTALL +=3D "\
> > +    task-arago-base \
> > +    task-arago-console \
> > +    task-arago-base-tisdk \
> > +    task-arago-tisdk-connectivity \
> > +    task-arago-tisdk-crypto \
> > +    task-arago-tisdk-multimedia \
> > +    task-arago-tisdk-addons \
> > +    task-arago-test \
> > +    task-arago-test-addons \
> > +    "
> > +
> > +export IMAGE_BASENAME =3D "arago-test-image"
> > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-test-
> addons.bb b/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.b=
b
> > new file mode 100644
> > index 0000000..00e9ff6
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-test-addons.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "Task to install additional utilities/demos for test
> image"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> > +PR =3D "r0"
> > +
> > +ALLOW_EMPTY =3D "1"
> > +
> > +inherit task
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +
> > +TEST_ADDONS =3D " \
> > +    bridge-utils \
> > +    "
> > +
> > +TEST_ADDONS_TI =3D " \
> > +    "
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    ${TEST_ADDONS} \
> > +    ${TEST_ADDONS_TI} \
> > +    "
> > --
> > 1.7.0.4
> >
>=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


