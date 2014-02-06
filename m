Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4DAF2529AA
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 00:15:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s160FEjG010263
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 18:15:14 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s160FEto002806
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 18:15:14 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 18:15:14 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/6] tisdk-amsdk-sdk-host: remove pinmux
	for keystone devices
Thread-Index: AQHPIs8CVQ75sVWkAU6k6JmR+vKxwZqnWa5g
Date: Thu, 6 Feb 2014 00:15:13 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549F0C39@DLEE11.ent.ti.com>
References: <1391630646-9727-1-git-send-email-Chase.Maupin@ti.com>
	<1391630646-9727-3-git-send-email-Chase.Maupin@ti.com>
	<20140206000418.GD18784@edge>
In-Reply-To: <20140206000418.GD18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/6] tisdk-amsdk-sdk-host: remove pinmux for keystone devices
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
X-List-Received-Date: Thu, 06 Feb 2014 00:15:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, February 05, 2014 7:04 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 3/6] tisdk-amsdk-sdk-host: remove pinmux
> for keystone devices
>=20
> Sam,
>=20
> Which recipe do you currently use to build linux-devkit for MCSDK? I'm
> trying
> to see if this recipe is in your path or not.=20
[Sam] linux-devkit for MCSDK uses  meta-arago/meta-arago-distro/recipes-cor=
e/meta/meta-toolchain-arago-tisdk.bb
> But either way we need to unify
> these thinks a bit better...
[Sam] I agree.
 > --
> Denys
>=20
>=20
> On Wed, Feb 05, 2014 at 02:04:03PM -0600, Chase Maupin wrote:
> > * Keystone devices do not have a pinmux utility currently so
> >   do not try to package one.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> > index cb95ae9..e5d1be5 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-amsdk-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-amsdk-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install additional scripts and applications i=
nto the
> SDK"
> >  LICENSE =3D "MIT"
> > -PR =3D "r17"
> > +PR =3D "r18"
> >
> >  inherit packagegroup
> >
> > @@ -14,6 +14,7 @@ KERNEL_SRC =3D
> "${PREFERRED_PROVIDER_virtual/kernel}-src"
> >  TOOLS =3D "pinmux-utility"
> >  TOOLS_omap-a15 =3D ""
> >  TOOLS_ti43x =3D ""
> > +TOOLS_keystone =3D ""
> >  TOOLS_append_am37x-evm =3D " flash-utility"
> >  TOOLS_append_am3517-evm =3D " flash-utility"
> >
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

