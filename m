Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3D2A2529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 19:00:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15J0klE011698
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 13:00:46 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15J0kRU021018
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 13:00:46 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 13:00:46 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] dual-camera-demo: Pull in latest commits
	of camera demo
Thread-Index: AQHPIpQgMSxTFiJ3ikylo1XLO5uFpZqnZnKA//+c+6A=
Date: Wed, 5 Feb 2014 19:00:45 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C61C8D4@DFLE08.ent.ti.com>
References: <1391625096-21593-1-git-send-email-fcooper@ti.com>
	<20140205185309.GR18784@edge>
In-Reply-To: <20140205185309.GR18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] dual-camera-demo: Pull in latest commits of camera demo
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 19:00:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 05, 2014 12:53 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] dual-camera-demo: Pull in latest commit=
s of
> camera demo
>=20
> On Wed, Feb 05, 2014 at 12:31:36PM -0600, Franklin S. Cooper Jr wrote:
> > * This demo is going to be frequently updated for a couple of weeks.
> > * Set to AUTOREV until this demo stops updating so often.
>=20
> We are in code freeze for the next release in about 2 weeks, so cannot do
> AUTOREV there...
[Franklin] I've been told that your team needs the latest version for valid=
ation so how do you want to handle this?
>=20
>=20
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../dual-camera-demo/dual-camera-demo_1.0.bb       |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual=
-
> camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-
> demo/dual-camera-demo_1.0.bb
> > index 12f42e5..ba891d5 100644
> > --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera=
-
> demo_1.0.bb
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-
> camera-demo_1.0.bb
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D
> "file://main.cpp;beginline=3D1;endline=3D18;md5=3D1e0116b09fc3d8f88
> >
> >  require recipes-core/matrix/matrix-gui-paths.inc
> >
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  BRANCH =3D "master"
> > -SRCREV =3D "af299a206482562ceae8aa690a8b6644a3e0a66e"
> > +SRCREV =3D "${AUTOREV}"
> >
> >  SRC_URI =3D "git://gitorious.org/dual-camera-demo/dual-camera-
> demo.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

