Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AABC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:30:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.40870.1656693047265326729
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 09:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7381740D21;
	Fri,  1 Jul 2022 16:30:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAiCRGVrSy3Y; Fri,  1 Jul 2022 16:30:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 51BBB40D1E;
	Fri,  1 Jul 2022 16:30:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C538E174996; Fri,  1 Jul 2022 12:30:42 -0400 (EDT)
Date: Fri, 1 Jul 2022 12:30:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/dunfell][PATCH] conf: machine: j721s2: add
 new dtb for GESI
Message-ID: <20220701163042.GA18692@denix.org>
References: <20220701161237.10497-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701161237.10497-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Jul 2022 16:30:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13936

1. wrong list - should go to meta-ti
2. kernel commit says "overlay" - should this be .dtbo, not .dtb?


On Fri, Jul 01, 2022 at 11:12:37AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The following commits in ti-linux-5.10.y kernel has introduced a new dtb.
> 
> commit: 9b05b2a89ff ("arm64: dts: ti: Add overlay for GESI to enable main CPSW2G in J721S2")
> 
> This patch on j721s2 conf is to include the new dtb.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  conf/machine/j721s2-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index e5ed0b73..b224ce7b 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -13,6 +13,7 @@ OPTEE_K3_USART = "0x8"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-j721s2-common-proc-board.dtb \
> +    ti/k3-j721s2-gesi-exp-board.dtb \
>  "
>  
>  UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
> -- 
> 2.17.1

