Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C1BB952993
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 23:48:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6ONmRYr057145
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 18:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532476107;
	bh=57UcIrRiT68qocExByNl0Pl293kySTmeoipDzzqG1GU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kFtBjgZtgcp9+HHmziPJEcUepnvjNBcEZu2byNv8o3MpY5Bil9fX+piGA+U6LT+YZ
	xgpXBstTLReaFiOL1mEp4MpFn1iDldTPoO5qOaDDQ5VXL3fuWSZ2T4JSM5/feNtLmO
	Ejgym6LRuPvh6T40Mujo0D2NFVbB/YnJWN7PE+dM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6ONmRPl009323
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 18:48:27 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 18:48:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 24 Jul 2018 18:48:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6ONmRoI031356;
	Tue, 24 Jul 2018 18:48:27 -0500
Date: Tue, 24 Jul 2018 19:47:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>
Message-ID: <20180724234700.GB2269@beryl>
References: <1532465828-3221-1-git-send-email-x0157990@ti.com>
	<20180724224424.GN5506@beryl>
	<dcd4002b5f8d4657afc3266067b53ee8@ti.com>
MIME-Version: 1.0
In-Reply-To: <dcd4002b5f8d4657afc3266067b53ee8@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCHv2] tidl-api: Update test video clip (subject line fixed)
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
X-List-Received-Date: Tue, 24 Jul 2018 23:48:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I understood the need for v2, but everything in Subject line besides square 
brackets goes into git commit log, including (subject line fixed), which has 
no meaning to the actual change that will get into git history. I only pointed 
out where comments like this should go, so they are human readable, but will 
be ignored by git. And yes, clean v3 would be nice, thanks.

-- 
Denys


On Tue, Jul 24, 2018 at 06:47:08PM -0400, Senicic, Djordje wrote:
> Previous (same) patch was accidently left w/o any subject (blank line).
> Do I need to resubmit  PATCHv3?
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, July 24, 2018 6:44 PM
> To: Senicic, Djordje
> Cc: meta-arago@arago-project.org; Senicic, Djordje
> Subject: Re: [meta-arago] [rocko/master][PATCHv2] tidl-api: Update test video clip (subject line fixed)
> 
> On Tue, Jul 24, 2018 at 04:57:08PM -0400, Djordje Senicic wrote:
> > * Use real-life video clip and list of classes
> > 
> > Signed-off-by: Djordje Senicic <x0157990@ti.com>
> > ---
> 
> Please make change notes like "subject line fixed" in here, after ---
> 
> 
> >  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> > index d2b570d..f1a34eb 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> > @@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
> >  BRANCH = "master"
> >  
> >  SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> > -SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
> > +SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
> > -- 
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

