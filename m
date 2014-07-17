Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 76DE952972
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 20:52:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HKqIBe004579;
	Thu, 17 Jul 2014 15:52:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HKqIdh016090;
	Thu, 17 Jul 2014 15:52:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 17 Jul 2014 15:52:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HKqIcA030424;
	Thu, 17 Jul 2014 15:52:18 -0500
Date: Thu, 17 Jul 2014 16:52:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20140717205217.GW15788@edge>
References: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
	<CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h9=Tfyh98+P-eL=fvJdfbzimi2kmJNYC0i+x4X8MsyeDA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 17 Jul 2014 20:52:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi, Brian,

Sorry for the delay.

You basically have 2 options:

1. Use the BSP originally made by TI specifically for OMAPL138 devices, 
including AM18x. That would mean kernel 2.6.37 and hence, you'd need older 
toolchain (~gcc-4.5) and older usedspace and system libs like udev... To 
achieve that you'd need to use an older release of Yocto/OE/Arago, say Denzil, 
Danny, maybe Dylan.

2. Use the latest mainline kernel, which supports most of OMAPL138 platforms, 
but TI doesn't make an official product based on this, so no commercial 
support, unfortunately. But you can use the latest toolchain, userspace etc. 
with it and build it out of more recent Yocto/OE/Arago, like master, Daisy, 
Dora etc.

As of the LICENSE breagake in meta-arago - I'll fix it, but the old gcc-4.5 
based Arago toolchain is now pretty much deprecated.

-- 
Denys


On Thu, Jul 17, 2014 at 09:30:11AM -0400, Brian Hutchinson wrote:
> No ARM9 folks on here?
> 
> On Fri, Jul 11, 2014 at 4:34 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
> 
> > So what I did is edit
> > tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
> > and replaced the LICENSE md5 with the value it calculated in the error
> > above and that fixed it.  So not sure if a recipe is busted or if I
> > hosed up something somehow but I thought I'd ask about it.
> >
> > So what is the story with ARM9 AM1808?  Can I use Linaro toolchain yet
> > or is there still some compatibility issue that is best if I use the
> > Arago 2011.09?
> >
> > Thanks for any ideas/pointers.
> >
> > Regards,
> >
> > Brian
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

