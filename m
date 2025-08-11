Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501F3CA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 18:37:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.55469.1754937426812838309
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 11:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C38C40CBB;
	Mon, 11 Aug 2025 18:37:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhYtmjv8o8k4; Mon, 11 Aug 2025 18:37:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DAA6A400CF;
	Mon, 11 Aug 2025 18:37:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DBEBF170229; Mon, 11 Aug 2025 14:37:01 -0400 (EDT)
Date: Mon, 11 Aug 2025 14:37:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] arago: Pull in the Yocto space
 optimization settings
Message-ID: <20250811183701.GX24899@denix.org>
References: <20250811173948.19890-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811173948.19890-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Aug 2025 18:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16359

On Mon, Aug 11, 2025 at 12:39:48PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Turns out there is a .inc file in oe-core that sets some variables to
> reduce the amount of space that a build takes up based on common
> criteria.  Poky explicitly includes this file, but it is not included by
> default.  So we need to include it as well.

Just a note:

It is a bit of a confusing name - it doesn't optimize all target binaries for 
space (vs. speed). What this .inc file does - it completely disables debugging 
output (which would otherwise be stripped into -dbg packages) during the 
build for a handful of components, such as all versions of clang (used to be 
llvm) and qemu. Those do generate a lot of debug data. The point is to save 
storage space and a bit of build time on autobuilder, assuming that nobody 
will be trying to debug those tools.


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 8e45ca53..1ad4b4ce 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -6,6 +6,8 @@ BUILD_VARIANT = "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
>  TISDK_VERSION ?= "live"
>  FEEDURIPREFIX ?= "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
>  
> +require conf/distro/include/yocto-space-optimize.inc
> +
>  OPKG_ARGS:remove = "--prefer-arch-to-version"
>  
>  TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
> -- 
> 2.17.1

