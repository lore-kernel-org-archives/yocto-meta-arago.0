Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0BE56529B3
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 04:26:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1K4QlwE002077
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 22:26:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K4Qk5T002805
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 22:26:46 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 19 Feb 2015 22:26:46 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
	include file
Thread-Index: AQHQQj5oxV3jcGOO7EiH0WzU8m+KOpzkXkAA//+puWCAAHA8AIAAAsyAgAAG7oD///UekIAU2owA//+zUQA=
Date: Fri, 20 Feb 2015 04:26:45 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058116CA5@DLEE11.ent.ti.com>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206185948.GA12366@edge>
	<4F9216F96E5DF9428610502835A9F4905811091D@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FB1BB@DFLE08.ent.ti.com>
	<20150206204243.GD12366@edge>
	<8F29D6B095ED194EA1980491A5E029710C7FB287@DFLE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49058110B5F@DLEE11.ent.ti.com>
	<20150220025557.GG31287@edge>
In-Reply-To: <20150220025557.GG31287@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] branding-mcsdk: Adding MCSDK branding include file
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
X-List-Received-Date: Fri, 20 Feb 2015 04:26:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 19, 2015 9:56 PM
> To: Nelson, Sam
> Cc: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> include file
>=20
> Coming back to this discussion...
>=20
>=20
> On Fri, Feb 06, 2015 at 09:29:48PM -0500, Nelson, Sam wrote:
> > > > > > > > - To control preferred version and providers for MCSDK
> > > > > > > >
> > > > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > > > > ---
> > > > > > > >  .../conf/distro/include/branding-mcsdk.inc         |   20
> > > > > > > ++++++++++++++++++++
> > > > > > > >  1 file changed, 20 insertions(+)  create mode 100644
> > > > > > > > meta-arago-distro/conf/distro/include/branding-
> > > > > > > mcsdk.inc
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > > > > b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000..d023b67
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.=
inc
> > > > > > > > @@ -0,0 +1,20 @@
> > > > > > > > +# MCSDK branding configuration
> > > > > > > > +
> > > > > > > > +# Use the MCSDK supported versions PREFERRED_VERSION_libnl
> =3D
> > > > > > > > +"3.2.24"
> > > > > > > > +
> > > > > > > > +DISTRO_FEATURES +=3D "x11 opengl"
> > > > > > >
> > > > > > > I assume x11 is to make Java happy? I don't think you have x1=
1 env...
> > > > > > >
> > > > > > [Sam] Yes it was to make Java happy.
> > > > > [Franklin] I thought I remembered that the mcsdk were meant for
> headless
> > > > devices.
> > > > > If so I would recommend taking a look at the discussion here:
> > > > > https://github.com/woglinde/meta-java/issues/45
> > > > >
> > > > > Pulling in x11 and gtk seems painful especially since you're not =
using it.
> > > > > Anyway it's something to look into if it is indeed meant for head=
less
> > > devices.
> > > > > But its ur branding file so my above comments aren't meant to blo=
ck
> this
> > > > patch from being accepted.
> > > >
> > > > Well, as explained in that tracker link you provided, pulling X lib=
s for the
> > > build
> > > > doesn't necessary mean you'll end up with X component on the target=
.
> > > > Yes, disabling AWT is a nice touch, hopefully it gets integrated in=
to meta-
> > > java
> > > [Franklin] Maybe for the very specific x11 recipes but pulling the ge=
neric
> gtk+
> > > package I'm not sure things will end up being as lucky. The changes
> > > mentioned in the link specifically drops the gtk dependency. Also add=
ing
> X11
> > > to your distro features I'm assuming will affect quite a bit of recip=
es that
> may
> > > pull in additional x11 dependencies that they may have avoided otherw=
ise.
> > >
> > > Anyway I was making assumptions so if that isn't occurring in their c=
urrent
> > > builds feel free to ignore my crazy rambling :)
>=20
> > [Sam] I tried the patch mentioned in tracker link. But I see libxt
> > libxinerama libxrender all depend on x11.
> > So not giving anything useful.
>=20
> But according to the comments, it skips building AWT and removes GTK
> dependencies. Plus the build is faster. Do you want to include it?
[Sam] Let me check on this, in the perspective of building faster with the =
patch.
( I guess this need not hold up adding x11 for DISTRO_FEATURES).
>=20
> I'm wondering if libxt, libxinerama and libxrender require
> DISTRO_FEATURES +=3D "x11"...
>=20
[Sam] Here is the error message when trying to build libxt without x11.=20
ERROR: Nothing PROVIDES 'libxt'
ERROR: libxt was skipped: missing required distro feature ['x11'] (not in D=
ISTRO_FEATURES)

Same error with libxinerama and libxrender as well.
>=20
> > > > > > > > +# Java preferences.
> > > > > > > > +#PREFERRED_VERSION_openjdk-7-jre =3D "25b30-2.3.12"
> > > > > > > > +PREFERRED_VERSION_icedtea7-native =3D "2.1.3"
> > > > > > > > +PREFERRED_PROVIDER_openjdk-7-jre =3D "openjdk-7-jre"
> > > > > > > > +
> > > > > > > > +PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial=
"
> > > > > > > > +
> > > > > > > > +PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
> > > > > > > > +PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap=
-
> native"
> > > > > > > > +
> > > > > > > > +PREFERRED_PROVIDER_jpeg-native =3D "jpeg-native"
> > > > > > > > +#PREFERRED_PROVIDER_jpeg-native =3D "libjpeg-turbo-native"
> > > > > > > > +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 =3D "nativesdk-
> eglibc-
> > > > locale"
> > > > > > > > --
> > > > > > > > 1.7.9.5
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > meta-arago mailing list
> > > > > > > > meta-arago@arago-project.org
> > > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o
> > > > > > _______________________________________________
> > > > > > meta-arago mailing list
> > > > > > meta-arago@arago-project.org
> > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

