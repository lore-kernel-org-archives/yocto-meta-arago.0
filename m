Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 01527529B0
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 14:26:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5REQC4Z001542
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 09:26:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5REQBrq005692
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 09:26:12 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:26:11 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5REQBL1005300;
	Thu, 27 Jun 2013 09:26:11 -0500
Date: Thu, 27 Jun 2013 10:26:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130627142610.GL28379@edge>
References: <1372308234-6315-1-git-send-email-heroor@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961B784@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015961B784@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv2 oe-layersetup] configs: Update glsdk 6.01.00	to point to GLSDK staging trees
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
X-List-Received-Date: Thu, 27 Jun 2013 14:26:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any particular reason for hosting those trees on git.ti.com instead of 
arago-project.org? When we were finalizing the policies for git.ti.com, the 
agreement was to keep all the Arago-related repos on arago-project.org...


On Thu, Jun 27, 2013 at 12:05:40PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> Thanks for changing the name.
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Heroor, Siddharth
> >Sent: Wednesday, June 26, 2013 11:44 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCHv2 oe-layersetup] configs: Update
> >glsdk 6.01.00 to point to GLSDK staging trees
> >
> >* Follow the AMSDK model of having staging trees to tag releases.
> >* GLSDK meta-ti staging tree is hosted at
> >  git://git.ti.com/glsdk/meta-ti-glsdk.git
> >* GLSDK meta-arago staging tree is hosted at
> >  git://git.ti.com/glsdk/meta-arago-glsdk.git
> >
> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >---
> > configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
> > 1 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
> >b/configs/glsdk/glsdk-06.01.00-config.txt
> >index 6159262..47915ad 100644
> >--- a/configs/glsdk/glsdk-06.01.00-config.txt
> >+++ b/configs/glsdk/glsdk-06.01.00-config.txt
> >@@ -2,9 +2,9 @@
> > # repo name,repo uri,repo branch,repo
> >commit[,layers=layer1:layer2...:layern]
> >
> > bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
> >-meta-arago,git://arago-project.org/git/meta-
> >arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
> >extras
> >+meta-arago,git://git.ti.com/glsdk/meta-arago-
> >glsdk.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-
> >extras
> > meta-openembedded,git://git.openembedded.org/meta-
> >openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
> >=toolchain-layer:meta-oe
> >-meta-ti,git://arago-project.org/git/meta-
> >ti.git,danny,ti2013.04.02,layers=
> >+meta-ti,git://git.ti.com/glsdk/meta-ti-
> >glsdk.git,danny,ti2013.04.02,layers=
> > meta-linaro,git://git.linaro.org/openembedded/meta-
> >linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
> > oe-core,git://git.openembedded.org/openembedded-
> >core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
> > OECORELAYERCONF=./sample-files/bblayers.conf.sample
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

