Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D75BF52ACB
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 15:47:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41FlNc1030067
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 10:47:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41FlMc0009041
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 10:47:22 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 1 May 2015 10:47:21 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2015.04 build
	2015-04-30_22-00-51
Thread-Index: AQHQg7swyEk1qvM66kefq2765CvgtJ1nehsA//+0HACAAGJ5gP//rx1AgABWNQD//60JAA==
Date: Fri, 1 May 2015 15:47:21 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814129419@DFLE09.ent.ti.com>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
	<20150501135817.GW29290@edge> <55438D20.6020203@ti.com>
	<20150501151906.GY29290@edge>
	<4B26FB5A64EBA14C87266869E037F958141293D2@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C881CD5@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C881CD5@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
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
X-List-Received-Date: Fri, 01 May 2015 15:47:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

So in summary: full drm not supported =3D> libdrm should not be included =
=3D> libgstdrm should not be built =3D> libgstwaylandsink should not be bui=
lt =3D> wayland should be removed from PACKAGE_CONFIG for ti33x and ti43x?

Is this logic sound?

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, May 01, 2015 11:38 AM
To: Stiffler, Jacob; Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-30_22-=
00-51

All platforms are using DRM.

However, am335x and am437x are using what is called FBDEV emulation. Fbdev =
is an emulation layer that routes traditional fbdev calls to DRM. From a us=
erspace perspective it appears that 335x and am437x are using fbdev even th=
ough technically they are using drm.

The reason why we are using fbdev emulation and not straight drm is due to =
the lack of support of drm in our graphics packages.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Friday, May 01, 2015 10:31 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build=20
> 2015-04-30_22-
> 00-51
>=20
> Does this mean drm is supported by all platforms, and "libdrm" can be=20
> a platform-agnostic dependency?
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, May 01, 2015 11:19 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build=20
> 2015-04-30_22-
> 00-51
>=20
> I think there's some confusion... Does this link help?
>=20
> http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User
> _
> Guide
>=20
> --
> Denys
>=20
>=20
> On Fri, May 01, 2015 at 10:26:40AM -0400, Jacob Stiffler wrote:
> > I see the error:
> >
> > make[3]: *** No rule to make target
> > `../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by=20
> > `libgstwaylandsink.la'.  Stop.
> > make[3]: *** Waiting for unfinished jobs....
> >
> > Looks like drm is needed for waylandsink. But I thought am3/am4 did=20
> > not have DRM?
> >
> >
> >
> >
> > On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> > >Jake,
> > >
> > >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> > >
> > >
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> >
> > On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> > >Jake,
> > >
> > >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> > >
> > >
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

