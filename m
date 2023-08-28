Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8BDC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:33:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15607.1693233208984045993
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A4E240CB0;
	Mon, 28 Aug 2023 14:33:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAx8Z96xlXZR; Mon, 28 Aug 2023 14:33:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F008C40C24;
	Mon, 28 Aug 2023 14:33:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BB54C163C75; Mon, 28 Aug 2023 10:33:25 -0400 (EDT)
Date: Mon, 28 Aug 2023 10:33:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCHv2 2/3]
 packagegroup-arago-base: edit the description to describe current use
Message-ID: <20230828143325.GL3359@denix.org>
References: <20230822224427.1880115-1-rs@ti.com>
 <20230822224427.1880115-3-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822224427.1880115-3-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14869

On Tue, Aug 22, 2023 at 05:38:30PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Edit the description of this packagegroup to more accurately describe
> it's current use in this dependency web. Additionally convert the
> DESCRIPTION to SUMMARY, since this is under 72 characters and not full,
> long description.

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index ff32112a..1f63a7d0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "Basic task to get a device booting"
> +SUMMARY = "Base tools that are recommended for most images"
>  LICENSE = "MIT"
>  PR = "r9"
>  
> -- 
> 2.41.0

