Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 868EF5296F
	for <meta-arago@arago-project.org>;
	Wed, 27 Nov 2013 16:55:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rARGtRp5023479;
	Wed, 27 Nov 2013 10:55:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rARGtQS3007639;
	Wed, 27 Nov 2013 10:55:26 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 27 Nov 2013 10:55:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rARGtQKA019004;
	Wed, 27 Nov 2013 10:55:26 -0600
Date: Wed, 27 Nov 2013 11:55:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico <ebutera@users.berlios.de>
Message-ID: <20131127165525.GC690@edge>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FDC3@DLEE11.ent.ti.com>
	<20131120152449.GC29952@edge>
	<CA+2YH7s5kRhh6t-pBgk_2XjiMOp1Jf2XxKQwLKQa2qW6VcY9sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+2YH7s5kRhh6t-pBgk_2XjiMOp1Jf2XxKQwLKQa2qW6VcY9sg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Wed, 27 Nov 2013 16:55:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 26, 2013 at 01:56:56PM +0100, Enrico wrote:
> On Wed, Nov 20, 2013 at 4:24 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Wed, Nov 20, 2013 at 01:11:18PM +0000, Maupin, Chase wrote:
> >> Sam,
> >>
> >> Were you going to post an updated set of these patches to meta-ti so you can
> >> align with Mrinmayee? I think your approach of splitting out the packages in
> >> linux-utils is a good one and will be cleaner going forward.  Since both of
> >> your groups share these packages aligning between the two would be helpful.
> >>
> >> As a side note I assume you have other recipes that depend on the cmem
> >> libraries that your cmem recipe provides.  Can you post one of those or
> >> share it with Mrinmayee as an example of how you are able to point to the
> >> right staging location for the libraries and headers for cmem in other
> >> recipes.  I'm hoping we can start getting rid of ti-paths.inc but I'd like
> >> to see how you were working around this.
> >>
> >> Denys,
> >>
> >> Since ti-linuxutils has other modules in it for edma, sdma, and irq but
> >> those are only for legacy devices can we just replace the whole
> >> ti-linuxutils with the cmem package which seems to be the main package
> >> needed?  Or do you want to see additional recipes for the sdma, edma, and
> >> irq moduled?
> >
> > I'd like to see other parts of linuxutils modularized, but that can be done on
> > as needed basis for any of the new platforms when they require those. We can
> > keep the old linuxutils around for a little longer, but it can only be used on
> > the old 35x and 37x plaftorms only and there are many other components (like
> > SGX) removing support for those old platforms already...
> 
> Please keep the linuxutils recipe until it can be replaced with the
> modularized ones, it's useful for 35x and 37x dsp (gstreamer_ti).

Enrico,

Thanks, I'll keep it around for now.

Can you please clarify which kernel you use for 35x and 37x platforms? And 
whether you use the latest versions of other components?

The problem with keeping old components around is that they quickly lose 
compatibility with kernel, toolchain, udev etc. that we use these days and it 
doesn't make much sense to carry them indefinitely w/o updating or replacing.

-- 
Denys

