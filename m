Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE103CDB486
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:03:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.227067.1697565825193474520
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 11:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6691140CEE;
	Tue, 17 Oct 2023 18:03:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0T5htXoMpRL; Tue, 17 Oct 2023 18:03:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CFC24406B5;
	Tue, 17 Oct 2023 18:03:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3929E163CF8; Tue, 17 Oct 2023 14:03:40 -0400 (EDT)
Date: Tue, 17 Oct 2023 14:03:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] softap-udhcpd-config:
 Remove this package
Message-ID: <20231017180340.GL2408@denix.org>
References: <20231016211708.23682-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016211708.23682-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 18:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14943

On Mon, Oct 16, 2023 at 04:17:08PM -0500, Andrew Davis via lists.yoctoproject.org wrote:

BTW, what happened to the "why?" :)


> Signed-off-by: Andrew Davis <afd@ti.com>

This was part of AM/Sitara SDK OOBE to have WiFi AP configured out of the box 
on supported platforms.

If it's still relevant, may need to be pushed to the corresponding SDK layer.


> ---
>  .../busybox/softap-udhcpd-config/LICENSE      | 348 ------------------
>  .../softap-udhcpd-config/omap3/udhcpd.conf    | 114 ------
>  .../softap-udhcpd-config/omapl138/udhcpd.conf | 114 ------
>  .../softap-udhcpd-config/ti33x/udhcpd.conf    | 114 ------
>  .../busybox/softap-udhcpd-config/udhcpd.conf  | 113 ------
>  .../busybox/softap-udhcpd-config_1.0.bb       |  23 --
>  .../packagegroup-arago-tisdk-connectivity.bb  |   1 -
>  7 files changed, 827 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/LICENSE
>  delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/omap3/udhcpd.conf
>  delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/omapl138/udhcpd.conf
>  delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/ti33x/udhcpd.conf
>  delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config/udhcpd.conf
>  delete mode 100644 meta-arago-distro/recipes-core/busybox/softap-udhcpd-config_1.0.bb

