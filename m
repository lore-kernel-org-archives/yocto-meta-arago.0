Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 80388529F8
	for <meta-arago@arago-project.org>;
	Fri,  9 Jun 2017 20:59:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v59Kx9w4019462
	for <meta-arago@arago-project.org>; Fri, 9 Jun 2017 15:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497041949;
	bh=A+3K0VhyyGNxyLZiMWhVr/V9WOu3JI9ookz5EWGgEEc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xjcyxNPmV7q5mg8QsikeFy8+ZfuPrxjlT7iQAJIK1IszRcX20yzLQbc16Gw1Cr8N4
	xEyhnIiGmu2s3IGs0WuGNhpdvaNQ+MHCFShIJtyvKRkyrzqmYtwKC2YVmM4ODNANBj
	xDKExjUiz+dO9Ftxg5ERqn1O5qSFaPTlzmUUAYik=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v59Kx9hL016997
	for <meta-arago@arago-project.org>; Fri, 9 Jun 2017 15:59:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Jun 2017 15:59:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v59Kx9Fo012239;
	Fri, 9 Jun 2017 15:59:09 -0500
Date: Fri, 9 Jun 2017 16:59:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20170609205907.GS21219@edge>
References: <1497038541-71848-1-git-send-email-denys@ti.com>
	<2E957F12D11D904590FA9AF86D366BD926D3A59B@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926D3A59B@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH] arago-core-tisdk-image: disable	deployment of MLO only for k2g HS device
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
X-List-Received-Date: Fri, 09 Jun 2017 20:59:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks.
BTW, if you want your ack to be recorded in the git commit, you have to use a 
formal format of "Acked-by: Name <email>"


On Fri, Jun 09, 2017 at 04:19:31PM -0400, Gou, Hongmei wrote:
> ACK
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Friday, June 09, 2017 4:02 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [morty/master][PATCH] arago-core-tisdk-image:
> > disable deployment of MLO only for k2g HS device
> > 
> > Be specific and only unset it for k2g HS device, as k2g GP does provide
> > MLO/SPL
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
> > image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
> > image.bb
> > index 974db93..d361c3d 100644
> > --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> > +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
> > @@ -4,7 +4,8 @@ DEPLOY_SPL_NAME_omapl138 = ""
> >  DEPLOY_SPL_NAME_k2hk = ""
> >  DEPLOY_SPL_NAME_k2l-evm = ""
> >  DEPLOY_SPL_NAME_k2e = ""
> > -DEPLOY_SPL_NAME_k2g = ""
> > +# Only unset it for HS device, as k2g GP does provide MLO/SPL
> > +DEPLOY_SPL_NAME_k2g-hs-evm = ""
> > 
> >  ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
> >  export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
> > --
> > 2.7.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

