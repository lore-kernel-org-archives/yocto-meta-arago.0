Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id BFE5B52A0A
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 23:48:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAFNmSq2031860;
	Thu, 15 Nov 2012 17:48:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFNmSZX030643;
	Thu, 15 Nov 2012 17:48:28 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 15 Nov 2012 17:48:28 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-target: Add
	additional packages
Thread-Index: AQHNw4iWC+vd+/dr8UyVK7HVRS3VgJfr8AIA//+czaCAAGa2AP//nHPQ
Date: Thu, 15 Nov 2012 23:48:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C321B13@DFLE09.ent.ti.com>
References: <1353021956-18687-1-git-send-email-fcooper@ti.com>
	<1353021956-18687-3-git-send-email-fcooper@ti.com>
	<20121115233049.GK10887@edge>
	<8F29D6B095ED194EA1980491A5E029710C321AE8@DFLE09.ent.ti.com>
	<20121115234322.GM10887@edge>
In-Reply-To: <20121115234322.GM10887@edge>
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
X-List-Received-Date: Thu, 15 Nov 2012 23:48:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, November 15, 2012 5:43 PM
To: Cooper Jr., Franklin
Cc: Franklin S. Cooper Jr; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-target: Add =
additional packages

On Thu, Nov 15, 2012 at 06:39:43PM -0500, Cooper Jr., Franklin wrote:
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 15, 2012 5:31 PM
> To: Franklin S. Cooper Jr
> Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
> Subject: Re: [meta-arago] [PATCH 3/3] task-arago-qte-toolchain-target:=20
> Add additional packages
>=20
> On Thu, Nov 15, 2012 at 05:25:56PM -0600, Franklin S. Cooper Jr wrote:
> > * Adding additional packages that were automatically installed with Qt =
in
> >   classic Arago but not being done now.
> > * This insures the packages installed in the old SDK matches the new on=
e.
> >=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../tasks/task-arago-qte-toolchain-target.bb       |   16 ++++++++++++=
++--
> >  1 files changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git
> > a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-targ
> > et
> > .bb
> > b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-targ
> > et
> > .bb
> > index d919af2..2635c63 100644
> > ---
> > a/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-targ
> > et
> > .bb
> > +++ b/meta-arago-extras/recipes-core/tasks/task-arago-qte-toolchain-
> > +++ ta
> > +++ rget.bb
> > @@ -2,12 +2,20 @@ DESCRIPTION =3D "Target packages for Qt Embedded SDK"
> >  LICENSE =3D "MIT"
> >  ALLOW_EMPTY =3D "1"
> > =20
> > -PR =3D "r2"
> > +PR =3D "r3"
> > =20
> >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109=
285ec7b81fdeb3b58 \
> >                      file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> > =20
> > +
> > +QT_SGX_SUPPORT =3D "\
> > +    qt4-embedded-gles-dev \
>=20
> ^^^
>=20
> > +    libqt-embeddedopengl4-dev \
> > +    libqt-embeddedpvrqwswsegl4-dev \ "
> > +
> >  RDEPENDS_${PN} +=3D " \
> > +        qt4-embedded-dev \
>=20
> ^^^
> I still don't think we need this...
>=20
> Also, you have qt4-embedded-gles-dev conditionally, but qt4-embedded-dev =
unconditionally - is that right?
>=20
> Franklin:
> No. It should have been:
> ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles','=20
> qt4-embedded-gles-dev', ' qt4-embedded-dev ', d)} \

Ok, I thought so.

> And the qt4-embedded package doesn't exist. Why it doesn't complaining=20
> I am not sure but the content of the qt4-embedded-dev package is not=20
> being included in linux-devkit

But then again, I don't think we need it:
http://arago-project.org/pipermail/meta-arago/2012-November/000487.html

Franklin:
I must of missed that post. I did a couple of test and your right I do see =
those headers in other packages so it is probably alright to leave out.=20

>=20
> >          task-core-standalone-sdk-target \
> >          qt4-embedded-mkspecs \
> >          libqt-embeddedmultimedia4-dev \ @@ -30,4 +38,8 @@=20
> > RDEPENDS_${PN} +=3D " \
> >          libqt-embeddedwebkit4-dev \
> >          libqt-embeddedxml4-dev \
> >          libsqlite3-dev \
> > -        "
> > +        libqt-embeddedxmlpatterns4-dev \
> > +        libqt-embeddedmultimedia4-dev \
> > +        libqt-embeddeddeclarative4-dev \
> > +        ${@base_conditional('ARAGO_QT_PROVIDER',=20
> > +'qt4-embedded-gles','${QT_SGX_SUPPORT}', '', d)} \ "
> > --
> > 1.7.0.4
> >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

