Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D91C752A6D
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 18:47:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OIlCm3008458
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 12:47:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OIlC4q020972
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 12:47:12 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 24 Jan 2014 12:47:12 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ts-calibrate-init: Fix QA warning
Thread-Index: AQHPGSYjeXVvCMWPEk2xFtnZZwQ0O5qUmRiA//+dxsA=
Date: Fri, 24 Jan 2014 18:47:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C610EB6@DFLE08.ent.ti.com>
References: <1390588035-27597-1-git-send-email-fcooper@ti.com>
	<20140124183758.GM30525@edge>
In-Reply-To: <20140124183758.GM30525@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ts-calibrate-init: Fix QA warning
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
X-List-Received-Date: Fri, 24 Jan 2014 18:47:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, January 24, 2014 12:38 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] ts-calibrate-init: Fix QA warning
>=20
> http://arago-project.org/pipermail/meta-arago/2014-January/002846.html
[Franklin] Somehow I missed that. Take this patch as an indirect ack on you=
r patch then :)
>=20
> On Fri, Jan 24, 2014 at 12:27:15PM -0600, Franklin S. Cooper Jr wrote:
> > * RDEPENDS statements should be package specific.
> > * Set the REDEPENDS to ${PN} to fix the QA warning message.
> > ---
> >  .../tslib/ts-calibrate-init_1.0.bb                 |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > index 7148034..98588d3 100644
> > ---
> > a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
> > +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.b
> > +++ b
> > @@ -1,12 +1,12 @@
> >  # This recipe installs an init script that can be used to invoke
> > ts_calibrate  # on systems that need this done during the boot sequence=
.
> >  DESCRIPTION =3D "TS calibration init script"
> > -RDEPENDS +=3D "tslib"
> > +RDEPENDS_${PN} +=3D "tslib"
> >
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://init;beginline=3D2;endline=3D11;md5=3D4b2e3b15f01cf63d2cb7988afdc=
c6c60
> "
> >
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  S =3D "${WORKDIR}"
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

