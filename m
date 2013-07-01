Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 63BE652AAD
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 18:55:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61Itcqp026161;
	Mon, 1 Jul 2013 13:55:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61ItcNX029537;
	Mon, 1 Jul 2013 13:55:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 13:55:37 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r61ItbbD023042;
	Mon, 1 Jul 2013 13:55:38 -0500
Date: Mon, 1 Jul 2013 14:55:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130701185537.GA4941@edge>
References: <1372696212-29133-1-git-send-email-denis@denix.org>
	<1372696212-29133-2-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015962C5BA@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015962C5BA@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] arago-test-image: fixes for RAMDISK usage
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
X-List-Received-Date: Mon, 01 Jul 2013 18:55:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2013 at 05:52:32PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Monday, July 01, 2013 11:30 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 2/2] arago-test-image: fixes for
> >RAMDISK usage
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >* Build tar.gz and ext2.gz - good for RAMDISK/SD/NFS
> >* Relax compatibility list to be generic
> >* Remove large multimedia packagegroup to better fit into RAM
> >
> 
> Why not squash this with the previous patch?

The first patch was from Carlos, so I didn't want to hack it up right away so 
he gets a proper credit... But I guess I can squash them and mention that in 
the commit message...


> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >Cc: Carlos Hernandez <ceh@ti.com>
> >---
> > meta-arago-distro/recipes-core/images/arago-test-image.bb | 3 +--
> > 1 file changed, 1 insertion(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-core/images/arago-test-
> >image.bb b/meta-arago-distro/recipes-core/images/arago-test-
> >image.bb
> >index 49e5a8d..403041f 100644
> >--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
> >@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM =
> >"file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
> >
> > require arago-image.inc
> >
> >-COMPATIBLE_MACHINE =
> >"omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
> >+IMAGE_FSTYPES = "tar.gz ext2.gz"
> >
> > IMAGE_INSTALL += "\
> >     packagegroup-arago-base \
> >     packagegroup-arago-console \
> >     packagegroup-arago-base-tisdk \
> >     packagegroup-arago-tisdk-crypto \
> >-    packagegroup-arago-tisdk-multimedia \
> >     packagegroup-arago-tisdk-addons \
> >     packagegroup-arago-test \
> >     packagegroup-arago-test-addons \
> >--
> >1.8.2.1
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

