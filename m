Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3EF3552A67
	for <meta-arago@arago-project.org>;
	Tue,  7 May 2013 03:08:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r473859k028461
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 22:08:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47385cp017271
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 22:08:05 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 22:08:04 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47384uN011814;
	Mon, 6 May 2013 22:08:04 -0500
Date: Mon, 6 May 2013 23:08:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130507030803.GA32479@edge>
References: <1367875806-8694-1-git-send-email-fcooper@ti.com>
	<20130506213151.GB10607@edge>
	<8F29D6B095ED194EA1980491A5E029710C44AC4E@DFLE08.ent.ti.com>
	<20130506223056.GE10607@edge>
	<8F29D6B095ED194EA1980491A5E029710C44AF05@DFLE08.ent.ti.com>
	<20130506230542.GH10607@edge>
	<8F29D6B095ED194EA1980491A5E029710C44B03D@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C44B03D@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago.conf: Correct TOOLCHAIN_BRAND for ARM9 SOCs
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
X-List-Received-Date: Tue, 07 May 2013 03:08:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 06, 2013 at 08:07:19PM -0400, Cooper Jr., Franklin wrote:
> > > > > > > diff --git a/meta-arago-distro/conf/distro/arago.conf
> > > > > > > b/meta-arago-distro/conf/distro/arago.conf
> > > > > > > index 3954360..048c480 100644
> > > > > > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > > > > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > > > > > @@ -21,7 +21,9 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2
> > > > > > > irda largefile pcmcia usbgadget usbh
> > > > > > >
> > > > > > >  # Toolchain should be selected by setting TOOLCHAIN_BRAND in
> > > > > > > local.conf  # Set some sane defaults, in case someone forgets
> > > > > > > to set them in local.conf -TOOLCHAIN_BRAND ?= "linaro"
> > > > > > > +# ARM9 is not supported by the Linaro toolchain so default
> > > > > > > +back to the Arago # toolchain for ARM9 based SOCs.
> > > > > > > +TOOLCHAIN_BRAND ?=
> > > > > > "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
> > > > > >
> > > > > > I don't feel this belongs in the arago.conf - as the comment
> > > > > > above says, this is supposed to be set in the local.conf
> > > > > > anyways, here it just offers a default fall back...
> > > > >
> > > > > I don't see what harm is done by tweaking the variable to insure
> > > > > an optimal and safe default fall back is provided for all
> > > > > platforms we support. This patch changes nothing except fixes a broken
> > use case.
> > > >
> > > > Overhead - it calls that Python function every time you evaluate
> > > > TOOLCHAIN_BRAND variable...
> > > >
> > > > I might be more lenient with something like this though:
> > > >
> > > > TC_SANEDEFAULT := "${@...}"
> > > > TOOLCHAIN_BRAND ?= "${TC_SANEDEFAULT}"
> > > >
> > > > Although, that would no longer work in local.conf, only arago.conf...
> > >
> > > If you have no objection with me putting my suggested change to
> > > TOOLCHAIN_BRAND in oe-layersetup local.conf.sample then I am fine with
> > > dropping this patch.
> > 
> > Either way is fine. You didn't like to split it in 2 lines like above?
> 
> I did like your suggestion but I was confused by the statement "Although, 
> that would no longer work in local.conf, only arago.conf...". 
> TOOLCHAIN_BRAND could still be overridden in local.conf but TC_SANEDEFAULT 
> couldn't. Is that really a problem since originally the expectation was that 
> someone should be overriding TOOLCHAIN_BRAND anyway?

Correct - I meant setting TC_SANEDEFAULT like that (immediate assignment with 
Python code) won't work in local.conf. Which is fine, as TOOLCHAIN_BRAND can 
be overriden from local.conf anyway.


> If your fine with the below then I'll send a v2
> TC_SANEDEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
> TOOLCHAIN_BRAND ?= "${TC_SANEDEFAULT}"

Yes, please.

-- 
Denys

