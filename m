Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA53C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 21:31:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6210.1686259913145208992
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 14:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3655540C62;
	Thu,  8 Jun 2023 21:31:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXju2xQ8VH88; Thu,  8 Jun 2023 21:31:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0923040AE9;
	Thu,  8 Jun 2023 21:31:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4FD751639C9; Thu,  8 Jun 2023 17:31:01 -0400 (EDT)
Date: Thu, 8 Jun 2023 17:31:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: afd@ti.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] systemd: drop the
 useradd params
Message-ID: <20230608213101.GE9226@denix.org>
References: <20230608204752.2060719-1-rs@ti.com>
 <20230608204752.2060719-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608204752.2060719-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 21:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14561

On Thu, Jun 08, 2023 at 03:47:51PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> These were incorrect and OE-Core has been carrying the equivalent patch
> since 42344347be2.

Well, I agree with the code change - these are now redundant.

But the message is not right - these were perfectly correct at the time 
(later those were changed from /bin/nologin to /sbin/nologin upstream) and 
the commit referred dealt with override syntax change, the actual addition 
of useradd lines per PACKAGECONFIG happened a bit earlier...

Also, since you are removing networkd and resolved specific changes, can you 
move appending these PACKAGECONFIGs to arago.conf, like you do in patch #2?


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> index 9e49ac69..a38ca124 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> +++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
> @@ -3,8 +3,6 @@ PR:append = ".arago6"
>  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>  
>  PACKAGECONFIG:append = " networkd resolved"
> -USERADD_PARAM:${PN} += "--system -d / -M --shell /bin/nologin systemd-network;"
> -USERADD_PARAM:${PN} += "--system -d / -M --shell /bin/nologin systemd-resolve;"
>  
>  SRC_URI:append = " \
>      file://local.rules \
> -- 
> 2.41.0

