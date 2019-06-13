Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BF94F52991
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2019 21:44:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5DLiG5U111021
	for <meta-arago@arago-project.org>; Thu, 13 Jun 2019 16:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560462256;
	bh=i53oh96WyLxyvQeaFstN6rFtjAsHl2THR3Jng1E9VQs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=L4rKNN0zsPepagIClTz0MBcqw4mrMrd5aLiFnCUaShLE7yM7P5xbaZuOhCiD5CqYQ
	klXpExJM3ZDc8BwBn4KaWtyxQfNU+jRLScvGl+uxBH0btfQCIctccKCOmhJsPX6tVN
	hehgKt95Wn8UAYWf8HhJ3a5Sms8igBGfuGPZgHMQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5DLiGRx045991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 13 Jun 2019 16:44:16 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 13 Jun 2019 16:44:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 13 Jun 2019 16:44:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5DLiGi4077467;
	Thu, 13 Jun 2019 16:44:16 -0500
Date: Thu, 13 Jun 2019 17:44:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>
Message-ID: <20190613214416.GF21029@beryl>
References: <20190611180913.10651-1-x0157990@ti.com>
	<20190612140934.GA17081@beryl>
	<69eb4f12533e42ff818f4ff363c877e5@ti.com>
MIME-Version: 1.0
In-Reply-To: <69eb4f12533e42ff818f4ff363c877e5@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATH] point-cloud-viewer: New binary compiled with gcc8 toolchain
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
X-List-Received-Date: Thu, 13 Jun 2019 21:44:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 12, 2019 at 08:20:40PM -0400, Senicic, Djordje wrote:
> "libstdc++" not needed any more in RDEPENDS?

libstdc++ is part of the toolchain and is one of the implicit dependencies.
Since previously the binary was built with an older toolchain, it would 
generate QA errors regarding sime symbols in libstdc++. Even adding it to 
RDEPENDS didn't fix it before, hence the new rebuilt binary was needed.
Either way libstdc++ is not needed in RDEPENDS.

Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, June 12, 2019 10:10 AM
> To: Senicic, Djordje
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [thud/master][PATH] point-cloud-viewer: New binary compiled with gcc8 toolchain
> 
> Now I'm seeing this:
> 
> ERROR: point-cloud-viewer-2.1-r1 do_package_qa: QA Issue: /usr/bin/point_cloud_viewer contained in package point-cloud-viewer requires libxkbcommon.so.0, but no providers found in RDEPENDS_point-cloud-viewer? [file-rdeps]
> 
> 
> On Tue, Jun 11, 2019 at 02:09:13PM -0400, Djordje Senicic wrote:
> > Signed-off-by: Djordje Senicic <x0157990@ti.com>
> > ---
> >  .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> > index e477448b..9ee4ff0b 100644
> > --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> > +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> > @@ -11,9 +11,9 @@ BRANCH = "master"
> >  
> >  SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
> >  
> > -SRCREV = "ac8f7a8334b6458676810349ab84f718ecd16975"
> > +SRCREV = "c4800b186744e9379c798299c5caa67f6a4468f0"
> >  
> > -PV = "2.0"
> > +PV = "2.1"
> >  
> >  S = "${WORKDIR}/git"
> >  
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

