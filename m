Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 73C9F52A77
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 18:33:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75IXJ0o006173;
	Tue, 5 Aug 2014 13:33:19 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75IXJYQ028828;
	Tue, 5 Aug 2014 13:33:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 13:33:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75IXGj9020166;
	Tue, 5 Aug 2014 13:33:18 -0500
Date: Tue, 5 Aug 2014 14:33:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Matt Schuckmann <Matt.Schuckmann@planar.com>
Message-ID: <20140805183313.GD23523@edge>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
	<4B07ADD556F70043925DA2E9C5D4346D2FD85EA024@MSXBEBVT12.planar.net>
MIME-Version: 1.0
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA024@MSXBEBVT12.planar.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 05 Aug 2014 18:33:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 05, 2014 at 11:19:35AM -0700, Matt Schuckmann wrote:
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Tuesday, August 05, 2014 11:07 AM
> > To: Matt Schuckmann
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0
> > build
> > 
> > On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> > > I'm trying to build a basic image using Arago, SDK 7.0 config
> > > (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1 is
> > > failing to compile for the i686 host system.
> > > I'm building on a Ubuntu 14.04 32bit VM.
> > >
> > > My bitbake command is:
> > > MACHINE=am335x-evm;bitbake core-image-minimal
> > >
> > > The errors are:
> > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326:
> > unknown command `colophon'
> > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337:
> > unknown command `cygnus'
> > >
> > > It looks like this was a known problem for building binutils that has
> > > been fixed a long time ago and since SDK 7.0 is released code I would
> > > have assumed the problem was taken care for the Arago build so I'm a
> > > little puzzled why I'm getting this now.
> > 
> > Matt,
> > 
> > Since you are using amsdk-07.00.00.00-config.txt config, you are
> > building the same exact version that was released as AMSDK 7.0. That
> > config is not being updated to pick up any latest code.
> > 
> > If you want to try latest code base, you better off trying arago-daisy-
> > config.txt That would pull in everything latest from corresponding
> > Daisy branches, which is the latest stable release.
> 
> Denys, 
> 
> I intentionally picked SDK 7.0 because is it "tested" and released code so I 
> figured it would have a better chance of working and being supported. If 
> that is not the case please let me know. I want a good stable point to start 
> development of my own image for a custom am335x board.
> 
> I did just figure out that the problem is the newer version of texinfo 
> (version 5.2) packaged with Ubuntu 14.04 is not compatible with the older 
> version of binutils (version 2.20.1) that is built for SDK 7.0. I manually 
> downgraded my system to texinfo 4.13a and got past the error.

Matt,

That is fine - if you want to base your work on an official release, you 
should stick to AMSDK 7.0 config. I thought you were trying to get the latest 
code pulled in, which would be a different approach.

AMSDK 7.0 was based on Dylan, which is now 3 versions behind the latest Yocto 
Project release. It was validated on Ubuntu 12.04 (and 10.04), so it may have 
incompatibility issues with newer Linux distros, like you found out. This is a 
more generic issue - the wider the time gap between the versions of the tools 
being used (e.g. Linux host distro, cross toolchain, etc) and the components 
being built (e.g. kernel, bootloader, user space apps, etc), the higher 
chances are for extra issues, breakage and other weird problems...

-- 
Denys

