Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 02DE9529AD
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2020 15:37:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02AFYvAp070188
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2020 10:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583854497;
	bh=Sa0eDu4H6cJTuVba9I/kIYW95B2D8vgvQDq/g/6qvhQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SlDorcmqk9r69GssA6Xhi6k5c+YPoIKk8NFbKUJgJ+6BYmKdbOLj/6ubIXWqb5qnh
	cSsrxBW5N9vSczJkC7ui/E6RebEf3EDgZVmNPf7TuirmmvDKDP6DWCaF7KtvdZOEA+
	Ej8qEDXLNArE+HDVPxp15AXZjeyLlAHHDWdEBIZU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02AFYvm9069497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2020 10:34:57 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 10 Mar 2020 10:34:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 10 Mar 2020 10:34:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02AFYvhW016098;
	Tue, 10 Mar 2020 10:34:57 -0500
Date: Tue, 10 Mar 2020 11:34:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20200310153456.GV2301@beryl>
References: <20200306174625.16312-1-a0271529@ti.com>
	<20200306182656.GY1628@beryl>
	<f05d086b2cc345169824afc4a943d7ed@ti.com>
MIME-Version: 1.0
In-Reply-To: <f05d086b2cc345169824afc4a943d7ed@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud] [PATCH] packagegroup-arago-tisdk-addons: add tensorflow-lite
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
X-List-Received-Date: Tue, 10 Mar 2020 15:37:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 06, 2020 at 05:26:57PM -0500, Gou, Hongmei wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, March 6, 2020 1:27 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [thud] [PATCH] packagegroup-arago-tisdk-addons:
> > add tensorflow-lite
> > 
> > On Fri, Mar 06, 2020 at 12:46:25PM -0500, Hongmei Gou wrote:
> > > * This is for including the examples built from the tensforflow lite package
> > >   to the target filesystem at usr/share/tensorflow-lite/examples
> > >
> > > * As tensorflow-lite is creating static library, tensorflow-lite-demo which
> > >   depends on tensorflow-lite will not bring in the examples folder for
> > >   tensorflow-lite to the target filesystem
> > 
> > Not really clear from this description - do you package examples in a separate
> > package? Then you need to list that package in RDEPENDS packagegroup
> > below.
> > Otherwise the standard depency from demo package should be fine.
> 
> There used to be a separate tensorflow-lite-examples package for the examples.
> The examples got in the tensorflow-lite package after changing the target location
> to /usr/share/tensorflow-lite. So, the current tensorflow-lite package itself contains
> the examples (console output).
> 
> On the other hand, we newly introduced the tensorflow-lite-demo package which
> contains demos with GUI display, and it depends on tensorflow-lite.

Sorry for the delay.

So, tensorflow-lite-demo links *statically* against tensorflow-lite and hence 
there's no RDEPENDS preserved, which was expected to be there for the proper 
packaging to work...

Is static linking the expected behavior? Are there plans to link dynamically?


Second question - should examples from tensorflow-lite still be packaged 
separately? I understand they got moved and now picked up by the main package 
automatically. But there is an easy way to get the old behavior by prepending 
examples package to the PACKAGES list, instead of appending.


I guess I can merge this to thud as is, but would like to clean this up going 
forward, so please answer above questions anyway. Thanks!

Denys


> > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > ---
> > > This is applicable to thud only, since zeus/master is now using ti-
> > analytics.bb
> > >
> > >  .../packagegroups/packagegroup-arago-tisdk-addons.bb        | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-addons.bb b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-arago-tisdk-addons.bb
> > > index 583d2c0b..ff34ab95 100644
> > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> > tisdk-addons.bb
> > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > arago-tisdk-addons.bb
> > > @@ -1,6 +1,6 @@
> > >  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
> > >  LICENSE = "MIT"
> > > -PR = "r77"
> > > +PR = "r78"
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > > @@ -153,6 +153,7 @@ ARMNN_PACKAGES = "armnn"
> > >  EXTRA_PACKAGES_append_ti33x = " voxelsdk \
> > >                                  arm-compute-library \
> > >                                  ${ARMNN_PACKAGES} \
> > > +                                tensorflow-lite \
> > >                                  tensorflow-lite-demo \
> > >                                  pdm-anomaly-detection \
> > >  "
> > > @@ -160,6 +161,7 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk \
> > >  EXTRA_PACKAGES_append_ti43x = " voxelsdk \
> > >                                  arm-compute-library \
> > >                                  ${ARMNN_PACKAGES} \
> > > +                                tensorflow-lite \
> > >                                  tensorflow-lite-demo \
> > >                                  pdm-anomaly-detection \
> > >  "
> > > @@ -169,12 +171,14 @@ EXTRA_PACKAGES_append_omap-a15 = "
> > voxelsdk \
> > >                                     big-data-ipc-demo-linux-firmware \
> > >                                     arm-compute-library \
> > >                                     ${ARMNN_PACKAGES} \
> > > +                                   tensorflow-lite \
> > >                                     tensorflow-lite-demo \
> > >                                     pdm-anomaly-detection \
> > >  "
> > >
> > >  EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
> > >                               ${ARMNN_PACKAGES} \
> > > +                             tensorflow-lite \
> > >                               tensorflow-lite-demo \
> > >                               pdm-anomaly-detection \
> > >  "
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

