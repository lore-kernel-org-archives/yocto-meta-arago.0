Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 1615952B11
	for <meta-arago@arago-project.org>;
	Thu, 27 May 2021 11:14:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RBFJTQ076386;
	Thu, 27 May 2021 06:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622114119;
	bh=mgMQ/HqkGb9Pu8KC1UB8qCqgWi3U6wuoPBtMbAZ4eFI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o1gS6r0Mfmcm1EGC7R7yt2kvf7zWb9CFL3NlG/r/gyOnh+srFSvEejEYgMHM2fzk5
	L7Cj5E26Je4a5I9Rroo4Jiu6fQWyZZHXGF46WXjHb17yOmIk7qHvR6WUX95GhGzRDl
	GBDy4lTA5OD3thGmRuonAliBoFnQH7KK0ePzZhyM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RBFJfu023601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 May 2021 06:15:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 27 May 2021 06:15:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 27 May 2021 06:15:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RBFHgs055744;
	Thu, 27 May 2021 06:15:18 -0500
Date: Thu, 27 May 2021 16:45:16 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20210527111516.5hcawc6zahzfj5ud@NiksLab>
References: <20210524095203.13658-1-nikhil.nd@ti.com>
	<20210524114254.ref3c3rdvdw3gi25@prepay>
	<20210524120756.xjjreqivioneetff@NiksLab>
	<20210526013754.GG1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210526013754.GG1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Thu, 27 May 2021 11:14:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 21:37-20210525, Denys Dmytriyenko wrote:
> On Mon, May 24, 2021 at 05:37:56PM +0530, Nikhil Devshatwar wrote:
> > On 06:42-20210524, Nishanth Menon wrote:
> > > On 15:22-20210524, Nikhil Devshatwar wrote:
> > > > Add packages in the tisdk-addons which allows to build Gstreamer and
> > > > other GST based demo applications from the target filesystem.
> > > > 
> > > > All these are open source packages, recipes for which are already
> > > > present in upstream layers.
> > > > 
> > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > > ---
> > > >  .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 +++++++++--
> > > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > > index 287cba63..2c3fff5c 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > > @@ -1,6 +1,6 @@
> > > >  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> > > >  LICENSE = "MIT"
> > > > -PR = "r79"
> > > > +PR = "r80"
> > > >  
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > >  
> > > > @@ -67,7 +67,14 @@ UTILS_append_k3 = " mmc-utils \
> > > >  UTILS_append_am64xx = " ti-rtos-firmware"
> > > >  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> > > >  UTILS_append_j7 = " ti-rtos-firmware"
> > > > -UTILS_append_j7-evm = " pru-icss"
> > > > +UTILS_append_j7-evm = " \
> > > > +    pru-icss \
> > > > +    cmake \
> > > > +    libyaml \
> > > > +    python3-pyyaml \
> > > > +    boost \
> > > > +    ninja \
> > > > +"
> > > >  UTILS_append_j7-hs-evm = " pru-icss"
> > > >  
> > > >  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> > > 
> > > 
> > > Should'nt we go the other direction of making the core layer thinner and
> > > add the packages as part of the dependencies of what ever the demos we'd
> > > want to add?
> > 
> > Yes, but that is possible only when we have feeds enabled.
> > Till then, there should be at least one filesystem where everything is
> > present.
> 
> Can this be added to meta-psdkla or whatever the current downstream layer is?

For now, this is already added in meta-psdkla.
I am trying to upstream this into meta-arago since the change is
generic. That's why the addition is happening only to j7-evm

Regards,
Nikhil D

> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

