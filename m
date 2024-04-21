Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D13C4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 03:07:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25624.1713668863596234006
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 20:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9F76E40C56;
	Sun, 21 Apr 2024 03:07:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTD43_MxEbw9; Sun, 21 Apr 2024 03:07:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD62540C2B;
	Sun, 21 Apr 2024 03:07:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E23AC163F33; Sat, 20 Apr 2024 23:07:36 -0400 (EDT)
Date: Sat, 20 Apr 2024 23:07:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
Message-ID: <20240421030736.GZ28791@denix.org>
References: <20240420125318.397900-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420125318.397900-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 21 Apr 2024 03:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15299

On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> - Ideally running `ls /boot/` in filesystem should list contents from /rootfs/boot partition
> but currently it lists the contents of /boot partition of the WIC Image.
> 
> Eg - Incase of AM64x,
> ```
>     root@am64xx-evm:~# ls /boot/
>     EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-evm.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.img  uEnv.txt

Will this change affect EFI? As there's EFI directory in that partition.


> 
> ```
> 
> - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA_ARG in arago-image.inc
> to prevent WIC image from adding an additional entry in /etc/fstab.

This flag is global and will prevent all other partitions from populating 
/etc/fstab properly. Sure, meta-ti only has /boot and / defined, but other 
layers could have own wic files with e.g. /home or /data partitions. Mounting 
those will require a custom /etc/fstab instead of wic creating corresponding 
entries automatically.


> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-image.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index 00308b57..2a34a709 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -31,4 +31,6 @@ BAD_RECOMMENDATIONS += " \
>  "
>  BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
>  
> +WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
> +
>  inherit core-image remove-net-rules
> -- 
> 2.34.1

