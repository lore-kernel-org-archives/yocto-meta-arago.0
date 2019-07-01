Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B015252972
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2019 20:16:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61KFq4t021777
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 15:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562012152;
	bh=lNsKvvdDKO41l2mC7QAIW+NRrwuztA1S0YSKfkBKSYM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K8tM3alv9swxFQZjLfvfcOFjBNtaUXiyvyGy1CmxHlxjIcXPE7HLRgVzrfKyVr48H
	hbiOdI05o3wHih8j3s0FVfqvFg6EswVBI6aIHN9cPLm6gwnXPk5YggObHI0+nWzxdd
	Ms/uhOIK8RbIL2s89uBIHXB496ng8HW/saxjDa6E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61KFqak019203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 15:15:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 15:15:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 1 Jul 2019 15:15:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61KFqXb098903;
	Mon, 1 Jul 2019 15:15:52 -0500
Date: Mon, 1 Jul 2019 16:15:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>
Message-ID: <20190701201551.GK21181@beryl>
References: <20190629043954.7786-1-g-tammana@ti.com>
	<01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
	<20190701194641.GJ21181@beryl>
	<858e3b31cd6140568e090ad92a57b43e@ti.com>
MIME-Version: 1.0
In-Reply-To: <858e3b31cd6140568e090ad92a57b43e@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
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
X-List-Received-Date: Mon, 01 Jul 2019 20:16:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 01, 2019 at 04:13:46PM -0400, Tammana, Gowtham wrote:
> 
> 
> >Subject: Re: [meta-arago] [thud][PATCH 1/3] arago-prefs: Specify gbm provider for J7
> >
> >And grepping through meta-arago also shows omapdrmtest needs update as well.
> 
> For omapmdrmtest, I thought this will disable the omapdrmtest from building for J7.
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=d568864026fba1cb09935416027cf3ef385f123b
> 
> It should be disabled for J7. How do we do that if the above is not the right way?

Correct, omapdrmtest won't break J7 and won't even build for it. But just for 
completeness, I updated it to depend on virtual/libgbm and that's set to 
libgbm for other platforms.

-- 
Denys


> >On Mon, Jul 01, 2019 at 07:44:36PM +0000, Dmytriyenko, Denys wrote:
> >> ERROR: Nothing PROVIDES 'libgbm' (but /OE/arago-thud-next-build/sources/meta-arago/meta-arago-
> >extras/recipes-graphics/kmscube/kmscube_1.0.0.bb DEPENDS on or otherwise requires it)
> >> libgbm was skipped: PREFERRED_PROVIDER_virtual/libgbm set to ti-img-rogue-umlibs, not libgbm
> >> NOTE: Runtime target 'kmscube' is unbuildable, removing...
> >> Missing or unbuildable dependency chain was: ['kmscube', 'libgbm']
> >>
> >>
> >> > -----Original Message-----
> >> > From: Tammana, Gowtham
> >> > Sent: Saturday, June 29, 2019 12:40 AM
> >> > To: meta-arago@arago-project.org; Dmytriyenko, Denys
> >> > Cc: Balagopalakrishnan, Anand; Ruei, Eric; Tammana, Gowtham
> >> > Subject: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provider for
> >> > J7
> >> >
> >> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> >> > ---
> >> >  meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++--
> >> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-
> >> > arago-distro/conf/distro/include/arago-prefs.inc
> >> > index 939569c0..0f961322 100644
> >> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> > @@ -23,8 +23,12 @@ PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-
> >> > img-rogue-driver"
> >> >  PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> >> >
> >> >  # GBM (Generic Buffer Management) preferences
> >> > -PREFERRED_PROVIDER_libgbm = "libgbm"
> >> > -PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
> >> > +PREFERRED_PROVIDER_virtual/libgbm = "libgbm"
> >> > +PREFERRED_PROVIDER_virtual/libgbm-dev = "libgbm-dev"
> >> > +
> >> > +# J7 gbm provider
> >> > +PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
> >> > +PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm = "ti-img-rogue-umlibs-
> >> > dev"
> >> >
> >> >  # This is required when using keystone devices with graphical support
> >> >  # such as Qt5
> >> > --
> >> > 2.22.0
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

