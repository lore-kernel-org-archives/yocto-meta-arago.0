Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 34A7E52979
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:39:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THdGXb007961
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:39:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THdGXV019908
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:39:16 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 29 Aug 2014 12:39:16 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2] arago-core-tisdk-image: Work around
	SOC_FAMILY issue
Thread-Index: AQHPvbMR/AvSD0RA90axMNmoVx64yZvoN7KA//+s0/A=
Date: Fri, 29 Aug 2014 17:39:15 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C721C48@DFLE08.ent.ti.com>
References: <1408675495-24120-1-git-send-email-fcooper@ti.com>
	<1408675495-24120-2-git-send-email-fcooper@ti.com>
	<20140829173535.GL18620@edge>
In-Reply-To: <20140829173535.GL18620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] arago-core-tisdk-image: Work around SOC_FAMILY issue
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
X-List-Received-Date: Fri, 29 Aug 2014 17:39:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, August 29, 2014 12:36 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/2] arago-core-tisdk-image: Work
> around SOC_FAMILY issue
>=20
> On Thu, Aug 21, 2014 at 09:44:54PM -0500, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * Some reason the SOC_FAMILY dra7xx has precedences over machine
> overrides.
> > * Change dra7xx to dra7xx-evm to avoid SOC_FAMILY override issue.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> > a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > index 37f71d6..475c9d6 100644
> > --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> > @@ -19,7 +19,7 @@ TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev
> > libgnutls-extra26 libgnutls-openssl2  DTB_FILTER =3D "unknown"
> >  DTB_FILTER_ti33x =3D "am335x"
> >  DTB_FILTER_omap5-evm =3D "omap5"
> > -DTB_FILTER_dra7xx =3D "dra7"
> > +DTB_FILTER_dra7xx-evm =3D "dra7"
> >  DTB_FILTER_am57xx-evm =3D "am57xx"
>=20
> Are you sure you are basing your patch on master? The above entry for
> am57xx doesn exist yet in meta-arago/master. Looks like another patch is
> missing or your need to rebase.
[Franklin] This patch set was based on my previous patch set.  The patch fo=
r that entry is here:
http://arago-project.org/pipermail/meta-arago/2014-August/004042.html
Sorry I should have been clear about the dependencies especially between pa=
tch sets.
>=20
>=20
> >  DTB_FILTER_ti43x =3D "am43"
> >  DTB_FILTER_keystone =3D "k2hk"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

