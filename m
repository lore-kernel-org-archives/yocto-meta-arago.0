Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFA0C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:34:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15471.1693233261011699888
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C15940CB0;
	Mon, 28 Aug 2023 14:34:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnUqHJ0QkOWF; Mon, 28 Aug 2023 14:34:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3BCD140C24;
	Mon, 28 Aug 2023 14:34:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0A062163C75; Mon, 28 Aug 2023 10:34:18 -0400 (EDT)
Date: Mon, 28 Aug 2023 10:34:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCHv2 3/3] irqbalance: remove
 append to install systemd script
Message-ID: <20230828143417.GM3359@denix.org>
References: <20230822224427.1880115-1-rs@ti.com>
 <20230822224427.1880115-4-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822224427.1880115-4-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14870

On Tue, Aug 22, 2023 at 05:38:31PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> The source recipe that this file appends to already has the
> corresponding logic to install both the systemd and sysvinit service and
> set them to load on start. No reason to override them.

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-extended/irqbalance/irqbalance_git.bbappend     | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> index ff504150..7c289fc1 100644
> --- a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> +++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> @@ -1,8 +1,4 @@
>  SRCREV = "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
> -PV = "1.9.2"
> -
> -do_install:append () {
> -         install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
> -}
> +PV = "1.9.2+git${SRCPV}"
>  
>  PR:append = ".arago3"
> -- 
> 2.41.0

