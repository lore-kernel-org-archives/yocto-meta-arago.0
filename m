Return-Path: <btv1==294f11ee0bf==Matt.Schuckmann@planar.com>
Received: from barbvt10.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id 0FCFE52A77
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 18:19:40 +0000 (UTC)
X-ASG-Debug-ID: 1407262776-04b02b2ef4934370001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt10.planar.com
	with ESMTP id DYre4gKYZ4ktW8Kn; Tue, 05 Aug 2014 11:19:36 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Tue, 5 Aug 2014 11:19:36 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Tue, 5 Aug 2014 11:19:35 -0700
Thread-Topic: [meta-arago] i686 binutils failing to build for SDK 7.0 build
X-ASG-Orig-Subj: RE: [meta-arago] i686 binutils failing to build for SDK 7.0
	build
Thread-Index: Ac+w2BqRioZEPkBzR1u7xtH2/LqDgQAAB/sw
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA024@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
In-Reply-To: <20140805180713.GC23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1407262776
X-Barracuda-URL: http://10.10.111.112:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
	SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.8142
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
X-List-Received-Date: Tue, 05 Aug 2014 18:19:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Tuesday, August 05, 2014 11:07 AM
> To: Matt Schuckmann
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0
> build
>=20
> On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> > I'm trying to build a basic image using Arago, SDK 7.0 config
> > (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1 is
> > failing to compile for the i686 host system.
> > I'm building on a Ubuntu 14.04 32bit VM.
> >
> > My bitbake command is:
> > MACHINE=3Dam335x-evm;bitbake core-image-minimal
> >
> > The errors are:
> > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326:
> unknown command `colophon'
> > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337:
> unknown command `cygnus'
> >
> > It looks like this was a known problem for building binutils that has
> > been fixed a long time ago and since SDK 7.0 is released code I would
> > have assumed the problem was taken care for the Arago build so I'm a
> > little puzzled why I'm getting this now.
>=20
> Matt,
>=20
> Since you are using amsdk-07.00.00.00-config.txt config, you are
> building the same exact version that was released as AMSDK 7.0. That
> config is not being updated to pick up any latest code.
>=20
> If you want to try latest code base, you better off trying arago-daisy-
> config.txt That would pull in everything latest from corresponding
> Daisy branches, which is the latest stable release.
>=20
> --
> Denys

Denys,=20

I intentionally picked SDK 7.0 because is it "tested" and released code so =
I figured it would have a better chance of working and being supported. If =
that is not the case please let me know. I want a good stable point to star=
t development of my own image for a custom am335x board.

I did just figure out that the problem is the newer version of texinfo (ver=
sion 5.2) packaged with Ubuntu 14.04 is not compatible with the older versi=
on of binutils (version 2.20.1) that is built for SDK 7.0. I manually downg=
raded my system to texinfo 4.13a and got past the error.=20

Thanks,
Matt S.=20



