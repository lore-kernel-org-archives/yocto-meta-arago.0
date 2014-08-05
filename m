Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1055852992
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 19:06:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75J64Gr009389;
	Tue, 5 Aug 2014 14:06:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75J64MO021835;
	Tue, 5 Aug 2014 14:06:04 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 5 Aug 2014 14:06:04 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] i686 binutils failing to build for SDK 7.0 build
Thread-Index: Ac+w1OfjdhkurS5YTxWRUPtkx9YdLAALRacAAAoSXED//7orgIAAUyjg
Date: Tue, 5 Aug 2014 19:06:03 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F4577@DFLE08.ent.ti.com>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F3485@DFLE08.ent.ti.com>
	<20140805184541.GE23523@edge>
In-Reply-To: <20140805184541.GE23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: i686 binutils failing to build for SDK 7.0 build
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
X-List-Received-Date: Tue, 05 Aug 2014 19:06:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 05, 2014 1:46 PM
> To: Cooper Jr., Franklin
> Cc: Matt Schuckmann; meta-arago@arago-project.org
> Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0 buil=
d
>=20
> On Tue, Aug 05, 2014 at 02:24:37PM -0400, Cooper Jr., Franklin wrote:
> >
> >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > > Sent: Tuesday, August 05, 2014 1:07 PM
> > > To: Matt Schuckmann
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0
> > > build
> > >
> > > On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> > > > I'm trying to build a basic image using Arago, SDK 7.0 config
> > > > (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1
> > > > is failing to compile for the i686 host system.
> > > > I'm building on a Ubuntu 14.04 32bit VM.
> > > >
> > > > My bitbake command is:
> > > > MACHINE=3Dam335x-evm;bitbake core-image-minimal
> > > >
> > > > The errors are:
> > > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326:
> > > > unknown
> > > command `colophon'
> > > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337:
> > > > unknown
> > > command `cygnus'
> > > >
> > > > It looks like this was a known problem for building binutils that
> > > > has been fixed a long time ago and since SDK 7.0 is released code
> > > > I would have assumed the problem was taken care for the Arago
> > > > build so I'm a little puzzled why I'm getting this now.
>=20
> >  [Franklin] I'm assuming that your issue is related to Ubuntu 14.04. I
> > need  to install it eventually anyway very soon so I can give it a try
> > and  hopefully help you with your issue.
>=20
> See the other reply talking about the specific reason 14.04 fails.
[Franklin] He replied while I was responding.. No confusion after I saw his=
 response.
>=20
>=20
> > > Since you are using amsdk-07.00.00.00-config.txt config, you are
> > > building the same exact version that was released as AMSDK 7.0. That
> > > config is not being updated to pick up any latest code.
>=20
> > [Franklin] Unless he wants something stable since has already been
> > released
>=20
> Again, see the other reply - I got an impression by the last paragraph ab=
ove
> that the requirement was to pull in some recent fixes for binutils. That =
won't
> be done in AMSDK 7.0, as it's already released and closed.
[Franklin]  Similar to your dora patches you submitted recently no reason w=
e/I couldn't do the same.
>=20
>=20
> > and also will be supported outside of this mailing list.
>=20
> Just a reminder - this is the Arago development mailing list, not AMSDK
> support mailing list. I don't mind these questions, but the assumption wo=
uld
> always be that people want the latest stuff, since it's a community facin=
g list.
[Franklin] I never called it an AMSDK support list but your leaving mainten=
ance branches up for a reason. =20
>=20
>=20
> > > If you want to try latest code base, you better off trying
> > > arago-daisy-config.txt That would pull in everything latest from
> > > corresponding Daisy branches, which is the latest stable release.
>=20
> > [Franklin] Will eventually become stable.
>=20
> It's a point of view - Daisy is already a stable release of the Yocto Pro=
ject.
> Arago currently is based on Daisy, but it hasn't been relesed yet.
[Franklin] Meta-arago and meta-ti has been relatively unstable recently wit=
h other pieces of software under development with varying degrees of stabil=
ity. So outside those two layers things maybe stable but there is a bit of =
turbulence while we work through a release.

I would just prefer giving people (myself) a chance to help others out espe=
cially if there are using an SDK specific config.
>=20
> --
> Denys

