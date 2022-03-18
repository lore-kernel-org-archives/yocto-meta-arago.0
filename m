Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC08C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 20:49:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.143.1647636552329165563
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 13:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F7FC40C53;
	Fri, 18 Mar 2022 20:49:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hawy80olJtv; Fri, 18 Mar 2022 20:49:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E92BD40C1E;
	Fri, 18 Mar 2022 20:49:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AB7FC1747D4; Fri, 18 Mar 2022 16:49:01 -0400 (EDT)
Date: Fri, 18 Mar 2022 16:49:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>,
	praneeth <praneeth@ti.com>, minas <minas@ti.com>,
	"Hilman, Kevin" <khilman@ti.com>,
	"Patton, Schuyler" <spatton@ti.com>,
	"Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [dunfell/master PATCH V3 11/12] recipes-core: images:
 Introduce tisdk-bootstrap-image
Message-ID: <20220318204901.GF23554@denix.org>
References: <20220318184045.11246-1-nm@ti.com>
 <20220318184045.11246-12-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318184045.11246-12-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 20:49:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13676

On Fri, Mar 18, 2022 at 01:40:44PM -0500, Nishanth Menon wrote:
> Lets introduce tisdk-bootstrap-image which now consists of a
> completely bootable system with minimal initramfs that can be used
> to boot up a system. We also will create a rootfs that matches with
> the initramfs to allow users who use mmc and other boot media to have
> access to the same debug tools for a new platform bringup
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> no changes since V2
> V2: https://lore.kernel.org/all/20220318143735.17642-11-nm@ti.com/
> 
>  .../images/tisdk-bootstrap-image.bb           | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> new file mode 100644
> index 000000000000..685916ca3f6a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Arago TI SDK bootstrap image usable for board bringup"
> +
> +DESCRIPTION = "This image is a complete package containing a rootfs\
> + and an initrd with platform test utilities that can be used for new\
> + platform bringup activities. Typically one would use the bootstrap\
> + initrd till the storage media access is debugged, following which one\
> + would switch over to using the storage media of choice with the same\
> + content.\
> +"
> +
> +require arago-tiny-image.inc
> +
> +ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
> +
> +IMAGE_INSTALL += " \
> +	packagegroup-arago-bootstrap \
> +	kernel \

??

> +	bootstrap-initrd \
> +	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
> +"
> +
> +export IMAGE_BASENAME = "tisdk-bootstrap-image"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

