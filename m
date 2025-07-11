Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6626C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:32:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16860.1752247941722404795
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 08:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B37840CC0;
	Fri, 11 Jul 2025 15:32:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QddXdBG423hN; Fri, 11 Jul 2025 15:32:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E40E040C81;
	Fri, 11 Jul 2025 15:32:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9F46516BB38; Fri, 11 Jul 2025 11:32:17 -0400 (EDT)
Date: Fri, 11 Jul 2025 11:32:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: rs@ti.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/scarthgap][1/2] meta-arago-test:
 recipes-graphics: Add lightweight off-screen demo
Message-ID: <20250711153217.GD24899@denix.org>
References: <20250711142611.3567574-1-a-christidis@ti.com>
 <20250711142611.3567574-2-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711142611.3567574-2-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Jul 2025 15:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16288

On Fri, Jul 11, 2025 at 09:26:10AM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Add recipe for lightweight off-screen rendering demo.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../offscreen-demo/offscreendemo_0.0.1.bb        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
> new file mode 100644
> index 00000000..f0b6a1fd
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Lightweight Render Example"
> +DESCRIPTION = "Lightweight Render Example. Heavily inspired by Eduardo Lima's gpu-playground, this attempts to act as the smallest demo of offscreen rendering."
> +
> +HOMEPAGE = "https://github.com/StaticRocket/lightweight-offscreen"
> +
> +SRC_URI = "git://github.com/StaticRocket/lightweight-offscreen.git;protocol=https;branch=master"
> +SRCREV = "eac40e0073cb5f81688aee890e0a67f99678a290"
> +
> +LICENSE = "CC0-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
> +
> +S = "${WORKDIR}/git"

This ^^^ is no longer correct for master


> +DEPENDS += "virtual/egl virtual/libgles2 mesa-pvr"
> +
> +inherit pkgconfig meson
> -- 
> 2.34.1

