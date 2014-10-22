Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 85F3E529B0
	for <meta-arago@arago-project.org>;
	Wed, 22 Oct 2014 16:32:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9MGWqw6019406
	for <meta-arago@arago-project.org>; Wed, 22 Oct 2014 11:32:52 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MGWquw017465
	for <meta-arago@arago-project.org>; Wed, 22 Oct 2014 11:32:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 11:32:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MGWpI9018062;
	Wed, 22 Oct 2014 11:32:52 -0500
Date: Wed, 22 Oct 2014 12:32:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20141022163251.GJ25408@edge>
References: <1413226732-25636-1-git-send-email-sam.nelson@ti.com>
	<4F9216F96E5DF9428610502835A9F4905807631D@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905807631D@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [oe-layersetup][PATCH] configs: Add release config mcsdk/mcsdk-03.01.01.04
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
X-List-Received-Date: Wed, 22 Oct 2014 16:32:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry for the delay - ack. Will push shortly.

On Fri, Oct 17, 2014 at 07:08:50PM +0000, Nelson, Sam wrote:
> Ping.
> 
> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Monday, October 13, 2014 2:59 PM
> > To: meta-arago@arago-project.org
> > Cc: Nelson, Sam
> > Subject: [oe-layersetup][PATCH] configs: Add release config mcsdk/mcsdk-
> > 03.01.01.04
> > 
> > - Based on release config mcsdk/mcsdk-3.1.0-config.txt
> >       with updated commit ids for mcsdk release 3.1.1
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  configs/mcsdk/mcsdk-03.01.01.04-config.txt |   14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 configs/mcsdk/mcsdk-03.01.01.04-config.txt
> > 
> > diff --git a/configs/mcsdk/mcsdk-03.01.01.04-config.txt
> > b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
> > new file mode 100644
> > index 0000000..b894589
> > --- /dev/null
> > +++ b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
> > @@ -0,0 +1,14 @@
> > +# This file takes repo entries in the format
> > +# repo name,repo uri,repo branch,repo
> > commit[,layers=layer1:layer2...:layern]
> > +
> > +bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b
> > 87379bf629066f6662458,layers=
> > +meta-mcsdk,git://arago-project.org/git/projects/meta-
> > mcsdk.git,master,832a44b1821a8d509e3461aa03c41fa915fb640b,layers=
> > +meta-arago,git://arago-project.org/git/meta-
> > arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-
> > arago-distro:meta-arago-extras
> > +meta-qt5,git://github.com/meta-qt5/meta-
> > qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
> > +meta-openembedded,git://git.openembedded.org/meta-
> > openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layer
> > s=toolchain-layer:meta-networking:meta-ruby:meta-oe
> > +meta-ti,git://arago-project.org/git/meta-
> > ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
> > +meta-linaro,git://git.linaro.org/openembedded/meta-
> > linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-
> > linaro-toolchain
> > +meta-java,git://github.com/woglinde/meta-
> > java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
> > +oe-core,git://git.openembedded.org/openembedded-
> > core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
> > +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> > +OECORELOCALCONF=./sample-files/local-arago.conf.sample
> > --
> > 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

