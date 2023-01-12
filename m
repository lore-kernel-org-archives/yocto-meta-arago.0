Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB3EC54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 16:22:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.59653.1673540528736099141
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 08:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 16DDC40C2B;
	Thu, 12 Jan 2023 16:22:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFARh0Swa3Se; Thu, 12 Jan 2023 16:22:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9EBD40429;
	Thu, 12 Jan 2023 16:22:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7CD731636F6; Thu, 12 Jan 2023 11:21:44 -0500 (EST)
Date: Thu, 12 Jan 2023 11:21:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] ti-tisdk-makefile: k3:
 u-boot-spl: Remove UBOOT_SYSFW
Message-ID: <20230112162144.GY22689@denix.org>
References: <20230109160247.26719-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109160247.26719-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Jan 2023 16:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14168

On Mon, Jan 09, 2023 at 09:32:47PM +0530, Chirag Shilwant wrote:
> Remove UBOOT_SYSFW as sysfw is no longer used in building u-boot-r5.

What about AM65x and J721e?


> Ref - dce21d6d3bd5b9014994a45c22b9ee8d13faa07b
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl   | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
> index f0bd16df..45ebce40 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
> @@ -9,7 +9,6 @@ UBOOT_R5_BUILD_DIR=$(TI_SDK_PATH)/board-support/u-boot_build/r5
>  
>  UBOOT_ATF=$(TI_SDK_PATH)/board-support/prebuilt-images/bl31.bin
>  UBOOT_TEE=$(TI_SDK_PATH)/board-support/prebuilt-images/bl32.bin
> -UBOOT_SYSFW=$(TI_SDK_PATH)/board-support/prebuilt-images/sysfw.bin
>  UBOOT_DMFW=$(TI_SDK_PATH)/board-support/prebuilt-images/ipc_echo_testb_mcu1_0_release_strip.xer5f
>  
>  u-boot: u-boot-a53 u-boot-r5
> -- 
> 2.17.1

