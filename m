Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EA4B952972
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2019 19:47:26 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61JkfXa013123
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 14:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562010401;
	bh=1Kc1bWK0CEiPWeJhA/JiPcnbivwnDrRQ3swDwTroLBw=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=gQ+ln1b/ZGnNu6zkSQERKHsejw6o4VlwLWCQUebhsEzSIXB2ptFapt+OuCiCx947R
	5nQcX9Qjh4Y+prYCmwguafUU64Whtg0v7+2eCikNuPVyCR3S/WIqPv3dltat2aXUa/
	zSXoHz/+NmH3YK04ATBrZzBlhwaGhdSIP0E2xO5A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61Jkf15069166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2019 14:46:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 1 Jul 2019 14:46:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 1 Jul 2019 14:46:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61JkfV4059526;
	Mon, 1 Jul 2019 14:46:41 -0500
Date: Mon, 1 Jul 2019 15:46:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-ID: <20190701194641.GJ21181@beryl>
References: <20190629043954.7786-1-g-tammana@ti.com>
	<01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
MIME-Version: 1.0
In-Reply-To: <01736aa0fb904ba99ccebbd22ca8d2d5@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Mon, 01 Jul 2019 19:47:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

And grepping through meta-arago also shows omapdrmtest needs update as well.


On Mon, Jul 01, 2019 at 07:44:36PM +0000, Dmytriyenko, Denys wrote:
> ERROR: Nothing PROVIDES 'libgbm' (but /OE/arago-thud-next-build/sources/meta-arago/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb DEPENDS on or otherwise requires it)
> libgbm was skipped: PREFERRED_PROVIDER_virtual/libgbm set to ti-img-rogue-umlibs, not libgbm
> NOTE: Runtime target 'kmscube' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['kmscube', 'libgbm']
> 
> 
> > -----Original Message-----
> > From: Tammana, Gowtham
> > Sent: Saturday, June 29, 2019 12:40 AM
> > To: meta-arago@arago-project.org; Dmytriyenko, Denys
> > Cc: Balagopalakrishnan, Anand; Ruei, Eric; Tammana, Gowtham
> > Subject: [meta-arago][thud][PATCH 1/3] arago-prefs: Specify gbm provider for
> > J7
> > 
> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/include/arago-prefs.inc | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-
> > arago-distro/conf/distro/include/arago-prefs.inc
> > index 939569c0..0f961322 100644
> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> > @@ -23,8 +23,12 @@ PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-
> > img-rogue-driver"
> >  PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> > 
> >  # GBM (Generic Buffer Management) preferences
> > -PREFERRED_PROVIDER_libgbm = "libgbm"
> > -PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
> > +PREFERRED_PROVIDER_virtual/libgbm = "libgbm"
> > +PREFERRED_PROVIDER_virtual/libgbm-dev = "libgbm-dev"
> > +
> > +# J7 gbm provider
> > +PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
> > +PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm = "ti-img-rogue-umlibs-
> > dev"
> > 
> >  # This is required when using keystone devices with graphical support
> >  # such as Qt5
> > --
> > 2.22.0
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

