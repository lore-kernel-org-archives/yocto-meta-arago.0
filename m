Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3337F4BB97
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 22:33:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32915.1771972410037629304
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 14:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 44D2D40C8F;
	Tue, 24 Feb 2026 22:33:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8bTjpejckRN4; Tue, 24 Feb 2026 22:33:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 042D040AE9;
	Tue, 24 Feb 2026 22:33:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 54201178FA2; Tue, 24 Feb 2026 17:33:25 -0500 (EST)
Date: Tue, 24 Feb 2026 17:33:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] arago.conf: Remove duplicate
 include for yocto-space-optimize.inc
Message-ID: <20260224223325.GR11121@denix.org>
References: <20260224223148.1564416-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224223148.1564416-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Feb 2026 22:33:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17138

On Tue, Feb 24, 2026 at 04:31:47PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> As of [1], yocto-space-optimize.inc is now included by default.  So we
> can drop our duplicate require and fix a warning message:
> 
> WARNING: Duplicate inclusion for <snip>/oe-core/meta/conf/distro/include/yocto-space-optimize.inc in <snip>/oe-core/meta/conf/distro/defaultsetup.conf
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=175fcf9fad699dd122680d3f6961af9bf8487046

Yeah, I had a revert pending for this, blocked by iperf breakage - ACK.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 4ec091e4..17c6fed8 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -6,8 +6,6 @@ BUILD_VARIANT = "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
>  TISDK_VERSION ?= "live"
>  FEEDURIPREFIX ?= "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
>  
> -require conf/distro/include/yocto-space-optimize.inc
> -
>  OPKG_ARGS:remove = "--prefer-arch-to-version"
>  
>  TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
> -- 
> 2.43.0

