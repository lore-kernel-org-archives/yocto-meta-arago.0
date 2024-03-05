Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE06C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 20:50:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4082.1709671799141987027
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 12:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6651E40C2B;
	Tue,  5 Mar 2024 20:49:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuJGE3_nHRZ7; Tue,  5 Mar 2024 20:49:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C338A40C16;
	Tue,  5 Mar 2024 20:49:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 15483163EC0; Tue,  5 Mar 2024 15:49:54 -0500 (EST)
Date: Tue, 5 Mar 2024 15:49:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] base-files: Remove fstab override
Message-ID: <20240305204954.GI6072@denix.org>
References: <20240305191145.67894-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305191145.67894-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 20:50:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15224

On Tue, Mar 05, 2024 at 01:11:45PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> There is already a version of this file provided by oe-core that
> is kept up to date. Do not override it.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-core/base-files/base-files/fstab        | 13 -------------
>  .../recipes-core/base-files/base-files_%.bbappend   |  2 +-
>  2 files changed, 1 insertion(+), 14 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/base-files/base-files/fstab
> 
> diff --git a/meta-arago-distro/recipes-core/base-files/base-files/fstab b/meta-arago-distro/recipes-core/base-files/base-files/fstab
> deleted file mode 100644
> index 8ddadd98..00000000
> --- a/meta-arago-distro/recipes-core/base-files/base-files/fstab
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# stock fstab - you probably want to override this with a machine specific one
> -
> -/dev/root            /                    auto       defaults              1  1
> -proc                 /proc                proc       defaults              0  0
> -devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
> -usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
> -tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0

> -tmpfs                /var/volatile        tmpfs      defaults,size=50M     0  0
> -tmpfs                /media/ram           tmpfs      defaults,size=16M     0  0

The major difference is these 2 tmpfs entries - upstream doesn't have 
/media/ram, as that was something TI testing framework was using. Plus 
upstream doesn't set the size parameter - by default up to 50% of RAM can 
get used by tmpfs and there were issues with some low-RAM legacy platforms 
in the past.

If neither of these differences matter any longer, this can be removed.


> -# uncomment this if your device has a SD/MMC/Transflash slot
> -#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
> -
> diff --git a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
> index e5c53e80..7d1f6751 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
> +++ b/meta-arago-distro/recipes-core/base-files/base-files_%.bbappend
> @@ -1,4 +1,4 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>  
> -PR:append = ".arago4"
> +PR:append = ".arago5"
> -- 
> 2.39.2

