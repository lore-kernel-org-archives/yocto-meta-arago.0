Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 46C7252976
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 21:24:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HLOkPx004879;
	Thu, 17 Jul 2014 16:24:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HLOkMH001449;
	Thu, 17 Jul 2014 16:24:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 16:24:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HLOkrE017859;
	Thu, 17 Jul 2014 16:24:46 -0500
Date: Thu, 17 Jul 2014 17:24:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20140717212445.GC15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
	<20140717205217.GW15788@edge>
	<CAFZh4h_MTuZtV2e2C3Ctsqw=G=ynfGr-7K7gJ8A+NLhqOCTEaQ@mail.gmail.com>
	<20140717210734.GA15788@edge>
	<CAFZh4h8V-0THCDvDzyMZnhYu=gUW4Ofa9Rjc9jc2r62wxGbY+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h8V-0THCDvDzyMZnhYu=gUW4Ofa9Rjc9jc2r62wxGbY+g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: New Arago - am180x-evm core-image-minimal build is getting MD5 LICENSE errors in daisy
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
X-List-Received-Date: Thu, 17 Jul 2014 21:24:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 17, 2014 at 05:16:57PM -0400, Brian Hutchinson wrote:
> On Thu, Jul 17, 2014 at 5:07 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> >
> > TOOLCHAIN_TYPE=internal will build the toolchain from sources.
> >
> >
> >> I build everything using Yocto 1.5 last year and remember having
> >> issues building 3.12 with the toolchain built by Yocto.  If I remember
> >
> > Hmm, not sure about the issues with the upstream toolchain. Another option
> > would be to use Linaro toolchain - either external or internal. The only catch
> > is that Linaro is not directly targeting or supporting ARM9 platforms. So, any
> > support requests would have to go to upstream GCC.
> >
> 
> Ah, now I'm with you.  So if I set TOOLCHAIN_TYPE=internal, is it
> building the same toolchain that would be built if I had used Yocto
> (upstream gcc I'm assuming although I admit I never dug into it) or
> something else?

Correct, it would build the toolchain from the sources available. Default is 
of course OE-Core - gcc 4.9 in master and 4.8 in daisy.
But if you have meta-linaro-toolchain layer in your stack, you can specify 
to build that one instead:

GCCVERSION ?= "linaro-4.8%"
BINUVERSION ?= "linaro-2.24%"
EGLIBCVERSION ?= "linaro-2.19%"

That would build the Linaro toolchain from sources.


> Should I try again with the latest external Linaro?  Just wondering
> what may be the best option since I've been out of the ARM9 scene for
> a while but now have to update a bunch of our stuff for a new release.

If you use TOOLCHAIN_TYPE=external and TOOLCHAIN_BRAND=linaro (both are the 
defaults for meta-arago), then it will use the external Linaro toolchain. We 
are currently using 2013.03 that is gcc-4.7 based. We've had some issues with 
2014.03, gcc-4.8 one.


> Sorry for the 21 questions ... just trying to stay out of the weeds.
> 
> Regards,
> 
> Brian

