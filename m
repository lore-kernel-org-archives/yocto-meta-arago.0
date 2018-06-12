Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5962252A39
	for <meta-arago@arago-project.org>;
	Tue, 12 Jun 2018 21:38:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5CLc9JR031450
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 16:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528839489;
	bh=cSTZPWotjvluPUevo6WKLB2POSzcxvT7WkwZ8Qx/JPc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Uh4bNKt6Y4VxHqjFzUkSlLNLH7+CnNZxknzB5uKPjPft9p8y83oFByMTGe/RepvZ7
	SFtNF9FweB1Lo7ufKWRrA/HE6b7zZR6AQz6BcF3QPLYulkywt3gC08KWh6Rda8totZ
	S72F4N02pnFR9BifrHGhOhGFgMbC7miljDM/8NzY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5CLc9wV001183
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 16:38:09 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 12 Jun 2018 16:38:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 12 Jun 2018 16:38:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5CLc9bG020030;
	Tue, 12 Jun 2018 16:38:09 -0500
Date: Tue, 12 Jun 2018 17:36:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ramprasad N <x0038811@ti.com>
Message-ID: <20180612213658.GB5417@beryl>
References: <1528778710-2395-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
In-Reply-To: <1528778710-2395-1-git-send-email-x0038811@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko V2 0/2] gstreamer 1.12 patches
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
X-List-Received-Date: Tue, 12 Jun 2018 21:38:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry for the delay.
What are the differences from v1?


On Tue, Jun 12, 2018 at 10:15:08AM +0530, Ramprasad N wrote:
> Update SRCREV of gst-vpe and gst-ducati with latest commits
> 
> Ramprasad N (2):
>   gstvpe: Bump SRCREV with latest fixes
>   gst-ducati: Update SRCREV with latest commit
> 
>  .../gstreamer1.0-plugins-ducati_git.bb             |  4 +--
>  ...late-the-output-structure-with-progressiv.patch | 33 ----------------------
>  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
>  3 files changed, 4 insertions(+), 38 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch
> 
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

