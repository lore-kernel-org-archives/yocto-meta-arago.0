Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29C7C54798
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 00:17:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5413.1709684227969252676
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 16:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC26640C3A;
	Wed,  6 Mar 2024 00:17:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1G40dlTEWtn; Wed,  6 Mar 2024 00:17:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F3EA407DA;
	Wed,  6 Mar 2024 00:17:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 23ED9163EC6; Tue,  5 Mar 2024 19:17:02 -0500 (EST)
Date: Tue, 5 Mar 2024 19:17:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] websocketd: Add GOPROXY variable
Message-ID: <20240306001702.GJ6072@denix.org>
References: <20240305230707.24641-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305230707.24641-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Mar 2024 00:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15226

On Tue, Mar 05, 2024 at 05:07:07PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> As of go v1.21, GOPROXY is required to be set to something other than

Other than what?

> or you get the following error:
> 
> go: github.com/gorilla/websocket@v1.4.0: GOPROXY list is not the empty string, but contains no entries
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
> index 66475726..207cd38a 100644
> --- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
> @@ -7,6 +7,8 @@ inherit go-mod
>  
>  GO_IMPORT = "github.com/joewalnes/websocketd"
>  
> +export GOPROXY = "https://proxy.golang.org,direct"
> +
>  SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
>  SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
>  
> -- 
> 2.17.1

