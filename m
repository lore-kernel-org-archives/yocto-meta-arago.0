Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2039CC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 22:22:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1901.1647987724564888998
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 15:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ED04940C3E;
	Tue, 22 Mar 2022 22:22:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-I6G1_1NVUs; Tue, 22 Mar 2022 22:22:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A0FF040B13;
	Tue, 22 Mar 2022 22:21:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 66B78174837; Tue, 22 Mar 2022 18:21:54 -0400 (EDT)
Date: Tue, 22 Mar 2022 18:21:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: reatmon@ti.com, d-gerlach@ti.com, j-humphreys@ti.com, khilman@ti.com,
	meta-arago@lists.yoctoproject.org, minas@ti.com, nikhil.nd@ti.com,
	praneeth@ti.com, spatton@ti.com
Subject: Re: [master/dunfell PATCH V5 10/12] recipes-bsp: Create a
 bootstrap-initrd package
Message-ID: <20220322222154.GU23554@denix.org>
References: <20220322174808.16341-1-nm@ti.com>
 <20220322174808.16341-11-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322174808.16341-11-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 22:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13720

On Tue, Mar 22, 2022 at 12:48:06PM -0500, Nishanth Menon wrote:
> Lets create an bootstrap-initrd package that installs the cpio
> generated in the correct locations.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes since V4: None
> 
> V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-11-nm@ti.com/
> 
>  .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
> 
> diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
> new file mode 100644
> index 000000000000..2a53efcd9062
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Prebuilt initramfs with apps for bootstraping new board"
> +
> +LICENSE = "GPLv2"

I was wondering about the same question I raised in another thread about the 
license[1]:

Default license for OpenEmbedded metadata is MIT, not GPLv2. Any specific 
reason for the change?

[1] https://patchwork.yoctoproject.org/project/ti/patch/20220322162528.15298-7-reatmon@ti.com/


> +CLEANBROKEN = "1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}"
> +
> +BOOSTRAP_IMAGE="tisdk-bootstrap-base-image"
> +
> +TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
> +
> +do_install() {
> +	install -d ${D}/boot
> +	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.cpio  ${D}/boot/${TARGET}
> +}
> +
> +FILES_${PN} = "/boot"
> +
> +do_install[depends] = "${BOOSTRAP_IMAGE}:do_image_complete"
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

