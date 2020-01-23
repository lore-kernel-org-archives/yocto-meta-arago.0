Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1DF5452A1B
	for <meta-arago@arago-project.org>;
	Thu, 23 Jan 2020 15:25:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NFO3mC067031
	for <meta-arago@arago-project.org>; Thu, 23 Jan 2020 09:24:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579793043;
	bh=xCfXGe/dlFZUj7Oq0u/jw2ejGsQOyvkytKmJLU0BvRU=;
	h=From:To:CC:Subject:Date:References;
	b=S51fUXSl1isq6r3lJJpw9tLCj+4y9jDea+DeDXi3iCEEqY44SCVzktIyezHSniSRC
	o4krLUFny5joSSJCGH49Bn0KQ154CgnrExgBYiSMNvcssgQ3MBWd1xOH9TOLjtrOwK
	+J/Ni0lomX/msFxUgG5MttAOW4DIpnk4TARHgD4M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NFO3XN075666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 23 Jan 2020 09:24:03 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 23 Jan 2020 09:24:03 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Thu, 23 Jan 2020 09:24:03 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [RFC][PATCH] opencl: fix packaging of library
Thread-Index: AQHV0TEJCmTrCFezUEaOoEdCz+BTRKf3mTSA//+eTqCAAGbBgP//m4hQgAEjhgA=
Date: Thu, 23 Jan 2020 15:24:03 +0000
Message-ID: <59b432635324423fae565e2a7c695410@ti.com>
References: <1579702522-31819-1-git-send-email-j-stiffler@ti.com>
	<20200122213253.GC3658@beryl> <8b3e40008dfa4e88b27db0073f96844d@ti.com>
	<20200122215059.GE3658@beryl> 
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC][PATCH] opencl: fix packaging of library
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
X-List-Received-Date: Thu, 23 Jan 2020 15:25:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This fixes the error.=20


-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, January 22, 2020 4:53 PM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [RFC][PATCH] opencl: fix packaging of library

I had started a clean build, but I think I can stop it and recreate the pro=
blem using the sstate mirror.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, January 22, 2020 4:51 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [RFC][PATCH] opencl: fix packaging of library

Can you try removing opencl from SIGGEN_EXCLUDERECIPES_ABISAFE in layer.con=
f=20
of meta-arago-extras - see if that helps?

Denys


On Wed, Jan 22, 2020 at 04:44:17PM -0500, Stiffler, Jacob wrote:
> I have been struggling with the same. I guess this is because the library=
=20
> switched packages? How can this be handled without a clean build?
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys=20
> Sent: Wednesday, January 22, 2020 4:33 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [RFC][PATCH] opencl: fix packaging of library
>=20
> Hmm, after applying this patch and rebuilding with sstate, it fails in pa=
ckage=20
> dependencies:
>=20
> nothing provides libopencl1 >=3D 1.2.00.02 needed by ...
>=20
> I'll try making a clean build next.
>=20
> Denys
>=20
>=20
> On Wed, Jan 22, 2020 at 09:15:22AM -0500, Jacob Stiffler wrote:
> > * Add daemon conffiles and library to runtime package.
> >=20
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arag=
o-extras/recipes-ti/ocl/opencl_git.bb
> > index 59cb8ca..502e1cf 100644
> > --- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > +++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
> > @@ -4,7 +4,7 @@ LICENSE =3D "BSD"
> > =20
> >  include ocl.inc
> > =20
> > -PR =3D "${INC_PR}.1"
> > +PR =3D "${INC_PR}.2"
> > =20
> >  inherit cmake systemd
> > =20
> > @@ -80,7 +80,7 @@ do_install_append() {
> >  SYSTEMD_SERVICE_${PN}-runtime =3D "ti-mct-daemon.service"
> >  SYSTEMD_AUTO_ENABLE_${PN}-runtime =3D "${@oe.utils.conditional("RESERV=
E_CMEM", "1", "enable", "disable", d)}"
> > =20
> > -FILES_${PN}-runtime +=3D "${bindir} ${systemd_system_unitdir}"
> > +FILES_${PN}-runtime +=3D "${bindir} ${systemd_system_unitdir} ${syscon=
fdir}/ti-mctd ${libdir}/lib*${SOLIBS}"
> > =20
> >  FILES_${PN} +=3D " \
> >      ${datadir}/ti/opencl/* \
> > --=20
> > 2.7.4
> >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

