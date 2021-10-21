Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3782.1634849043534122791
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 13:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5D2140BEB;
	Thu, 21 Oct 2021 20:44:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLzN3tKH6Os9; Thu, 21 Oct 2021 20:44:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89D5C40BA8;
	Thu, 21 Oct 2021 20:43:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4D3281746A0; Thu, 21 Oct 2021 16:43:58 -0400 (EDT)
Date: Thu, 21 Oct 2021 16:43:58 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: sinthu.raja@mistralsolutions.com
Cc: meta-arago@lists.yoctoproject.org, Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-arago][dunfell/master][PATCH V4 1/2] linux-firmware: Package intel 9260 WiFi and BT firmware
Message-ID: <20211021204358.GC10132@denix.org>
References: <20211021131559.16817-1-sinthu.raja@ti.com>
 <20211021131559.16817-2-sinthu.raja@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211021131559.16817-2-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 21, 2021 at 06:45:58PM +0530, Sinthu Raja via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
> repository, so package it to make it available.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

> ---
> 
> Changes in V4:
> Addressed review comments that include making changes that are consistent with 
> respect to the original recipe.

Thank you for addressing all the comments!


> V3: http://arago-project.org/pipermail/meta-arago/2021-October/013343.html
> V2: https://www.mail-archive.com/meta-arago@arago-project.org/msg12121.html
> V1: https://www.mail-archive.com/meta-arago@arago-project.org/msg12117.html
> 
>  .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> index 146596ad..3472f267 100644
> --- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> @@ -1,4 +1,16 @@
> -PR_append = ".arago0"
> +PR_append = ".arago1"
> +
> +PACKAGES =+ "${PN}-iwlwifi-9260"
> +PACKAGES =+ "${PN}-ibt-18"
> +
> +LICENSE_${PN}-iwlwifi-9260 = "Firmware-iwlwifi_firmware"
> +LICENSE_${PN}-ibt-18 = "Firmware-ibt_firmware"
> +
> +FILES_${PN}-iwlwifi-9260 = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
> +FILES_${PN}-ibt-18 = "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
> +
> +RDEPENDS_${PN}-iwlwifi-9260 += "${PN}-iwlwifi-license"
> +RDEPENDS_${PN}-ibt-18 += "${PN}-ibt-license"
>  
>  do_install_append() {
>  	rm -rf  ${D}/lib/firmware/ti-connectivity/
> -- 
> 2.31.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
