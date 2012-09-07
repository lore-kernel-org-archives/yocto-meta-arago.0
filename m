Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 89755529A1
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 21:39:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q87LdHcL006390
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2012 16:39:17 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q87LdHOG016068
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2012 16:39:17 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 7 Sep 2012 16:39:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH]
	task-arago-tisdk-addons: Port task-arago-tisdk-addons-host from arago
	to meta-arago
Thread-Index: AQHNhkk2FXVTRvvDIUKCZSuqhUh2iJd/uSaA//+s68CAAA+3YA==
Date: Fri, 7 Sep 2012 21:39:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591DC70D@DLEE12.ent.ti.com>
References: <1346288619-21223-1-git-send-email-fcooper@ti.com>
	<20120907204001.GB13366@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C2B8F07@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2B8F07@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-distro][PATCH] task-arago-tisdk-addons: Port task-arago-tisdk-addons-host from arago to meta-arago
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
X-List-Received-Date: Fri, 07 Sep 2012 21:39:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I like the names.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Friday, September 07, 2012 3:46 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> tisdk-addons: Port task-arago-tisdk-addons-host from arago to
> meta-arago
>=20
> I think the following can work using your suggestion of removing
> tisdk. I think leaving arago is important to have a clear
> namespace.
> task-arago-addons
> task-arago-addons-sdk-host
> task-arago-addons-sdk-target
>=20
> After the patch queue is cleared up I can create a patch that
> renames everything.
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, September 07, 2012 3:40 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> tisdk-addons: Port task-arago-tisdk-addons-host from arago to
> meta-arago
>=20
> On Wed, Aug 29, 2012 at 08:03:38PM -0500, Franklin S Cooper Jr
> wrote:
> > * This is a initial port of task-arago-tisdk-addons-host from
> arago to meta-arago.
> >   In arago, this task was originally called task-arago-
> toolchain-tisdk-addons-host.
>=20
> I would agree that task-arago-toolchain-tisdk-addons-host is a
> very long name, but we need to clearly mark the tasks that are
> used for SDK/toolchain/devkit vs. the ones that are used for the
> filesystem/image.
>=20
> As an alternative, we can use task-arago-tisdk-sdk-host. I.e. all
> 3 would look
> like:
>=20
> task-arago-tisdk-addons
> task-arago-tisdk-addons-sdk-host
> task-arago-tisdk-addons-sdk-target
>=20
> The next step would be to start dropping "arago" and "tisdk"
> parts from the name... :)
>=20
> --
> Denys
>=20
>=20
> > * Remove references to Matrix applications since the new Matrix
> task should
> >   handle Matrix related applications
> >
> > Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> > ---
> >  .../tasks/task-arago-tisdk-addons-host.bb          |   21
> ++++++++++++++++++++
> >  .../recipes-core/tasks/task-arago-tisdk-addons.bb  |   17
> +++++++++------
> >  2 files changed, 31 insertions(+), 7 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-addons-host.bb
> >
> > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-addons-host.bb b/meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-addons-host.bb
> > new file mode 100644
> > index 0000000..3856197
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> addons-host.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION =3D "Task to install sources for additional
> utilities/demos for SDKs"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> > +PR =3D "r0"
> > +
> > +inherit task
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +UTILS =3D " \
> > +    am-sysinfo-src \
> > +    arm-benchmarks-src \
> > +"
> > +
> > +# Add pru and profibus sources for omapl138 devices
> > +UTILS_append_am180x-evm =3D " \
> > +    ti-pru-sw-examples-src \
> > +"
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    ${UTILS} \
> > +"
> > diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-addons.bb b/meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-addons.bb
> > index 789700d..167df12 100644
> > --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> addons.bb
> > +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> addons.bb
> > @@ -1,22 +1,25 @@
> >  DESCRIPTION =3D "Task to install additional utilities/demos for
> SDKs"
> > -PR =3D "r0"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> > +PR =3D "r1"
> >
> >  inherit task
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  UTILS =3D " \
> > -    matrix-gui-settings-demos \
> > -    matrix-gui-armbenchmarks-demos \
> > +    am-sysinfo \
> > +    dt \
> >      task-arago-test \
> >      gdbserver \
> > -    matrix-gui-oprofile-demos \
> > -    "
> > +    oprofile \
> > +    nbench-byte \
> > +    trace-cmd \
> > +    arm-benchmarks \
> > +"
> >
> >  # Add PRU examples for am180x-evm devices
> > -# UTILS_append_am180x-evm =3D " ti-pru-sw-examples"
> > +UTILS_append_am180x-evm =3D " ti-pru-sw-examples"
> >
> >  RDEPENDS_${PN} =3D "\
> >      ${UTILS} \
> > -    "
> > +"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

