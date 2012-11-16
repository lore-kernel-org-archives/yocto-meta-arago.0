Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EBDF2529EF
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 15:22:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAGFMSMT020873;
	Fri, 16 Nov 2012 09:22:28 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAGFMSb7012890;
	Fri, 16 Nov 2012 09:22:28 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 16 Nov 2012 09:22:27 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>, "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-target: Add
	additional packages
Thread-Index: AQHNw4iWC+vd+/dr8UyVK7HVRS3VgJfr8AIA//+czaCAAQg+AA==
Date: Fri, 16 Nov 2012 15:22:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592B0F11@DLEE12.ent.ti.com>
References: <1353021956-18687-1-git-send-email-fcooper@ti.com>
	<1353021956-18687-3-git-send-email-fcooper@ti.com>
	<20121115233049.GK10887@edge>
	<8F29D6B095ED194EA1980491A5E029710C321AE8@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C321AE8@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/3] task-arago-qte-toolchain-target: Add additional packages
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
X-List-Received-Date: Fri, 16 Nov 2012 15:22:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Likely because your recipe RPROVIDES qt4-embedded and qt4-embedded-dev

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
> Sent: Thursday, November 15, 2012 5:40 PM
> To: Dmytriyenko, Denys; Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-
> target: Add additional packages
>=20
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 15, 2012 5:31 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-
> target: Add additional packages
>=20
> On Thu, Nov 15, 2012 at 05:25:56PM -0600, Franklin S. Cooper Jr
> wrote:
> > * Adding additional packages that were automatically installed
> with Qt in
> >   classic Arago but not being done now.
> > * This insures the packages installed in the old SDK matches
> the new one.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../tasks/task-arago-qte-toolchain-target.bb       |   16
> ++++++++++++++--
> >  1 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-arago-extras/recipes-core/tasks/task-arago-qte-
> toolchain-target
> > .bb
> > b/meta-arago-extras/recipes-core/tasks/task-arago-qte-
> toolchain-target
> > .bb
> > index d919af2..2635c63 100644
> > ---
> > a/meta-arago-extras/recipes-core/tasks/task-arago-qte-
> toolchain-target
> > .bb
> > +++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-
> toolchain-ta
> > +++ rget.bb
> > @@ -2,12 +2,20 @@ DESCRIPTION =3D "Target packages for Qt
> Embedded SDK"
> >  LICENSE =3D "MIT"
> >  ALLOW_EMPTY =3D "1"
> >
> > -PR =3D "r2"
> > +PR =3D "r3"
> >
> >  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58
> \
> >
> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4
> de20420"
> >
> > +
> > +QT_SGX_SUPPORT =3D "\
> > +    qt4-embedded-gles-dev \
>=20
> ^^^
>=20
> > +    libqt-embeddedopengl4-dev \
> > +    libqt-embeddedpvrqwswsegl4-dev \
> > +"
> > +
> >  RDEPENDS_${PN} +=3D " \
> > +        qt4-embedded-dev \
>=20
> ^^^
> I still don't think we need this...
>=20
> Also, you have qt4-embedded-gles-dev conditionally, but qt4-
> embedded-dev unconditionally - is that right?
>=20
> Franklin:
> No. It should have been:
> ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','
> qt4-embedded-gles-dev', ' qt4-embedded-dev ', d)} \
>=20
> And the qt4-embedded package doesn't exist. Why it doesn't
> complaining I am not sure but the content of the qt4-embedded-dev
> package is not being included in linux-devkit
>=20
>=20
> >          task-core-standalone-sdk-target \
> >          qt4-embedded-mkspecs \
> >          libqt-embeddedmultimedia4-dev \
> > @@ -30,4 +38,8 @@ RDEPENDS_${PN} +=3D " \
> >          libqt-embeddedwebkit4-dev \
> >          libqt-embeddedxml4-dev \
> >          libsqlite3-dev \
> > -        "
> > +        libqt-embeddedxmlpatterns4-dev \
> > +        libqt-embeddedmultimedia4-dev \
> > +        libqt-embeddeddeclarative4-dev \
> > +        ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-
> embedded-gles','${QT_SGX_SUPPORT}', '', d)} \
> > +"
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

