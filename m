Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BFDC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 21:55:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3043.1747778097491786172
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 May 2025 14:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C86740C81;
	Tue, 20 May 2025 21:54:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhZ-udp4V3-e; Tue, 20 May 2025 21:54:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 55DBA40C16;
	Tue, 20 May 2025 21:54:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0F71B1689B6; Tue, 20 May 2025 17:54:53 -0400 (EDT)
Date: Tue, 20 May 2025 17:54:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 4/9] chromium-ozone-wayland: Wrap
 the bbappend in a compliant manner
Message-ID: <20250520215453.GC18383@denix.org>
References: <20250519170055.22364-1-reatmon@ti.com>
 <20250519170055.22364-5-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519170055.22364-5-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 May 2025 21:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16233

FWIW, is this still applicable? Upstream master has upgraded to 132 back in 
February, 3 months ago, and to 131 back in December... This bbappend hasn't 
been up to date for quite some time.


On Mon, May 19, 2025 at 12:00:50PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Wrap the bbappend in a yocto-check-layer compliant manner so that only
> if you are building this recipe under meta-arago-distro with the arago
> DISTRO_OVERRIDE would the bbappend apply.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...6723.91.bbappend => chromium-ozone-wayland-arago.inc} | 2 +-
>  .../chromium-ozone-wayland_130.0.6723.91.bbappend        | 9 +++------
>  2 files changed, 4 insertions(+), 7 deletions(-)
>  copy meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/{chromium-ozone-wayland_130.0.6723.91.bbappend => chromium-ozone-wayland-arago.inc} (66%)
> 
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> similarity index 66%
> copy from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
> copy to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> index 66cdd00a..3573c112 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
> @@ -1,6 +1,6 @@
>  PR:append = ".arago0"
>  
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland-130.0.6723.91:"
>  
>  SRC_URI:append = " \
>                    file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
> diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
> index 66cdd00a..62ae18bf 100644
> --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
> +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland_130.0.6723.91.bbappend
> @@ -1,7 +1,4 @@
> -PR:append = ".arago0"
> +CHROMIUM_ARAGO = ""
> +CHROMIUM_ARAGO:arago = "chromium-ozone-wayland-arago.inc"
>  
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
> -
> -SRC_URI:append = " \
> -                  file://0001-chromium-gpu-sandbox-allow-access-to-PowerVR-GPU-fro.patch \
> -                  "
> +require ${CHROMIUM_ARAGO}
> -- 
> 2.17.1

