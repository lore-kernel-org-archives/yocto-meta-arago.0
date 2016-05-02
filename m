Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4009152A8C
	for <meta-arago@arago-project.org>;
	Mon,  2 May 2016 17:59:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u42HxApd014703
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 12:59:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42HxA56005227
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 12:59:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 2 May 2016 12:59:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42HxA75020150;
	Mon, 2 May 2016 12:59:10 -0500
Date: Mon, 2 May 2016 13:58:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160502175854.GN1546@edge>
References: <20160428190038.C1285529EF@arago-project.org>
	<4B26FB5A64EBA14C87266869E037F9581426AD99@DFLE09.ent.ti.com>
	<20160502171436.GI1546@edge> <20160502173718.GK1546@edge>
MIME-Version: 1.0
In-Reply-To: <20160502173718.GK1546@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-ti] Sam Nelson : cmem: Update to new eng version 4.11.00.00_eng
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
X-List-Received-Date: Mon, 02 May 2016 17:59:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Moving discussion to meta-arago.
What about ipsecmgr breakage?


On Mon, May 02, 2016 at 01:37:18PM -0400, Denys Dmytriyenko wrote:
> On Mon, May 02, 2016 at 01:14:36PM -0400, Denys Dmytriyenko wrote:
> > Sam,
> 
> Sorry, I was thinking Jake, but writing Sam due to the quoted commit below... :)
> 
> 
> > I don't think anything was removed or disabled in meta-ti. Other than that, 
> > yes, in due time cmem dependencies will be re-enabled in meta-arago.
> > 
> > -- 
> > Denys
> > 
> > 
> > On Mon, May 02, 2016 at 10:32:26AM -0400, Stiffler, Jacob wrote:
> > > Denys,
> > > 
> > > Now that the build issue with CMEM has been resolved, will you be reverting 
> > > the hacks to remove everything that depended on CMEM?
> > > 
> > > Thank you,
> > > Jake
> > > 
> > > > -----Original Message-----
> > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > > bounces@yoctoproject.org] On Behalf Of Arago Project git
> > > > Sent: Thursday, April 28, 2016 3:01 PM
> > > > To: meta-ti@yoctoproject.org
> > > > Subject: [meta-ti] Sam Nelson : cmem: Update to new eng version
> > > > 4.11.00.00_eng
> > > > 
> > > > Module: meta-ti
> > > > Branch: master
> > > > Commit: 257a370e7aec4a8954e79697deafec2cd7c2301d
> > > > URL:    http://arago-project.org/git/meta-
> > > > ti.git?a=commit;h=257a370e7aec4a8954e79697deafec2cd7c2301d
> > > > 
> > > > Author: Sam Nelson <sam.nelson@ti.com>
> > > > Date:   Thu Apr 28 00:19:45 2016 +0000
> > > > 
> > > > cmem: Update to new eng version 4.11.00.00_eng
> > > > 
> > > > Resolves issues with kernel version 4.4
> > > > 
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > 
> > > > ---
> > > > 
> > > >  recipes-bsp/cmem/cmem.inc |    6 +++---
> > > >  1 files changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > > > index 19d333c..413f925 100644
> > > > --- a/recipes-bsp/cmem/cmem.inc
> > > > +++ b/recipes-bsp/cmem/cmem.inc
> > > > @@ -4,10 +4,10 @@ LICENSE = "GPLv2"
> > > >  LIC_FILES_CHKSUM =
> > > > "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a6
> > > > 36c91aed4b02ac1"
> > > > 
> > > >  BRANCH ?= "lu-next"
> > > > -# This corresponds to version 4.10.02.05_eng -SRCREV =
> > > > "8df44102413c2d653341c5b7e6caee882e206d8c"
> > > > +# This corresponds to version 4.11.00.00_eng SRCREV =
> > > > +"852e97b5584cbdb6aa0fdef02a7c4e245409bcb6"
> > > > 
> > > > -PV = "4.10.02.05+git${SRCPV}"
> > > > +PV = "4.11.00.00+git${SRCPV}"
> > > > 
> > > >  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> > > > 
> > > > 
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

