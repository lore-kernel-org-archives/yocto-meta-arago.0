Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 7D1B8529A5
	for <meta-arago@arago-project.org>;
	Mon, 24 May 2021 12:07:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OC7wY6038056
	for <meta-arago@arago-project.org>; Mon, 24 May 2021 07:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621858078;
	bh=XHsHWQFOWXFxwH0uk8Z/QsOsClUZJCzKIH86NP5fJWg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=atPLNdLaCA5Ys8M0GjCK35+PK90pE0N6rMUwOVB7q5sSCZ3kAwliSzTWuWqEJl3QI
	5HeXg5DufFuZ4Ykq8pBQ8uf9x2ovxmll8wYyjtyxZNHIMpRQAIeNnyoofCH5LvGliW
	t+Yg+xCO+2ecSkhy/n08ztBDbKMemPP0k5/Ii7Hw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OC7wuX014235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 May 2021 07:07:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 24 May 2021 07:07:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 24 May 2021 07:07:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OC7vTK088954;
	Mon, 24 May 2021 07:07:57 -0500
Date: Mon, 24 May 2021 17:37:56 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210524120756.xjjreqivioneetff@NiksLab>
References: <20210524095203.13658-1-nikhil.nd@ti.com>
	<20210524114254.ref3c3rdvdw3gi25@prepay>
MIME-Version: 1.0
In-Reply-To: <20210524114254.ref3c3rdvdw3gi25@prepay>
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
X-List-Received-Date: Mon, 24 May 2021 12:07:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 06:42-20210524, Nishanth Menon wrote:
> On 15:22-20210524, Nikhil Devshatwar wrote:
> > Add packages in the tisdk-addons which allows to build Gstreamer and
> > other GST based demo applications from the target filesystem.
> > 
> > All these are open source packages, recipes for which are already
> > present in upstream layers.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  .../packagegroups/packagegroup-arago-tisdk-addons.bb  | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > index 287cba63..2c3fff5c 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> >  LICENSE = "MIT"
> > -PR = "r79"
> > +PR = "r80"
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > @@ -67,7 +67,14 @@ UTILS_append_k3 = " mmc-utils \
> >  UTILS_append_am64xx = " ti-rtos-firmware"
> >  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> >  UTILS_append_j7 = " ti-rtos-firmware"
> > -UTILS_append_j7-evm = " pru-icss"
> > +UTILS_append_j7-evm = " \
> > +    pru-icss \
> > +    cmake \
> > +    libyaml \
> > +    python3-pyyaml \
> > +    boost \
> > +    ninja \
> > +"
> >  UTILS_append_j7-hs-evm = " pru-icss"
> >  
> >  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> 
> 
> Should'nt we go the other direction of making the core layer thinner and
> add the packages as part of the dependencies of what ever the demos we'd
> want to add?

Yes, but that is possible only when we have feeds enabled.
Till then, there should be at least one filesystem where everything is
present.

Currently this packagegroup is added in tisdk-default-image.
Let me know if there is better packagegroup for these additions.
I always am confused about which packagegroup is for what.


Regards,
Nikhil D
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

