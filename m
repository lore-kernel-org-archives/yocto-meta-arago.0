Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D5C4152993
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 22:44:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6OMiqVN070599
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 17:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532472292;
	bh=TuUJgRk1qqzTVjoIuu/8uC4gWu83oGQbrmLGxEGMPOY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yL9RAPck+7K+OIR38RYUAsYCGnGrXCD9bRySwdcTbYhqe4CJ8hQmTknRcrWvzy0cr
	B3FSY+ZsUbPcetfiq6Bjngs7FpkLmT9H7Y7WxXO+LVP9qCZq/F9iV8nKs/+mO0tVbI
	pYmveY28TQdCKNeT+MEJlxXLV7mMzw2uzysA9bRI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OMiplF008944
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 17:44:52 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 17:44:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 24 Jul 2018 17:44:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OMipvD018148;
	Tue, 24 Jul 2018 17:44:51 -0500
Date: Tue, 24 Jul 2018 18:44:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20180724224424.GN5506@beryl>
References: <1532465828-3221-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <1532465828-3221-1-git-send-email-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com
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
X-List-Received-Date: Tue, 24 Jul 2018 22:44:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 24, 2018 at 04:57:08PM -0400, Djordje Senicic wrote:
> * Use real-life video clip and list of classes
> 
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---

Please make change notes like "subject line fixed" in here, after ---


>  meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index d2b570d..f1a34eb 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
>  BRANCH = "master"
>  
>  SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
> +SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

