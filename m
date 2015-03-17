Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4BE2452A86
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 19:03:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HJ3DLU014795
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:03:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HJ3CNJ015742
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:03:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 14:03:12 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 7/7][RFC] packagegroup-*-tisdk-addons:
	enable compiler and build essentials on omap-a15
Thread-Index: AQHQYDvs4ofpuMQ4yESOs95OyuFJuZ0hWVeA//+vL5A=
Date: Tue, 17 Mar 2015 19:03:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C84948A@DFLE08.ent.ti.com>
References: <1426546322-25230-1-git-send-email-denis@denix.org>
	<1426546322-25230-8-git-send-email-denis@denix.org>
	<20150317184845.GA9813@edge>
In-Reply-To: <20150317184845.GA9813@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 7/7][RFC] packagegroup-*-tisdk-addons: enable compiler and build essentials on omap-a15
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
X-List-Received-Date: Tue, 17 Mar 2015 19:03:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, March 17, 2015 1:49 PM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 7/7][RFC] packagegroup-*-tisdk-addons:
> enable compiler and build essentials on omap-a15
>=20
> All,
>=20
> I marked this as RFC to solicit feedback. As explained in the 0/7 cover l=
etter
> for the series, there are several methods to pull in gcc and build tools =
to the
> rootfs. This patch uses the least invasive one and enables minimal set of=
 dev
> tools and only for omap-a15 SOC platforms (need to repeat it for keystone
> SOC). That covers Cortex-A15, but I know in the future we'd need target g=
cc
> also on am3/4 platforms - would you have any preferences to enable this?
[Franklin] My understanding was the only reason this was needed is to enabl=
e developers to be able to compile
dsp code and opencl code on the target for some reason especially since tho=
se are very powerful processors with a lot of memory.

Unless something change this wasn't something we cared to enabled on 335x a=
nd 437x. No big deal doing it as long as the file system is bloated but I h=
ave no idea who really was going to use this/test this for those platforms.
>=20
> --
> Denys
>=20
>=20
> On Mon, Mar 16, 2015 at 06:52:02PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     =
|
> 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > index 8d12018..be38378 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-addons.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
> >  LICENSE =3D "MIT"
> > -PR =3D "r22"
> > +PR =3D "r23"
> >
> >  inherit packagegroup
> >
> > @@ -43,6 +43,8 @@ UTILS_append_ti33x =3D " switch-config"
> >  UTILS_append_ti43x =3D " switch-config libdrm-omap"
> >  UTILS_append_omap-a15 =3D " switch-config libdrm-omap stream-openmp"
> >
> > +UTILS_append_omap-a15 =3D " packagegroup-core-buildessential"
> > +
> >  RDEPENDS_${PN} =3D "\
> >      ${UTILS} \
> >      ${UTILS_UBOOT_FW} \
> > --
> > 2.2.0
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

