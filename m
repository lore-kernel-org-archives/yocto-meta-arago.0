Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7794052972
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 14:44:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7QEikmR004543;
	Tue, 26 Aug 2014 09:44:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7QEikWo007205;
	Tue, 26 Aug 2014 09:44:46 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 26 Aug 2014 09:44:46 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Arnaud Janvier <aja@survision.fr>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] binutils: Fix documentation build error
	with Texinfo 5
Thread-Index: AQHPvoKjzc3gW434CUWc+TmTbmtcOZvjQiqA//+4cYA=
Date: Tue, 26 Aug 2014 14:44:45 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C705840@DFLE08.ent.ti.com>
References: <53F6E737.4080208@survision.fr> <20140823033040.GA23523@edge>
	<53FC924D.3070901@survision.fr>
In-Reply-To: <53FC924D.3070901@survision.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] binutils: Fix documentation build error with Texinfo 5
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
X-List-Received-Date: Tue, 26 Aug 2014 14:44:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There will not be any dot release for AMSDK 7.0 but let me think about how =
to handle stuff like this. If it unbreaks builds then I probably need to do=
cument these kind of fixes or update the config or provide a new config to =
pull in patches like these.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Arnaud Janvier
> Sent: Tuesday, August 26, 2014 8:58 AM
> To: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] binutils: Fix documentation build error
> with Texinfo 5
>=20
> Le 23/08/2014 05:30, Denys Dmytriyenko a =E9crit :
> >
> > What branch is it for? There's no longer binutils-2.20.1 in latest meta=
-
> arago.
> > If it's for Dora, I can probably apply it there. If it's for AMSDK
> > 7.0, it should be applied to Dylan, but I'm not sure there will be a
> > point release to pick it up...
>=20
> You are right, I forgot to mention that: patch was created for the Dylan
> branch and will hopefully be taken in a future AMSDK release.
>=20
> I also verified on Dora branch today and even if binutils 2.20.1 still ex=
ists
> there, it seems that it is now taken directly from oe-core as
> 2.23.2 was built. So apparently no reason to apply it there.
>=20
>=20
> Regards,
> Arnaud
>=20
> >
> > On Fri, Aug 22, 2014 at 08:46:15AM +0200, Arnaud Janvier wrote:
> >> Newer versions of Texinfo have problems to build binutils documentatio=
n.
> >> This patch fixes the build issue seen on Ubuntu 14.04 distribution.
> >> ---
> >>   .../binutils-2.20.1/binutils-texinfo-5.0.patch     | 42
> >> ++++++++++++++++++++++
> >>   .../recipes-devtools/binutils/binutils_2.20.1.bb   |  1 +
> >>   2 files changed, 43 insertions(+)
> >>   create mode 100644
> >> meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-
> >> texinfo-5.0.patch
> >>
> >> diff --git
> >> a/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutil
> >> s-texinfo-5.0.patch
> >> b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutil
> >> s-texinfo-5.0.patch
> >> new file mode 100644
> >> index 0000000..7de8e55
> >> --- /dev/null
> >> +++ b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/bin
> >> +++ utils-texinfo-5.0.patch
> >> @@ -0,0 +1,42 @@
> >> +diff -Nru binutils-2.20.1.orig/bfd/doc/bfd.texinfo
> >> binutils-2.20.1/bfd/doc/bfd.texinfo
> >> +--- binutils-2.20.1.orig/bfd/doc/bfd.texinfo	2009-09-02
> >> 09:18:38.000000000 +0200
> >> ++++ binutils-2.20.1/bfd/doc/bfd.texinfo	2014-06-05
> 08:51:35.897319775 +0200
> >> +@@ -323,7 +323,7 @@
> >> + @printindex cp
> >> + + @tex
> >> +-% I think something like @colophon should be in texinfo.  In the
> >> ++% I think something like @@colophon should be in texinfo.  In the
> >> + % meantime:
> >> + \long\def\colophon{\hbox to0pt{}\vfill  \centerline{The body of
> >> +this manual is set in} @@ -334,7 +334,7 @@
> >> +\centerline{{\sl\fontname\tensl\/}}
> >> + \centerline{are used for emphasis.}\vfill}  \page\colophon -%
> >> +Blame: doc@cygnus.com, 28mar91.
> >> ++% Blame: doc@@cygnus.com, 28mar91.
> >> + @end tex
> >> + + @bye
> >> +diff -Nru binutils-2.20.1.orig/ld/ld.texinfo binutils-2.20.1/ld/ld.te=
xinfo
> >> +--- binutils-2.20.1.orig/ld/ld.texinfo	2014-06-05 09:26:41.049356076
> +0200
> >> ++++ binutils-2.20.1/ld/ld.texinfo	2014-06-04 18:10:49.305840598
> +0200
> >> +@@ -7521,7 +7521,7 @@
> >> + @printindex cp
> >> + + @tex
> >> +-% I think something like @colophon should be in texinfo.  In the
> >> ++% I think something like @@colophon should be in texinfo.  In the
> >> + % meantime:
> >> + \long\def\colophon{\hbox to0pt{}\vfill  \centerline{The body of
> >> +this manual is set in} @@ -7532,7 +7532,7 @@
> >> +\centerline{{\sl\fontname\tensl\/}}
> >> + \centerline{are used for emphasis.}\vfill}  \page\colophon -%
> >> +Blame: doc@cygnus.com, 28mar91.
> >> ++% Blame: doc@@cygnus.com, 28mar91.
> >> + @end tex
> >> + + @bye
> >> diff --git
> >> a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> >> b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> >> index d0f889c..dd7e640 100644
> >> --- a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> >> +++ b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
> >> @@ -34,6 +34,7 @@ SRC_URI =3D "\
> >>        file://200_elflink_%B_fixes.patch \
> >>        file://201_elflink_improve_noaddneeded_errors.patch \
> >>        file://202_elflink_noaddneeded_vs_weak.patch \
> >> +     file://binutils-texinfo-5.0.patch \
> >>        "
> >>    SRC_URI[md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> >> --
> >> 1.9.1
> >>
> >>
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

