Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF82BC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 21:34:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11125.1647034482214694884
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 13:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D3B8E40C46;
	Fri, 11 Mar 2022 21:34:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhg9z8Nf5IsL; Fri, 11 Mar 2022 21:34:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 85DDE40027;
	Fri, 11 Mar 2022 21:34:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B38EA16E6AD; Fri, 11 Mar 2022 16:34:30 -0500 (EST)
Date: Fri, 11 Mar 2022 16:34:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: nm@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>, praneeth@ti.com,
	minas@ti.com, "Hilman, Kevin" <khilman@ti.com>,
	"Patton, Schuyler" <spatton@ti.com>,
	"Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [dunfell/master PATCH 6/6] recipes-core: images:
 Introduce tisdk-bootstrap-image
Message-ID: <20220311213430.GG1766@denix.org>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-7-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309021316.28370-7-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Mar 2022 21:34:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13625

On Tue, Mar 08, 2022 at 08:13:16PM -0600, Nishanth Menon via lists.yoctoproject.org wrote:
> Lets introduce tisdk-bootstrap-image which now consists of a
> completely bootable system with bootstrap initramfs that can be used
> to boot up and minimally debug a system. We also will create a rootfs
> that matches with the initramfs to allow users who use mmc and other
> similar boot media to have access to the same debug tools for a new
> platform bringup.
> 
> This kind of image is usually suited to be used with a minimal
> bootloader and kernel devicetree configuration.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  .../images/tisdk-bootstrap-image.bb             | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> new file mode 100644
> index 000000000000..85584f0cf257
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
> @@ -0,0 +1,17 @@
> +# Arago TI SDK bootstrap image usable for board bringup
> +# This consists of an usable initramfs containing board bringup utilities
> +# that can then be used. In addition the root filesystem also has the same
> +# set of utilities for debug and basic performance checks.
> +
> +require arago-tiny-image.inc
> +
> +ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
> +
> +IMAGE_INSTALL += " \
> +	packagegroup-arago-bootstrap \
> +	kernel \

This should probably be kernel-base. There's no package called just kernel, 
but rather kernel-<version> which is kernel-base in disguise :)


> +	k3-bootstrap-initrd \
> +	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
> +"
> +
> +export IMAGE_BASENAME = "tisdk-bootstrap-image"
> -- 
> 2.31.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

