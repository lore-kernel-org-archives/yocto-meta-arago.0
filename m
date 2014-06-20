Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 077E652A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:15:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJF4fL001340;
	Fri, 20 Jun 2014 14:15:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJF3nD009236;
	Fri, 20 Jun 2014 14:15:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Jun 2014 14:15:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJF2nB032517;
	Fri, 20 Jun 2014 14:15:03 -0500
Date: Fri, 20 Jun 2014 15:15:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140620191459.GC1825@edge>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-12-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D93C3@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D93C3@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 11/19] wl18xx-firmware: specify the branch being used for this version
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
X-List-Received-Date: Fri, 20 Jun 2014 19:15:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Just being lazy and there's one bb recipe, so the branch can change with 
SRCREV.
In other recipes SRCREV and SRC_URI were in different files so didn't want 
branch to be hidden and missed on next update....


On Fri, Jun 20, 2014 at 07:09:50PM +0000, Maupin, Chase wrote:
> On second thought, looking at patch 12 is there any reason not to use a 
> BRANCH variable?
> 
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 11/19] wl18xx-firmware: specify the
> >branch being used for this version
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Bitbake fetcher now requires the branch to be specified when
> >SRCREV is not on master
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a8.10.bb
> >| 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> >firmware_r8.a8.10.bb b/meta-arago-extras/recipes-bsp/wl18xx-
> >firmware/wl18xx-firmware_r8.a8.10.bb
> >index 5db1c99..b59f1c4 100644
> >--- a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> >firmware_r8.a8.10.bb
> >+++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-
> >firmware_r8.a8.10.bb
> >@@ -13,7 +13,7 @@ RCONFLICTS_${PN} += "wl12xx-firmware"
> >
> > # Tag: ol_r8.a8.10
> > SRCREV = "89dc93a5c23fd69ebacd64c936ba5aabf173c29b"
> >-SRC_URI = "git://github.com/TI-
> >OpenLink/wl18xx_fw.git;protocol=git \
> >+SRC_URI = "git://github.com/TI-
> >OpenLink/wl18xx_fw.git;protocol=git;branch=mbss \
> >            file://0001-Add-Makefile-for-SDK.patch \
> >           "
> >
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

