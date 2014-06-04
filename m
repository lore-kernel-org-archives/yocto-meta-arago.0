Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 152C7529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 16:15:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54GF3la018306
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 11:15:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54GF2bE008272
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 11:15:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Jun 2014 11:15:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54GExl2010270;
	Wed, 4 Jun 2014 11:15:00 -0500
Date: Wed, 4 Jun 2014 12:14:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140604161457.GO21819@edge>
References: <7D46E86EC0A8354091174257B2FED1015D08C432@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015D08C524@DLEE11.ent.ti.com>
	<20140604150938.GH21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D08CB81@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D08CB81@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: qt4-embedded-gles breakage for dra7xx-evm
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
X-List-Received-Date: Wed, 04 Jun 2014 16:15:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 04, 2014 at 11:52:32AM -0400, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Wednesday, June 04, 2014 10:10 AM
> >To: Maupin, Chase
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] qt4-embedded-gles breakage for dra7xx-
> >evm
> >
> >On Wed, Jun 04, 2014 at 02:57:39PM +0000, Maupin, Chase wrote:
> >>
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Maupin, Chase
> >> Sent: Wednesday, June 04, 2014 9:49 AM
> >> To: meta-arago@arago-project.org
> >> Subject: [meta-arago] qt4-embedded-gles breakage for dra7xx-evm
> >>
> >> All,
> >>
> >> Currently qt4-embedded-gles breaks for dra7xx-evm machine type
> >(and likely
> >> omap5-evm as well) because of the following:
> >>
> >>
> >> - For AM devices such as am335x-evm the GLES library is called
> >libGLES_CM.so
> >>
> >> - For OMAP devices such as dra7xx-evm the GLES library is called
> >> libGLESv1_CM.so
> >>
> >> - In the linux.conf for qt4-embedded-gles the libraries to
> >include are
> >> listed as GLES_CM
> >>
> >> This causes the do_configure stage to fail for the qt4-embedded-
> >gles recipe
> >> on dra7xx-evm because it cannot find the GLES_CM library since
> >that library
> >> for those devices is named GLESv1_CM.  I currently have a work
> >around to fix
> >> this configure error of creating a version of the linux.conf for
> >> qt4-embedded-gles that uses for omap-a15 machine types.  This
> >works
> >> (although there is a compile error I am tracking down due to
> >missing pvr2d.h
> >> header files) but I was curious if this is the best way to solve
> >this, or
> >> would it be better to fixup the library name or make symlinks
> >between
> >> libGLES_CM and libGLESv1_CM in the graphics library recipe.
> >>
> >> BTW, some of this may be a moot point because none of the OMAP
> >SGX packages
> >> provide the pvr2d.h header.  So until there is alignment in
> >these packages
> >> the version of Qt used for these devices either needs to be Qt5
> >which
> >> doesn’t have SGX acceleration yet, or the sgx MACHINE_FEATURE
> >should be
> >> removed from the omap-a15 devices.  Thoughts?
> >
> >Qt5 does have GLES acceleation. It can be easily turned on and
> >off, but it's
> >required for QtWebkit, IIRC. Why are you saying there's no SGX
> >acceleration?
> 
> I thought Qt5 required similar patches to use the pvr2d library as Qt4 did.  
> I figured it could find the GLES libraries on it's own though.  Would it 
> have the same issue with the renamed library?
> 
> >
> >As of the question - I'm fine disabling sgx MACHINE_FEATURE for
> >now. Let's
> >talk to the graphics team to see if/when it will be
> >aligned/resolved.
> 
> Or when do we want to change the default Qt to Qt5?  If you are saying the 
> Qt5 can work with our SGX as is then maybe that should be the new default 
> with Wayland/Weston as the window manager.  What are your thoughts?  
> Hopefully Franklin can chime in as well.

As we just discussed on IRC, Qt5 uses GLES2 and the library name is the same 
between libgles-omap3 and omap5-sgx-ddk, so no issues building Qt5 with gles2 
enabled for dra7xx/omap5. There are still some runtime issues expected though.

Looks like Qt5 is becoming a requirement for going forward with the new 
platforms. We need to finish porting remainder of AMSDK to start using Qt5 and 
Wayland/Weston...

-- 
Denys

