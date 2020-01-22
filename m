Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 500AD5298B
	for <meta-arago@arago-project.org>;
	Wed, 22 Jan 2020 21:54:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MLqcY9073939
	for <meta-arago@arago-project.org>; Wed, 22 Jan 2020 15:52:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579729958;
	bh=HfbkoeZGte0NUN3L9XpwBH5ClDVvYru+b73RE+wuVrQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EYNDiDStZfzwQCABAwZfo6PesLgdGdvisCFpOq6oyYqBM0095SpFvaLfUShVnnnBs
	Evf4zQ+IwaR/l+6oiXmjI8m3cbbgMnirslDMUDVkfyF9qGevQQo3CVZBBG8dYaJVk4
	kjI6DRL+dV43peWWNUZ4Spoy5yeqsdPduJ1dF/WA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MLqcSY009147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 22 Jan 2020 15:52:38 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 22 Jan 2020 15:52:37 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Wed, 22 Jan 2020 15:52:37 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [RFC][PATCH] opencl: fix packaging of library
Thread-Index: AQHV0TEJCmTrCFezUEaOoEdCz+BTRKf3mTSA//+eTqCAAGbBgP//m4hQ
Date: Wed, 22 Jan 2020 21:52:37 +0000
Message-ID: <dcfd4f436ea04527b405e813b2cce768@ti.com>
References: <1579702522-31819-1-git-send-email-j-stiffler@ti.com>
	<20200122213253.GC3658@beryl> <8b3e40008dfa4e88b27db0073f96844d@ti.com>
	<20200122215059.GE3658@beryl>
In-Reply-To: <20200122215059.GE3658@beryl>
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
X-List-Received-Date: Wed, 22 Jan 2020 21:54:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

