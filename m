Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B30A052992
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 19:16:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75JGjmv010779;
	Tue, 5 Aug 2014 14:16:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75JGjqs030163;
	Tue, 5 Aug 2014 14:16:45 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 5 Aug 2014 14:16:45 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] i686 binutils failing to build for SDK 7.0 build
Thread-Index: Ac+w1OfjdhkurS5YTxWRUPtkx9YdLAALRacAAAoSXED//7orgIAAAqEAgABQvYA=
Date: Tue, 5 Aug 2014 19:16:44 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F4599@DFLE08.ent.ti.com>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F3485@DFLE08.ent.ti.com>
	<20140805184541.GE23523@edge>
	<4B07ADD556F70043925DA2E9C5D4346D2FD85EA039@MSXBEBVT12.planar.net>
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA039@MSXBEBVT12.planar.net>
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
X-List-Received-Date: Tue, 05 Aug 2014 19:16:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Matt Schuckmann [mailto:Matt.Schuckmann@planar.com]
> Sent: Tuesday, August 05, 2014 1:55 PM
> To: Dmytriyenko, Denys; Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] i686 binutils failing to build for SDK 7.0 buil=
d
>=20
>=20
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Tuesday, August 05, 2014 11:46 AM
> > To: Cooper Jr., Franklin
> > Cc: Matt Schuckmann; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0
> > build
> >
> > On Tue, Aug 05, 2014 at 02:24:37PM -0400, Cooper Jr., Franklin wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > > > Sent: Tuesday, August 05, 2014 1:07 PM
> > > > To: Matt Schuckmann
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] i686 binutils failing to build for SDK
> > 7.0
> > > > build
> > > >
> > > > On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> > > > > I'm trying to build a basic image using Arago, SDK 7.0 config
> > > > > (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1
> > > > > is failing to compile for the i686 host system.
> > > > > I'm building on a Ubuntu 14.04 32bit VM.
> > > > >
> > > > > My bitbake command is:
> > > > > MACHINE=3Dam335x-evm;bitbake core-image-minimal
> > > > >
> > > > > The errors are:
> > > > > binutils-native/2.20.1-r9/binutils-
> > 2.20.1/bfd/doc/bfd.texinfo:326:
> > > > > unknown
> > > > command `colophon'
> > > > > binutils-native/2.20.1-r9/binutils-
> > 2.20.1/bfd/doc/bfd.texinfo:337:
> > > > > unknown
> > > > command `cygnus'
> > > > >
> > > > > It looks like this was a known problem for building binutils
> > > > > that has been fixed a long time ago and since SDK 7.0 is
> > > > > released code I would have assumed the problem was taken care
> > > > > for the Arago build so I'm a little puzzled why I'm getting this =
now.
> >
> > >  [Franklin] I'm assuming that your issue is related to Ubuntu 14.04.
> > I
> > > need  to install it eventually anyway very soon so I can give it a
> > try
> > > and  hopefully help you with your issue.
> >
> > See the other reply talking about the specific reason 14.04 fails.
> >
> >
> > > > Since you are using amsdk-07.00.00.00-config.txt config, you are
> > > > building the same exact version that was released as AMSDK 7.0.
> > That
> > > > config is not being updated to pick up any latest code.
> >
> > > [Franklin] Unless he wants something stable since has already been
> > > released
> >
> > Again, see the other reply - I got an impression by the last paragraph
> > above that the requirement was to pull in some recent fixes for
> > binutils. That won't be done in AMSDK 7.0, as it's already released
> > and closed.
> >
> >
> > > and also will be supported outside of this mailing list.
> >
> > Just a reminder - this is the Arago development mailing list, not
> > AMSDK support mailing list. I don't mind these questions, but the
> > assumption would always be that people want the latest stuff, since
> > it's a community facing list.
>=20
> It seems that a question about creating a image based on released and tes=
ted
> software i.e the SDK 7.0 tags in Arago is an appropriate question for thi=
s list. If
> not this list then where?
>=20
> I really just want to know where to start and the TI websites, and
> documentation provide a lot of options but very little guidance and it se=
ems
> to very much be a moving target. Typically a good place to start is a rel=
eased
> version but your comments seem to indicate that it's not so. I'm sorry if
> posted in the wrong place it seemed like this was the best list to get an
> answer specific to building source from Arago.
[Franklin] Don't mind us. You asked the question in the right place. You ju=
st got caught up in a difference in opinion discussion.

If you want to try the latest and greatest then Denys is right using the Da=
isy config (latest arago config) would be the best bet. Things are still in=
 flux a bit so if you don't mind see random issues, breakage here and there=
 then this is a good option. In general things get fixed relatively quickly=
. Also there gets to a point where the BSP packages (wats in meta-ti) is pr=
etty much finalized which usually means your good to go and things are pret=
ty much stable.

I would use the AMSDK 7 config if you want to create a release that mimics =
a specific AMSDK. From a support perspective outside of this mailing list, =
TI will support a specific SDK which includes kernel, u-boot, filesystem et=
c... So using that sdk config would be the right place to begin although ge=
nerally from an OE perspective it has outdated components. But if you start=
 asking questions on E2E (TI support forum) then you may hit a roadblock si=
nce the 3.14 LTS kernel or U-boot 2014.07 hasn't been released in an offici=
al TI SDK so people may not know what your talking about

>=20
> Matt S.

