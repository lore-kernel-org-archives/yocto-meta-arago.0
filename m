Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 3F982529AA
	for <meta-arago@arago-project.org>;
	Fri, 16 Sep 2016 09:54:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8G9sZ16012333
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 04:54:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8G9sZh0001189
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 04:54:35 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 16 Sep 2016 04:54:34 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/3] oc: bump SRCREV to version 1.1.10.0
Thread-Index: AQHSD3/78pNwNGFEJU27myKtaEO91qB7Q7gAgACdmCA=
Date: Fri, 16 Sep 2016 09:54:34 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142FE688@DFLE09.ent.ti.com>
References: <1473964509-21429-1-git-send-email-j-stiffler@ti.com>
	<1473964509-21429-2-git-send-email-j-stiffler@ti.com>
	<20160915192917.GU29658@edge>
In-Reply-To: <20160915192917.GU29658@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] oc: bump SRCREV to version 1.1.10.0
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
X-List-Received-Date: Fri, 16 Sep 2016 09:54:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, September 15, 2016 3:29 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/3] oc: bump SRCREV to version 1.1.10.0
>=20
> > oc: bump SRCREV to version 1.1.10.0
>=20
> Should it be ocl in the subject?
>=20

Yes. And I just found out a 1.1.10.1 version is happening. I'll resubmit wi=
th the new SRCREV and fix the comit message.

>=20
> On Thu, Sep 15, 2016 at 02:35:08PM -0400, Jacob Stiffler wrote:
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-
> extras/recipes-ti/ocl/ocl.inc
> > index 4df0c9e..1937a3f 100644
> > --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> > +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> > @@ -1,4 +1,4 @@
> > -PV =3D "1.1.9.1"
> > +PV =3D "1.1.10.0"
> >  INC_PR =3D "r0"
> >
> >  LIC_FILES_CHKSUM =3D
> "file://../debian/copyright;md5=3D2e3965a73a8a49c23836467266120dff"
> > @@ -9,7 +9,7 @@ OCL_GIT_URI =3D "git://git.ti.com/opencl/ti-opencl.git"
> >  OCL_GIT_PROTOCOL =3D "git"
> >  OCL_GIT_BRANCH =3D "master"
> >
> > -OCL_SRCREV =3D "aa89b7359d6328e98fa80c55c3b73543c53a1bbc"
> > +OCL_SRCREV =3D "b2b6c17a40bc79f49b6cdc44b6a42faeb56a6d2f"
> >
> >  BRANCH =3D "${OCL_GIT_BRANCH}"
> >  SRC_URI =3D
> "${OCL_GIT_URI};protocol=3D${OCL_GIT_PROTOCOL};branch=3D${BRANCH}"
> > --
> > 2.7.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

