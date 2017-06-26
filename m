Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8CC9A52A56
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 19:00:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QJ0vXP031704
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 14:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498503657;
	bh=6Pr2oJkDVrwFERMHMwIcVooJJ7bNbcl+Yz52ox+eIto=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Ts+/omS9REYmUo04vrzAO+77FGGDsjdXeiyrVyOgMF8cuIJTYyez39TXsma3Kvp32
	BwrHGNIyhqOz5JEd3/eylCny5TJTVrYClEX0+FxgG5YgNf8g6FcAHZj7dpKYFkieg4
	IVR2icPJquhGmC6+AuB4WCt62XJ39+b1Vm4fmgE4=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QJ0vXR019693
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 14:00:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Mon, 26 Jun 2017 14:00:57 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH v3 2/2] arago-tisdk-addons:
	Add big-data-ipc-demo for host linux
Thread-Index: AQHS7qOzsL+vMDmyVUK95PuIdZgw6aI3z8mA//+v0RA=
Date: Mon, 26 Jun 2017 19:00:56 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058643C5B@DLEE11.ent.ti.com>
References: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
	<1498498997-30316-2-git-send-email-sam.nelson@ti.com>
	<20170626184713.GD14665@edge>
In-Reply-To: <20170626184713.GD14665@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH v3 2/2] arago-tisdk-addons: Add big-data-ipc-demo for host linux
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
X-List-Received-Date: Mon, 26 Jun 2017 19:00:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, June 26, 2017 2:47 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/master][PATCH v3 2/2] arago-tisdk-addons=
:
> Add big-data-ipc-demo for host linux
>=20
> On Mon, Jun 26, 2017 at 01:43:17PM -0400, Sam Nelson wrote:
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  |
> > 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-addons.bb
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-addons.bb
> > index c623b37..360890b 100644
> > ---
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd
> > k-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > +++ tisdk-addons.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
> >  LICENSE =3D "MIT"
> > -PR =3D "r60"
> > +PR =3D "r61"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -119,7 +119,10 @@ EXTRA_PACKAGES_omapl138 =3D " \
> >
> >  EXTRA_PACKAGES_append_ti33x =3D " voxelsdk"
> >  EXTRA_PACKAGES_append_ti43x =3D " voxelsdk"
> > -EXTRA_PACKAGES_append_omap-a15 =3D " voxelsdk"
> > +EXTRA_PACKAGES_append_omap-a15 =3D " voxelsdk \
> > +                                   big-data-ipc-demo-linux \
> > +                                   big-data-ipc-demo-linux-firmware \
> > +"
>=20
> I only see you are adding it for omap-a15, but not keystone - on purpose?

Yes. Currently the support is only for omap-a15.  Keystone will be added so=
on.

>=20
>=20
> >  EXTRA_PACKAGES_append_omap-a15 =3D " ti-ipc-examples-linux"
> >  EXTRA_PACKAGES_append_keystone =3D " ti-ipc-examples-linux"
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

