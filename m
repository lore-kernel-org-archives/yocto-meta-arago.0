Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAEAC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 22:31:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3693.1658356264499653515
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 15:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6075740CF0;
	Wed, 20 Jul 2022 22:31:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54unNbCCjNMF; Wed, 20 Jul 2022 22:31:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3DB0440CE0;
	Wed, 20 Jul 2022 22:31:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 478691749AF; Wed, 20 Jul 2022 18:31:00 -0400 (EDT)
Date: Wed, 20 Jul 2022 18:31:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell][PATCH] all: Remove reference to
 arago-project.org
Message-ID: <20220720223100.GJ18692@denix.org>
References: <20220720203212.20717-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720203212.20717-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Jul 2022 22:31:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13956

On Wed, Jul 20, 2022 at 03:32:12PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> arago-project.org is being shut down in August.  This
> commit changes the last recipes that point to that
> old site to point to git.ti.com, or just rmeove the
> reference entirely.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/README                        |   2 +-
>  meta-arago-distro/classes/tisdk-bundle.bbclass  |   2 +-
>  meta-arago-distro/conf/distro/arago.conf        |   2 --
>  .../k2-fw-initrd/k2-fw-initrd_0.0.7.bb          |   4 +++-
>  .../k2-initramfs-0.0.7.tar.gz                   | Bin 0 -> 49660 bytes
>  .../recipes-core/base-files/base-files/issue    |   2 +-
>  .../base-files/base-files/issue.net             |   2 +-
>  .../feed-config/arago-feed-config_1.0.bb        |   2 +-
>  .../oe-layersetup/oe-layersetup.bb              |   2 +-
>  .../ti-crypto-examples_git.bb                   |   4 ++--
>  .../ltp-ddt/ltp-ddt_20210524.bb                 |   2 +-
>  .../recipes-support/ipsecmgr/ipsecmgr.inc       |   2 +-
>  .../libnl-xfrm/libnl-xfrm_git.bb                |   2 +-
>  13 files changed, 14 insertions(+), 14 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7/k2-initramfs-0.0.7.tar.gz
> 
> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
> index eba955f4..a40e142e 100644
> --- a/meta-arago-distro/README
> +++ b/meta-arago-distro/README
> @@ -26,7 +26,7 @@ URI: https://github.com/meta-qt5/meta-qt5
>  branch: dunfell
>  revision: HEAD
>  
> -URI: git://arago-project.org/git/meta-arago
> +URI: git://git.yoctoproject.org/meta-arago
>  branch: dunfell
>  revision: HEAD
>  layers: meta-arago-extras
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index 9e961e1b..efdb96fc 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -641,7 +641,7 @@ EOF
>  
>          if [ "$extra_files" == "1" ]
>          then
> -            source="$source"" <br>Files from:<br><a href=git://arago-project.org/git/meta-arago.git>git://arago-project.org/git/meta-arago.git</a><br><a href=git://arago-project.org/git/meta-ti.git>git://arago-project.org/git/meta-ti.git</a>"
> +            source="$source"" <br>Files from:<br><a href=https://git.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><br><a href=https://git.yoctoproject.org/meta-ti>https://git.yoctoproject.org/meta-ti</a>"
>          fi
>  
>          case "$package" in
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 61ae3c83..5fca73ba 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -10,8 +10,6 @@ OPKG_ARGS_remove = "--prefer-arch-to-version"
>  
>  TI_MIRROR = "http://software-dl.ti.com/processor-sdk-mirror/sources/"
>  MIRRORS += " \
> -ftp://.*/.*       http://arago-project.org/files/sources/ \n \
> -https?$://.*/.*   http://arago-project.org/files/sources/ \n \
>  bzr://.*/.*      ${TI_MIRROR} \n \
>  cvs://.*/.*      ${TI_MIRROR} \n \
>  git://.*/.*      ${TI_MIRROR} \n \
> diff --git a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
> index b9eb57fe..4b4cd8d9 100644
> --- a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
> +++ b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7.bb
> @@ -9,7 +9,9 @@ COMPATIBLE_MACHINE = "keystone"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRC_URI = "http://arago-project.org/files/releases/k2-fw/k2-initramfs-${PV}.tar.gz"
> +SRC_URI = "file://k2-initramfs-0.0.7.tar.gz"
> +
> +FILESEXTRAPATHS =. "${FILE_DIRNAME}/${P}:"

This is not needed.


>  SRC_URI[md5sum] = "27fb248cbfe08ed8344bdc4451067c8f"
>  SRC_URI[sha256sum] = "beb19d685ee0d20281266726e4c2ba4b245af9450c1bd5155ff06d8c1656dd26"
> diff --git a/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7/k2-initramfs-0.0.7.tar.gz b/meta-arago-distro/recipes-bsp/k2-fw-initrd/k2-fw-initrd_0.0.7/k2-initramfs-0.0.7.tar.gz

The directory with the file should be either k2-initramfs or 
k2-initramfs-0.0.7 (dash instead of underscore)

-- 
Denys

