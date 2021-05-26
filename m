Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6D37552AE3
	for <meta-arago@arago-project.org>;
	Wed, 26 May 2021 01:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2DAD540C32;
	Wed, 26 May 2021 01:37:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EFEU5k_cd2gJ; Wed, 26 May 2021 01:37:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EDBF940A3D;
	Wed, 26 May 2021 01:37:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B37BA1745EA; Tue, 25 May 2021 21:37:54 -0400 (EDT)
Date: Tue, 25 May 2021 21:37:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20210526013754.GG1528@denix.org>
References: <20210524095203.13658-1-nikhil.nd@ti.com>
	<20210524114254.ref3c3rdvdw3gi25@prepay>
	<20210524120756.xjjreqivioneetff@NiksLab>
MIME-Version: 1.0
In-Reply-To: <20210524120756.xjjreqivioneetff@NiksLab>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, shyam.jagannathan@ti.com
Subject: Re: [dunfell/master][PATCH] packagegroups: arago-tisdk-addons: Add packages to allow building on target
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
X-List-Received-Date: Wed, 26 May 2021 01:37:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2021 at 05:37:56PM +0530, Nikhil Devshatwar wrote:
> On 06:42-20210524, Nishanth Menon wrote:
> > On 15:22-20210524, Nikhil Devshatwar wrote:
> > > Add packages in the tisdk-addons which allows to build Gstreamer and
> > > other GST based demo applications from the target filesystem.
> > > 
> > > All these are open source packages, recipes for which are already
> > > present in upstream layers.
> > > 
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > ---
> > >  .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > index 287cba63..2c3fff5c 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> > >  LICENSE = "MIT"
> > > -PR = "r79"
> > > +PR = "r80"
> > >  
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  
> > > @@ -67,7 +67,14 @@ UTILS_append_k3 = " mmc-utils \
> > >  UTILS_append_am64xx = " ti-rtos-firmware"
> > >  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> > >  UTILS_append_j7 = " ti-rtos-firmware"
> > > -UTILS_append_j7-evm = " pru-icss"
> > > +UTILS_append_j7-evm = " \
> > > +    pru-icss \
> > > +    cmake \
> > > +    libyaml \
> > > +    python3-pyyaml \
> > > +    boost \
> > > +    ninja \
> > > +"
> > >  UTILS_append_j7-hs-evm = " pru-icss"
> > >  
> > >  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> > 
> > 
> > Should'nt we go the other direction of making the core layer thinner and
> > add the packages as part of the dependencies of what ever the demos we'd
> > want to add?
> 
> Yes, but that is possible only when we have feeds enabled.
> Till then, there should be at least one filesystem where everything is
> present.

Can this be added to meta-psdkla or whatever the current downstream layer is?

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

