Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9AEA7529AF
	for <meta-arago@arago-project.org>;
	Thu, 26 Feb 2015 18:00:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QI0Aho014100
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 12:00:11 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QI08ck010250
	for <meta-arago@arago-project.org>; Thu, 26 Feb 2015 12:00:09 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 26 Feb 2015 12:00:06 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] branding-mcsdk: Add opengl to mcsdk
	DISTRO_FEATURES
Thread-Index: AQHQUeWhE9/s2oNIGEC8WCpuXmeNUJ0DmecA//+eHOA=
Date: Thu, 26 Feb 2015 18:00:06 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C82DC77@DFLE08.ent.ti.com>
References: <1424898335-24940-1-git-send-email-sam.nelson@ti.com>
	<20150226165942.GD6052@edge>
	<4F9216F96E5DF9428610502835A9F490581257AC@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F490581257AC@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] branding-mcsdk: Add opengl to mcsdk DISTRO_FEATURES
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
X-List-Received-Date: Thu, 26 Feb 2015 18:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Thursday, February 26, 2015 11:49 AM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Add opengl to mcsdk
> DISTRO_FEATURES
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, February 26, 2015 12:00 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Add opengl to mcsdk
> > DISTRO_FEATURES
> >
> > On Wed, Feb 25, 2015 at 04:05:35PM -0500, Sam Nelson wrote:
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  .../conf/distro/include/branding-mcsdk.inc         |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > index 9fca5af..238b803 100644
> > > --- a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > @@ -3,7 +3,7 @@
> > >  # Use the MCSDK supported versions
> > >  PREFERRED_VERSION_libnl =3D "3.2.24"
> > >
> > > -DISTRO_FEATURES +=3D "x11"
> > > +DISTRO_FEATURES +=3D "x11 opengl"
> >
> > Reason?
> [Sam]  libgl was required to enable openCL compilation on target.  libgl
> depends on DISTRO_FEATURES opengl.
[Franklin] I thought from Jacob patch that there isn't a dependency on Open=
GL and only some of the headers are required which he sent a patch to add?
> >
> >
> > >  # Java preferences.
> > >  PREFERRED_VERSION_icedtea7-native =3D "2.1.3"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

