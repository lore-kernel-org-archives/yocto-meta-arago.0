Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C39E652998
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 18:31:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OIVhs3017408
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 13:31:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OIVhv9010471
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 13:31:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 13:31:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH] oe-layertool-setup.sh: properly set DL_DIR
Thread-Index: AQHOuU6hOFLhsxiZHU+komeVBmRwPpnViYiA//+sXeA=
Date: Tue, 24 Sep 2013 18:31:42 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55CB4E@DFLE08.ent.ti.com>
References: <1380047609-24150-1-git-send-email-Chase.Maupin@ti.com>
	<20130924183037.GA5945@edge>
In-Reply-To: <20130924183037.GA5945@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Tue, 24 Sep 2013 18:31:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 24, 2013 1:31 PM
> To: Maupin, Chase
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] oe-layertool-setup.sh: properly set DL_=
DIR
>=20
> Looks mostly Ok to me.
>=20
> On Tue, Sep 24, 2013 at 01:33:29PM -0500, Chase Maupin wrote:
> > * This script took a parameter using -d to set the DL_DIR but
> >   ignored that setting.  Now if that is set make the the DL_DIR
[Franklin] Minor typo
> >   value in conf/local.conf
> > * When running this script to get updates changes that were made
> >   to DL_DIR were lost because local.conf was copied over.  Now
> >   the script will use the old DL_DIR setting.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  oe-layertool-setup.sh |   19 +++++++++++++++++--
> >  1 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh index
> > 55cd174..32ed133 100755
> > --- a/oe-layertool-setup.sh
> > +++ b/oe-layertool-setup.sh
> > @@ -1,4 +1,4 @@
> > -#!/bin/sh
> > +#!/bin/sh -x
>=20
> Do you need this change?
>=20
>=20
> >  # OE Build Enviroment Setup Script
> >  #
> > @@ -732,6 +732,22 @@ EOM
> >      threads=3D`cat /proc/cpuinfo | grep -c processor`
> >      sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE =3D \"-j ${threads}\"/"
> $confdir/local.conf
> >      sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS =3D
> > \"${threads}\"/" $confdir/local.conf
> > +
> > +    # Find if old DL_DIR was set
> > +    if [ -e $confdir/local.conf.bak ]
> > +    then
> > +        old_dldir=3D`cat $confdir/local.conf.bak | grep -e "^DL_DIR =
=3D" | sed
> 's|DL_DIR =3D ||' | sed 's/"//g'`
> > +    else
> > +        old_dldir=3D"$dldir"
> > +    fi
> > +
> > +    # If command line option was not set use the old dldir
> > +    if [ "x$dldir" =3D=3D "x" ]
> > +    then
> > +        dldir=3D$old_dldir
> > +    fi
> > +
> > +    sed -i "s|^DL_DIR.*|DL_DIR =3D \"${dldir}\"|" $confdir/local.conf
> >  }
> >
> >
> > @@ -838,7 +854,6 @@ cd -
> >  sourcedir=3D"$oebase/sources"
> >  builddir=3D"$oebase/build"
> >  confdir=3D"$builddir/conf"
> > -dldir=3D"$oebase/downloads"
> >
> >  check_input
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

