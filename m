Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6A4F3529D4
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 14:00:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4AE0fJr013047
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 09:00:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4AE0fqc027079
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 09:00:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 10 May 2013 09:00:41 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r4AE0fUn024322;
	Fri, 10 May 2013 09:00:41 -0500
Date: Fri, 10 May 2013 10:00:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130510140040.GG13151@edge>
References: <1368182794-8463-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED10159554B57@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F4905491D894@DLEE11.ent.ti.com>
	<20130510135511.GF13151@edge>
MIME-Version: 1.0
In-Reply-To: <20130510135511.GF13151@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/3] Add pciutils to the console package
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
X-List-Received-Date: Fri, 10 May 2013 14:00:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Oh, and the commit message should be of the proper format:

packagegroup-arago-console: add pciutils

Please see this past post about the same:
http://arago-project.org/pipermail/meta-arago/2013-May/001373.html

-- 
Denys


On Fri, May 10, 2013 at 09:55:12AM -0400, Denys Dmytriyenko wrote:
> Sam,
> 
> See below.
> 
> On Fri, May 10, 2013 at 01:43:44PM +0000, Nelson, Sam wrote:
> > Thanks for the response.
> > Pciutils provides very basic utilities for pci, when you have pci interface 
> > supported in the platform. ( I guess this is common).  There was customer 
> > request to have it in a minimal file system.
> > 
> > If it does not belong in here. Please suggest any alternate recipes where 
> > this will naturally belong.
> > 
> > There is only 1 patch, I wanted to send.  The other patches are not 
> > relevant, please ignore.
> > 
> > With regards,
> > sam
> > 
> > 
> > -----Original Message-----
> > From: Maupin, Chase 
> > Sent: Friday, May 10, 2013 9:26 AM
> > To: Nelson, Sam; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH 1/3] Add pciutils to the console package
> > 
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago- 
> > >bounces@arago-project.org] On Behalf Of Nelson, Sam
> > >Sent: Friday, May 10, 2013 5:47 AM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH 1/3] Add pciutils to the console package
> > 
> > Why are you adding this to the console package?  That is supposed to be a 
> > small package so what is the use case for adding this here instead of 
> > somewhere else?
> > 
> > Also, I didn't see patches 2 and 3 of this set.  Did I miss them?
> > 
> > >
> > >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >---
> > > .../packagegroups/packagegroup-arago-console.bb    |    1 +
> > > 1 file changed, 1 insertion(+)
> > >
> > >diff --git a/meta-arago-distro/recipes- 
> > >core/packagegroups/packagegroup-arago-console.bb b/meta-arago- 
> > >distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> > >index 5a80064..930049a 100755
> > >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > >arago-console.bb
> > >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > >arago-console.bb
> > >@@ -25,6 +25,7 @@ ARAGO_UTILS = "\
> > >     i2c-tools \
> > >     iproute2 \
> > >     strace \
> > >+    pciutils \
> 
>     ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
> 
> And don't forget to add "pci" to the list of MACHINE_FEATURES for your machine 
> "keystone-evm" or better yet to your SOC "keystone", if it's a common 
> peripheral for all Keystone devices.
> 
> > You would need to bump the PR
> 
> Agree, make sure you bump PR on every recipe change.
> 
> -- 
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

