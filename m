Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EEDE052972
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 18:45:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75IjhYk007315;
	Tue, 5 Aug 2014 13:45:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75IjhiP024198;
	Tue, 5 Aug 2014 13:45:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 13:45:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75IjfSu031592;
	Tue, 5 Aug 2014 13:45:42 -0500
Date: Tue, 5 Aug 2014 14:45:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140805184541.GE23523@edge>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F3485@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6F3485@DFLE08.ent.ti.com>
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
X-List-Received-Date: Tue, 05 Aug 2014 18:45:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 05, 2014 at 02:24:37PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Tuesday, August 05, 2014 1:07 PM
> > To: Matt Schuckmann
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0 build
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
> > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326: unknown
> > command `colophon'
> > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337: unknown
> > command `cygnus'
> > >
> > > It looks like this was a known problem for building binutils that has
> > > been fixed a long time ago and since SDK 7.0 is released code I would
> > > have assumed the problem was taken care for the Arago build so I'm a
> > > little puzzled why I'm getting this now.

>  [Franklin] I'm assuming that your issue is related to Ubuntu 14.04. I need 
>  to install it eventually anyway very soon so I can give it a try and 
>  hopefully help you with your issue.

See the other reply talking about the specific reason 14.04 fails.


> > Since you are using amsdk-07.00.00.00-config.txt config, you are building the
> > same exact version that was released as AMSDK 7.0. That config is not being
> > updated to pick up any latest code.

> [Franklin] Unless he wants something stable since has already been released 

Again, see the other reply - I got an impression by the last paragraph above 
that the requirement was to pull in some recent fixes for binutils. That won't 
be done in AMSDK 7.0, as it's already released and closed.


> and also will be supported outside of this mailing list.

Just a reminder - this is the Arago development mailing list, not AMSDK 
support mailing list. I don't mind these questions, but the assumption would 
always be that people want the latest stuff, since it's a community facing 
list.


> > If you want to try latest code base, you better off trying arago-daisy-config.txt
> > That would pull in everything latest from corresponding Daisy branches,
> > which is the latest stable release.

> [Franklin] Will eventually become stable.

It's a point of view - Daisy is already a stable release of the Yocto Project. 
Arago currently is based on Daisy, but it hasn't been relesed yet.

-- 
Denys

