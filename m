Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 34A3952972
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 19:50:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s75JoZRl026258;
	Tue, 5 Aug 2014 14:50:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75JoZnI021445;
	Tue, 5 Aug 2014 14:50:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 14:50:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s75JoY2u015347;
	Tue, 5 Aug 2014 14:50:34 -0500
Date: Tue, 5 Aug 2014 15:50:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140805195033.GG23523@edge>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
	<20140805180713.GC23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F3485@DFLE08.ent.ti.com>
	<20140805184541.GE23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F4577@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6F4577@DFLE08.ent.ti.com>
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
X-List-Received-Date: Tue, 05 Aug 2014 19:50:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 05, 2014 at 03:06:03PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, August 05, 2014 1:46 PM
> > To: Cooper Jr., Franklin
> > Cc: Matt Schuckmann; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0 build
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
> > > > Subject: Re: [meta-arago] i686 binutils failing to build for SDK 7.0
> > > > build
> > > >
> > > > On Tue, Aug 05, 2014 at 10:44:28AM -0700, Matt Schuckmann wrote:
> > > > > I'm trying to build a basic image using Arago, SDK 7.0 config
> > > > > (configs/amsdk/amsdk-07.00.00.00-config.txt) and binutils 2.20.1
> > > > > is failing to compile for the i686 host system.
> > > > > I'm building on a Ubuntu 14.04 32bit VM.
> > > > >
> > > > > My bitbake command is:
> > > > > MACHINE=am335x-evm;bitbake core-image-minimal
> > > > >
> > > > > The errors are:
> > > > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326:
> > > > > unknown
> > > > command `colophon'
> > > > > binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337:
> > > > > unknown
> > > > command `cygnus'
> > > > >
> > > > > It looks like this was a known problem for building binutils that
> > > > > has been fixed a long time ago and since SDK 7.0 is released code
> > > > > I would have assumed the problem was taken care for the Arago
> > > > > build so I'm a little puzzled why I'm getting this now.
> > 
> > >  [Franklin] I'm assuming that your issue is related to Ubuntu 14.04. I
> > > need  to install it eventually anyway very soon so I can give it a try
> > > and  hopefully help you with your issue.
> > 
> > See the other reply talking about the specific reason 14.04 fails.

> [Franklin] He replied while I was responding.. No confusion after I saw his 
> response.
> > 
> > 
> > > > Since you are using amsdk-07.00.00.00-config.txt config, you are
> > > > building the same exact version that was released as AMSDK 7.0. That
> > > > config is not being updated to pick up any latest code.
> > 
> > > [Franklin] Unless he wants something stable since has already been
> > > released
> > 
> > Again, see the other reply - I got an impression by the last paragraph above
> > that the requirement was to pull in some recent fixes for binutils. That won't
> > be done in AMSDK 7.0, as it's already released and closed.

> [Franklin] Similar to your dora patches you submitted recently no reason 
> we/I couldn't do the same.

Would that be a point release for AMSDK? Say, AMSDK 7.1?
I don't mind that at all, i.e. backporting fixes to older branches/releases, I 
was just pointing to the fact that amsdk-07.00.00.00-config.txt is a locked 
down configuration and is not moving and not pulling anything new. That's all.


> > > and also will be supported outside of this mailing list.
> > 
> > Just a reminder - this is the Arago development mailing list, not AMSDK
> > support mailing list. I don't mind these questions, but the assumption would
> > always be that people want the latest stuff, since it's a community facing list.

> [Franklin] I never called it an AMSDK support list but your leaving 
> maintenance branches up for a reason.

Like I said above - I don't mind backports and fixes for older branches and 
releases. That is a valid development effort. But that is not the main focus 
for me and this mailing list. So, when it's not clear what the requirements 
are, I assume the latest. That's exactly what I said above, which does not 
preclude using this mailing list to discuss development on older base...


> > > > If you want to try latest code base, you better off trying
> > > > arago-daisy-config.txt That would pull in everything latest from
> > > > corresponding Daisy branches, which is the latest stable release.
> > 
> > > [Franklin] Will eventually become stable.
> > 
> > It's a point of view - Daisy is already a stable release of the Yocto Project.
> > Arago currently is based on Daisy, but it hasn't been relesed yet.

> [Franklin] Meta-arago and meta-ti has been relatively unstable recently with 
> other pieces of software under development with varying degrees of 
> stability. So outside those two layers things maybe stable but there is a 
> bit of turbulence while we work through a release.

Indeed, things are being stabilized now in meta-ti and meta-arago for the 
upcoming internal release soon, which will be used as a base for the next 
AMSDK.


> I would just prefer giving people (myself) a chance to help others out 
> especially if there are using an SDK specific config.

Historically, people coming to this mailing list (as well as meta-ti or other 
community lists) are looking for integrating all the latest components and 
utilizing latest code base, while developing their product - they don't mind 
a bit of instability. I'm not used to support questions about past releases on 
this list. Usually those go to E2E forums and such. That's all. So, once it's 
clearly identified to be such a question, I'm fine leaving it to you to take 
it.

-- 
Denys

