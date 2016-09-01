Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DC929529E3
	for <meta-arago@arago-project.org>;
	Thu,  1 Sep 2016 13:01:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u81D1nbD002086
	for <meta-arago@arago-project.org>; Thu, 1 Sep 2016 08:01:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u81D1mwj028202
	for <meta-arago@arago-project.org>; Thu, 1 Sep 2016 08:01:48 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 1 Sep 2016 08:01:47 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] openmpacc: add dev dependency on clacc
Thread-Index: AQHSA7LhmA5t0uNcUkyeTqbEft+lm6BkDUSAgACNN+A=
Date: Thu, 1 Sep 2016 13:01:46 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142F9F6F@DFLE09.ent.ti.com>
References: <1472666993-16783-1-git-send-email-j-stiffler@ti.com>
	<20160831233557.GV10236@edge>
In-Reply-To: <20160831233557.GV10236@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] openmpacc: add dev dependency on clacc
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
X-List-Received-Date: Thu, 01 Sep 2016 13:01:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When will you be providing the release layer config?

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 31, 2016 7:36 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] openmpacc: add dev dependency on
> clacc
>=20
> Ack. I'll push outstanding patches tomorrow, after the release is out.
>=20
> On Wed, Aug 31, 2016 at 02:09:53PM -0400, Jacob Stiffler wrote:
> > * clacc is the openmpacc kernel compiler and is thus required when
> >   developing with the openmpacc package.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> > index 8fec0d1..a28a922 100644
> > --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> > +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
> > @@ -2,12 +2,13 @@ DESCRIPTION =3D "TI OpenMP-Acc host runtime and
> development packages"
> >
> >  include openmpacc.inc
> >
> > -PR =3D "${INC_PR}.0"
> > +PR =3D "${INC_PR}.1"
> >
> >  inherit cmake
> >
> >  DEPENDS =3D "boost boost-native opencl"
> >  RDEPENDS_${PN} +=3D "opencl-runtime"
> > +RDEPENDS_${PN}-dev +=3D "clacc"
> >
> >  S =3D "${WORKDIR}/git/host"
> >
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

