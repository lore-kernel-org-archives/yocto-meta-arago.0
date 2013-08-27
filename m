Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9BAFF52A5D
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 15:30:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RFU5KJ001425
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 10:30:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RFU4N8021208
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 10:30:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 27 Aug 2013 10:30:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RFU2KI031852;
	Tue, 27 Aug 2013 10:30:02 -0500
Date: Tue, 27 Aug 2013 11:30:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130827153001.GL2339@edge>
References: <CF956B779D819D41BBC043B7082161D54454A4@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596EBBAB@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596EBBAB@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] configs: Lock down the GLSDK release 6.02.00.01
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
X-List-Received-Date: Tue, 27 Aug 2013 15:30:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 27, 2013 at 03:04:13PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>

Ack? Why?


> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
> >Sent: Tuesday, August 27, 2013 3:11 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH] configs: Lock down the GLSDK release
> >6.02.00.01
> >
> >
> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >---
> > ....01.00-config.txt => glsdk-06.02.00-config.txt} |    4 ++--
> > 1 files changed, 2 insertions(+), 2 deletions(-)  copy
> >configs/glsdk/{glsdk-06.01.00-config.txt => glsdk-06.02.00-
> >config.txt} (89%)
> >
> >diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
> >b/configs/glsdk/glsdk-06.02.00-config.txt
> >similarity index 89%
> >copy from configs/glsdk/glsdk-06.01.00-config.txt
> >copy to configs/glsdk/glsdk-06.02.00-config.txt
> >index 5708106..969bf55 100644
> >--- a/configs/glsdk/glsdk-06.01.00-config.txt
> >+++ b/configs/glsdk/glsdk-06.02.00-config.txt
> >@@ -2,9 +2,9 @@
> > # repo name,repo uri,repo branch,repo
> >commit[,layers=layer1:layer2...:layern]
> >
> > bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
> >-meta-arago,git://arago-project.org/git/projects/meta-arago-
> >glsdk.git,danny,DEV_SDK_06_01_00_01,layers=meta-arago-distro:meta-
> >arago-extras
> >+meta-arago,git://arago-project.org/git/projects/meta-arago-
> >glsdk.git,da
> >+nny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-
> >extras
> > meta-openembedded,git://git.openembedded.org/meta-
> >openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
> >=toolchain-layer:meta-oe
> >-meta-ti,git://arago-project.org/git/projects/meta-ti-
> >glsdk.git,danny,DEV_SDK_06_01_00_01,layers=
> >+meta-ti,git://arago-project.org/git/projects/meta-ti-
> >glsdk.git,danny,DE
> >+V_SDK_06_02_00_01,layers=
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

