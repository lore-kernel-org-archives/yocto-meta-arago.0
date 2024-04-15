Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF35FC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 19:59:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2727.1713211158888880231
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 12:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5BC240CBD;
	Mon, 15 Apr 2024 19:59:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnhDzJi87IEp; Mon, 15 Apr 2024 19:59:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5480640A3D;
	Mon, 15 Apr 2024 19:59:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8DFA0163F17; Mon, 15 Apr 2024 15:59:12 -0400 (EDT)
Date: Mon, 15 Apr 2024 15:59:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-core: dbus:
 Remove redundant bbappend
Message-ID: <20240415195912.GE28791@denix.org>
References: <20240415055542.3372278-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415055542.3372278-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Apr 2024 19:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15283

As dbus is dual-licensed, back in the day it was required to choose which one 
is used when distributing the package with Arago and TI-SDK, hence:

https://git.yoctoproject.org/meta-arago/commit/?id=3fa4af20ea823b91448ad03a8ef5da053890dc12

Not sure if that's still the case though...


On Mon, Apr 15, 2024 at 11:25:42AM +0530, Chirag Shilwant wrote:
> dbus recipe from oe-core:meta already has the appropriate
> SPDX license identifiers [1]. Hence, remove this bbappend.
> 
> [1]: https://git.openembedded.org/openembedded-core/plain/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 3 ---
>  1 file changed, 3 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> deleted file mode 100644
> index da612c59..00000000
> --- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -PR:append = ".arago1"
> -
> -LICENSE = "GPL-2.0-or-later"
> -- 
> 2.34.1

