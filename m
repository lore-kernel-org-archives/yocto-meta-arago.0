Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 5382752A0B
	for <meta-arago@arago-project.org>;
	Fri, 10 Jun 2016 15:46:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5AFkc4S015287
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 10:46:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5AFkcgu000923
	for <meta-arago@arago-project.org>; Fri, 10 Jun 2016 10:46:38 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Fri, 10 Jun 2016 10:46:37 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] tisdk-rootfs-image: add opencl-extra
	packagegroup
Thread-Index: AQHRwavz7DTzn7LnFkWk0J4V7F7eiJ/jLeEA//+s3+A=
Date: Fri, 10 Jun 2016 15:46:37 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958142B8BC0@DFLE09.ent.ti.com>
References: <1465407203-15939-1-git-send-email-j-stiffler@ti.com>
	<20160610154232.GF2466@edge>
In-Reply-To: <20160610154232.GF2466@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-rootfs-image: add opencl-extra packagegroup
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
X-List-Received-Date: Fri, 10 Jun 2016 15:46:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, June 10, 2016 11:43 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] tisdk-rootfs-image: add opencl-extra
> packagegroup
>=20
> Huh? Wasn't it meant to be added to "extra" rootfs image? Which it alread=
y
> is.
>=20

The "extra" rootfs image is the "server-extra" rootfs image, and only appli=
cable to keystone.=20

The opencl-extra packagegroup is also needed for dra7xx machines.

>=20
> On Wed, Jun 08, 2016 at 01:33:23PM -0400, Jacob Stiffler wrote:
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.b=
b
> b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> > index 98988b2..8747e52 100644
> > --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> > @@ -8,6 +8,7 @@ IMAGE_INSTALL +=3D "\
> >      packagegroup-arago-tisdk-qte \
> >      packagegroup-arago-tisdk-addons \
> >      ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-
> arago-tisdk-opencl','',d)} \
> > +    ${@bb.utils.contains('MACHINE_FEATURES','opencl','packagegroup-
> arago-tisdk-opencl-extra','',d)} \
> >      packagegroup-arago-tisdk-connectivity \
> >      packagegroup-arago-tisdk-crypto \
> >      packagegroup-arago-tisdk-matrix \
> > --
> > 2.7.4
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

