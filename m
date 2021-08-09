Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9D93D52ACA
	for <meta-arago@arago-project.org>;
	Mon,  9 Aug 2021 18:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 176E140C1D;
	Mon,  9 Aug 2021 18:24:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GrAWZHEnF8lG; Mon,  9 Aug 2021 18:24:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C255140952;
	Mon,  9 Aug 2021 18:24:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84472174651; Mon,  9 Aug 2021 14:24:04 -0400 (EDT)
Date: Mon, 9 Aug 2021 14:24:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20210809182404.GF1528@denix.org>
References: <20210806114852.60704-1-priya.ns@ti.com>
	<37141086-c8fc-919a-8a7e-73e7edd96926@ti.com>
	<20210809181731.c4wnpmmwz7n27b42@NiksLab>
MIME-Version: 1.0
In-Reply-To: <20210809181731.c4wnpmmwz7n27b42@NiksLab>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Sekhar Nori <nsekhar@ti.com>, meta-arago@arago-project.org,
	Priya N S <priya.ns@ti.com>
Subject: Re: [oe-layersetup PATCH v2] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Mon, 09 Aug 2021 18:23:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 11:47:31PM +0530, Nikhil Devshatwar wrote:
> On 11:50-20210806, Bajjuri, Praneeth wrote:
> > > +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> > > +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> > > +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
> > > +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> > > +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
> > > +meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dunfell,HEAD,layers=meta-optee
> > 
> > By the way, why do you even need meta-linaro layer for psdkl builds?

Looks like it is added for meta-optee, but it has since Dunfell been moved to 
meta-arm...


> > > +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> > > +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
> > > +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> > > +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> > > 
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

