Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id DF6DF52A63
	for <meta-arago@arago-project.org>;
	Thu,  6 Oct 2016 19:38:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u96JcHEk010526;
	Thu, 6 Oct 2016 14:38:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u96JcHPN032000;
	Thu, 6 Oct 2016 14:38:17 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 14:38:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u96JcGrA019686;
	Thu, 6 Oct 2016 14:38:17 -0500
Date: Thu, 6 Oct 2016 15:38:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20161006193816.GA12745@edge>
References: <1475775104-6182-1-git-send-email-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F95814304334@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814304334@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] branding-processor-sdk: enable RESERVE_CMEM by	default
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
X-List-Received-Date: Thu, 06 Oct 2016 19:38:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 06, 2016 at 06:18:15PM +0000, Stiffler, Jacob wrote:
> Seeing this reminds me how out of date this file has become. I'll try to 
> send a patch by the end of next week.

Sounds good, thanks.


> But as opencl is the main consumer of CMEM, could we use that machine 
> feature to determine whether or not to reserve memory for CMEM?

Well, I guess that's an option, as long as it stays in ProcessorSDK branding 
for now - CoreSDK still needs to build w/o CMEM enabled, but building OpenCL 
is fine, even though it won't work properly w/o CMEM...


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Thursday, October 06, 2016 1:32 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] branding-processor-sdk: enable
> > RESERVE_CMEM by default
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta-arago-distro/conf/distro/include/branding-processor-
> > sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > index bd51f76..d97518d 100644
> > --- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> > @@ -1,6 +1,7 @@
> >  ARAGO_TISDK_IMAGE = "processor-sdk-linux-image"
> > 
> >  # Set CMEM reserved memory region
> > +RESERVE_CMEM_omap-a15 = "1"
> >  CMEM_BASE_omap-a15 ?= "a0000000"
> >  CMEM_SIZE_omap-a15 ?= "08000000"
> > 
> > --
> > 2.7.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

