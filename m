Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B4FC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 20:43:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3856.1709671420556158732
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 12:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E02C640C2B;
	Tue,  5 Mar 2024 20:43:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jlu7Top4IWOs; Tue,  5 Mar 2024 20:43:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 033C640C16;
	Tue,  5 Mar 2024 20:43:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AE516163EC0; Tue,  5 Mar 2024 15:43:35 -0500 (EST)
Date: Tue, 5 Mar 2024 15:43:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] at: Remove append for bison-native
 dependency
Message-ID: <20240305204335.GG6072@denix.org>
References: <20240305190932.66840-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305190932.66840-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 20:43:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15222

Ack

On Tue, Mar 05, 2024 at 01:09:32PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This has been fixed upstream. Remove this bbappends.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-arago-distro/recipes-extended/at/at_%.bbappend | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 meta-arago-distro/recipes-extended/at/at_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-extended/at/at_%.bbappend b/meta-arago-distro/recipes-extended/at/at_%.bbappend
> deleted file mode 100644
> index ab5a588b..00000000
> --- a/meta-arago-distro/recipes-extended/at/at_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -DEPENDS += "bison-native"
> -- 
> 2.39.2

