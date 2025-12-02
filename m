Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8789ED116F5
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:59:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3703.1764709160886166960
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 12:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDD0D40C83;
	Tue,  2 Dec 2025 20:59:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_2X6Gmsbfko; Tue,  2 Dec 2025 20:59:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB7C040A22;
	Tue,  2 Dec 2025 20:59:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D08DD175F1B; Tue,  2 Dec 2025 15:59:14 -0500 (EST)
Date: Tue, 2 Dec 2025 15:59:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: anshuld@ti.com
Cc: meta-arago@lists.yoctoproject.org, vigneshr@ti.com, denys@konsulko.com,
	reatmon@ti.com
Subject: Re: [meta-arago][scarthgap][PATCH RFC 0/4] Add support for SWUpdate
Message-ID: <20251202205914.GE11121@denix.org>
References: <20251202111603.1616989-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202111603.1616989-1-anshuld@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Dec 2025 20:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16854

On Tue, Dec 02, 2025 at 04:45:57PM +0530, Anshul Dalal via lists.yoctoproject.org wrote:
> Hi all,
> 
> This RFC adds support for SWUpdate[1] to meta-arago, this provides us with OTA
> updates with A/B redundancy for the rootfs.
> 
> For now the support is enabled for eMMC boot only based on the 'ti-swupdate'
> override. The below steps can be used to test this RFC on an AM62x EVM:
> 
>  1. Add 'meta-swupdate' layer[2] to the SDK sources directory.
> 
>  2. Since the bootloader side changes have not been merged to ti-u-boot yet,
>     make use of the 'swupdate' branch from my own U-Boot fork[3].
> 
>  3. Enable 'swupdate' support by setting the 'ti-swupdate' override in
>     local.conf as follows:
> 
>       DISTROOVERRIDES:append = ":ti-swupdate"
> 
>  4. Flash the U-Boot binaries to the correct offsets on boot0 partition as
>     per the docs[4] and run 'env save' on first boot to save the environment to
>     eMMC's hw partition.

Why not use a more established A/B solution, such as RAUC (or even Mender)?


> Regards,
> Anshul
> 
> [1]: https://swupdate.org/
> [2]: https://github.com/sbabic/meta-swupdate
> [3]: https://github.com/ArchUsr64/u-boot/tree/swupdate
> [4]: https://software-dl.ti.com/processor-sdk-linux-rt/esd/AM62X/latest/exports/docs/linux/How_to_Guides/Target/How_to_emmc_boot.html#how-to-emmc-boot
> 
> Anshul Dalal (4):
>   swupdate: add systemd service to rootfs
>   swupdate: add creation of update image
>   swupdate: add bootloader support
>   swupdate: enable authentication for update image
> 
>  meta-arago-distro/conf/distro/arago.conf      |  3 ++
>  .../images/files/sw-description               | 46 +++++++++++++++++++
>  .../recipes-swupdate/images/update-image.bb   | 27 +++++++++++
>  .../libubootenv/files/fw_env.config           |  5 ++
>  .../libubootenv/libubootenv_%.bbappend        | 10 ++++
>  .../recipes-swupdate/swupdate/files/defconfig | 12 +++++
>  .../swupdate/files/swupdate.cfg               | 13 ++++++
>  .../swupdate/files/swupdate.sh                | 15 ++++++
>  .../swupdate/swupdate_%.bbappend              | 35 ++++++++++++++
>  .../wic/sdimage-2part-swupdate.wks            |  6 +++
>  10 files changed, 172 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-swupdate/images/files/sw-description
>  create mode 100644 meta-arago-distro/recipes-swupdate/images/update-image.bb
>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.cfg
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
>  create mode 100644 meta-arago-distro/wic/sdimage-2part-swupdate.wks
> 
> -- 
> 2.52.0

