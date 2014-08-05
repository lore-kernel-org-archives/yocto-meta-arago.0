Return-Path: <btv1==294f11ee0bf==Matt.Schuckmann@planar.com>
Received: from barbvt11.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id 8CE6852992
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 18:55:12 +0000 (UTC)
X-ASG-Debug-ID: 1407264907-04afd21682ef73d0001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt11.planar.com
	with ESMTP id Cln9LmjmHVRDWJGJ; Tue, 05 Aug 2014 11:55:07 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Tue, 5 Aug 2014 11:55:07 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: Denys Dmytriyenko <denys@ti.com>, "Cooper Jr., Franklin" <fcooper@ti.com>
Date: Tue, 5 Aug 2014 11:55:06 -0700
Thread-Topic: [meta-arago] i686 binutils failing to build for SDK 7.0 build
X-ASG-Orig-Subj: RE: [meta-arago] i686 binutils failing to build for SDK 7.0
	build
Thread-Index: Ac+w3Xhr9uDj6ni3Rq+aF41twNSFOQAABrkw
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA039@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F3485@DFLE08.ent.ti.com>
	<20140805184541.GE23523@edge>
In-Reply-To: <20140805184541.GE23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1407264907
X-Barracuda-URL: http://10.10.111.113:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4987 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No,
	SCORE=0.00 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.8145
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
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
X-List-Received-Date: Tue, 05 Aug 2014 18:55:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Tuesday, August 05, 2014 11:46 AM
> To: Cooper Jr., Franklin
> Cc: Matt Schuckmann; meta-arago@arago-project.org
> Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0
> build
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
> > > Subject: Re: [meta-arago] i686 binutils failing to build for SDK
> 7.0
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
> > > > binutils-native/2.20.1-r9/binutils-
> 2.20.1/bfd/doc/bfd.texinfo:326:
> > > > unknown
> > > command `colophon'
> > > > binutils-native/2.20.1-r9/binutils-
> 2.20.1/bfd/doc/bfd.texinfo:337:
> > > > unknown
> > > command `cygnus'
> > > >
> > > > It looks like this was a known problem for building binutils that
> > > > has been fixed a long time ago and since SDK 7.0 is released code
> > > > I would have assumed the problem was taken care for the Arago
> > > > build so I'm a little puzzled why I'm getting this now.
>=20
> >  [Franklin] I'm assuming that your issue is related to Ubuntu 14.04.
> I
> > need  to install it eventually anyway very soon so I can give it a
> try
> > and  hopefully help you with your issue.
>=20
> See the other reply talking about the specific reason 14.04 fails.
>=20
>=20
> > > Since you are using amsdk-07.00.00.00-config.txt config, you are
> > > building the same exact version that was released as AMSDK 7.0.
> That
> > > config is not being updated to pick up any latest code.
>=20
> > [Franklin] Unless he wants something stable since has already been
> > released
>=20
> Again, see the other reply - I got an impression by the last paragraph
> above that the requirement was to pull in some recent fixes for
> binutils. That won't be done in AMSDK 7.0, as it's already released and
> closed.
>=20
>=20
> > and also will be supported outside of this mailing list.
>=20
> Just a reminder - this is the Arago development mailing list, not AMSDK
> support mailing list. I don't mind these questions, but the assumption
> would always be that people want the latest stuff, since it's a
> community facing list.

It seems that a question about creating a image based on released and teste=
d software i.e the SDK 7.0 tags in Arago is an appropriate question for thi=
s list. If not this list then where?

I really just want to know where to start and the TI websites, and document=
ation provide a lot of options but very little guidance and it seems to ver=
y much be a moving target. Typically a good place to start is a released ve=
rsion but your comments seem to indicate that it's not so. I'm sorry if pos=
ted in the wrong place it seemed like this was the best list to get an answ=
er specific to building source from Arago.=20

Matt S.=20

