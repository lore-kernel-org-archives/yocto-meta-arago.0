Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09904CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 14:53:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36759.1778856799380702334
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 May 2026 07:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D031340CCA;
	Fri, 15 May 2026 14:53:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aFwkTtWJBK8; Fri, 15 May 2026 14:53:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 721DC40CC3;
	Fri, 15 May 2026 14:53:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2ADC717DAE2; Fri, 15 May 2026 10:53:13 -0400 (EDT)
Date: Fri, 15 May 2026 10:53:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, detheridge@ti.com,
	b-brnich@ti.com, a-christidis@ti.com
Subject: Re: [meta-arago][master][PATCH] open62541: Update upstream-status
 of configurable server patch
Message-ID: <20260515145313.GD7941@denix.org>
References: <20260514215426.452140-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514215426.452140-1-t-lannynd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 May 2026 14:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17522

On Thu, May 14, 2026 at 04:54:26PM -0500, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Update Upstream-Status from Submitted to Backport because it
> got merged upstream.

Thanks for following up on this old patch and getting it upstreamed!


> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>  .../0001-examples-client-allow-configurable-server.patch        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
> index f6a1b724..e950875f 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] examples: client: allow configurable server
>  * Enable a remote server URL to be provided as an argument.
>  * Default to localhost if no arguments are provided.
>  
> -Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/8045]
> +Upstream-Status: Backport [dc33c82dcbeea22f8e4fa9ee5e41b691e8db1f03]
>  
>  Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>  Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> -- 
> 2.34.1

