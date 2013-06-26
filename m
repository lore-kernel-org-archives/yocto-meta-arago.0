Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F134552992
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 13:52:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QDqV2l006129
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 08:52:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QDqVZm008648
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 08:52:31 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 08:52:31 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QDqVG2013141;
	Wed, 26 Jun 2013 08:52:31 -0500
Date: Wed, 26 Jun 2013 09:52:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130626135230.GF27031@edge>
References: <1372244789-11835-1-git-send-email-heroor@ti.com>
	<7D46E86EC0A8354091174257B2FED10159617484@DLEE11.ent.ti.com>
	<20130626135057.GE27031@edge>
MIME-Version: 1.0
In-Reply-To: <20130626135057.GE27031@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH oe-layersetup] configs: Update glsdk 6.01.00 to	point to GLSDK staging trees
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
X-List-Received-Date: Wed, 26 Jun 2013 13:52:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 26, 2013 at 09:50:57AM -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 26, 2013 at 12:56:29PM +0000, Maupin, Chase wrote:
> > >-----Original Message-----
> > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >bounces@arago-project.org] On Behalf Of Heroor, Siddharth
> > >Sent: Wednesday, June 26, 2013 6:06 AM
> > >To: meta-arago@arago-project.org
> > >Subject: [meta-arago] [PATCH oe-layersetup] configs: Update glsdk
> > >6.01.00 to point to GLSDK staging trees
> > >
> > >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> > >cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > >---
> > > configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
> > > 1 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
> > >b/configs/glsdk/glsdk-06.01.00-config.txt
> > >index 6159262..a4ada4c 100644
> > >--- a/configs/glsdk/glsdk-06.01.00-config.txt
> > >+++ b/configs/glsdk/glsdk-06.01.00-config.txt
> > >@@ -2,9 +2,9 @@
> > > # repo name,repo uri,repo branch,repo
> > >commit[,layers=layer1:layer2...:layern]
> > >
> > > bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
> > >-meta-arago,git://arago-project.org/git/meta-
> > >arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
> > >extras
> > >+meta-arago,git://git.ti.com/glsdk/meta-
> > >arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
> > >extras
> > 
> > I have some concern if you are already starting to branch to your own tree.  
> > I hope we won't see a large divergence here.
> > 
> > Also, maybe a nitpick but is there a reason you named your repo meta-arago 
> > and meta-ti on git.ti.com?  I worry that this will cause confusion with the 
> > true meta-arago and meta-ti on arago-project.org, particularly since you are 
> > using the same tag name too.  Can you rename these like the AMSDK did?
> 
> I would agree here as well - hosting meta-ti and meta-arago clones on 
> git.ti.com is very confusing regardless of the name and sets a bad precedent. 
> I would be happy to give you your own trees on arago-project.org either in the 
> personal area or in the projects area. That is how it is done with other 
> Arago-based SDKs - AMSDK, MCSD, etc.

One little clarification - "your own trees for tagging purposes". As we 
discussed, let's try to avoid forking as much as possible - please keep 
upstreaming your changes.


> > > meta-openembedded,git://git.openembedded.org/meta-
> > >openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
> > >=toolchain-layer:meta-oe
> > >-meta-ti,git://arago-project.org/git/meta-
> > >ti.git,danny,ti2013.04.02,layers=
> > >+meta-ti,git://git.ti.com/glsdk/meta-
> > >ti.git,danny,ti2013.04.02,layers=
> > > meta-linaro,git://git.linaro.org/openembedded/meta-
> > >linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
> > > oe-core,git://git.openembedded.org/openembedded-
> > >core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
> > > OECORELAYERCONF=./sample-files/bblayers.conf.sample
> > >--
> > >1.7.0.4
> > >
> > >_______________________________________________
> > >meta-arago mailing list
> > >meta-arago@arago-project.org
> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

