Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D781E52A02
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2019 19:06:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JJ5Z4e062896
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 14:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566241535;
	bh=zH94GR1k64XGs7w1NNFmuhl9aeJ9yS0mZ2KFi2+tUNg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fUBCHtFMkMwvk65ve1iYPj1DJB3Dh1Do5h5U0EdzH89GJqEV9vY1R2aMYGJ9mOajp
	h29gyQNH1u1sUP2XM1BKLXo4CUo0ZChc22LmPEBUkz5hYHtTVHkfx/UtpX0uU/3XvR
	ulKyPFt5131Xeaht9XDAojAnqLqoksmcAax6OpeE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JJ5ZK3077219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2019 14:05:35 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 14:05:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 19 Aug 2019 14:05:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JJ5ZNd083941;
	Mon, 19 Aug 2019 14:05:35 -0500
Date: Mon, 19 Aug 2019 15:05:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>
Message-ID: <20190819190534.GN2365@beryl>
References: <20190809194048.63206-1-xuj@ti.com> <20190813235100.GI7130@beryl>
	<2fbc9fffcb904bc5b2424489bd39ddf8@ti.com>
MIME-Version: 1.0
In-Reply-To: <2fbc9fffcb904bc5b2424489bd39ddf8@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Mon, 19 Aug 2019 19:06:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

It was building default arago-core-tisdk-bundle.

On Mon, Aug 19, 2019 at 11:47:52AM -0400, Xu, Jianzhong wrote:
> Denys,
> 
> I tried "MACHINE=am65xx-evm bitbake nativesdk-tidl-utils" in my local Yocto 
> and it builds fine.
> 
> Did you try to do "MACHINE=am65xx-evm bitbake tidl-utils" when you saw the 
> failure? It wouldn't build because am65xx-evm is not in the 
> COMPATIBLE_MACHINES of tidl-utils.
> 
> Thanks,
> Jianzhong
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, August 13, 2019 7:51 PM
> To: Xu, Jianzhong
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [thud/master] [PATCH] tidl-utils: bump SRCREV
> 
> This update fails on am65x. Does it require armnn changes? If so, should be in 
> the series, not 2 separate patches.
> 
> 
> On Fri, Aug 09, 2019 at 03:40:48PM -0400, Jianzhong Xu wrote:
> > * tidl import tool fixes for non-square padding and Caffe data layer format
> > 
> > Signed-off-by: Jianzhong Xu <xuj@ti.com>
> > ---
> >  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> > index 2c29fc27..6fdeec48 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> > +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> > @@ -1,6 +1,6 @@
> >  SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> > -SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
> > +SRCREV = "b2466e02f99d85d8afcbc93edc612da5cc9345de"
> >  
> > -PV = "01.01.01.00"
> > +PV = "01.01.02.00"
> >  PR = "r0"
> >  
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

