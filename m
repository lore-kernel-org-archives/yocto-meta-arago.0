Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8695.1647021977580282540
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 10:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9266D40C46;
	Fri, 11 Mar 2022 18:06:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOwB-hdJzxul; Fri, 11 Mar 2022 18:06:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49D5A40A03;
	Fri, 11 Mar 2022 18:06:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 09EDE16E6AD; Fri, 11 Mar 2022 13:06:07 -0500 (EST)
Date: Fri, 11 Mar 2022 13:06:06 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
	"Humphreys, Jonathan" <j-humphreys@ti.com>, praneeth@ti.com,
	minas@ti.com, "Hilman, Kevin" <khilman@ti.com>,
	"Patton, Schuyler" <spatton@ti.com>,
	"Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [dunfell/master PATCH 5/6] recipes-bsp: Create a k3-bootstrap-initrd package
Message-ID: <20220311180606.GE1766@denix.org>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-6-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220309021316.28370-6-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2022 at 08:13:15PM -0600, Nishanth Menon via lists.yoctoproject.org wrote:
> Lets create an k3-bootstrap-initrd package that installs the cpio
> generated in the correct locations.

This has k3 in the name - is it really k3-specific? Do you want to set 
COMPATIBLE_MACHINE accordingly?


> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  .../k3-bootstrap-initrd_1.0.bb                | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb
> 
> diff --git a/meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb
> new file mode 100644
> index 000000000000..452f88a35346
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Prebuilt initramfs with apps for bootstraping new board"
> +
> +LICENSE = "GPLv2"
> +
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

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
