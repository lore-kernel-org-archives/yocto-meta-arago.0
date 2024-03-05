Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97726C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3949.1709671477403760829
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 12:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE31240C2B;
	Tue,  5 Mar 2024 20:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0-6B6KziSNI; Tue,  5 Mar 2024 20:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 142DB40C16;
	Tue,  5 Mar 2024 20:44:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F417163EC0; Tue,  5 Mar 2024 15:44:32 -0500 (EST)
Date: Tue, 5 Mar 2024 15:44:32 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] make-mod-scripts: Remove append
 for CROSS_COMPILE
Message-ID: <20240305204432.GH6072@denix.org>
References: <20240305191205.67958-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305191205.67958-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 20:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15223

Ack

On Tue, Mar 05, 2024 at 01:12:05PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This has been fixed upstream. Remove this bbappends.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../make-mod-scripts/make-mod-scripts_1.0.bbappend               | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
> 
> diff --git a/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend b/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
> deleted file mode 100644
> index b76af9fc..00000000
> --- a/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -EXTRA_OEMAKE += "CROSS_COMPILE=${TARGET_PREFIX}"
> -- 
> 2.39.2

