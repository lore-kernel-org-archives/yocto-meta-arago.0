Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 171D252B78
	for <meta-arago@arago-project.org>;
	Thu,  7 Oct 2021 18:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9914340CA8;
	Thu,  7 Oct 2021 18:07:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id e4EsTEpmGwgm; Thu,  7 Oct 2021 18:07:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 76CFC40CA7;
	Thu,  7 Oct 2021 18:07:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9098617467F; Thu,  7 Oct 2021 14:07:22 -0400 (EDT)
Date: Thu, 7 Oct 2021 14:07:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Message-ID: <20211007180722.GR1528@denix.org>
References: <20211007140939.19819-1-sinthu.raja@ti.com>
	<20211007140939.19819-3-sinthu.raja@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211007140939.19819-3-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [dunfell/master][PATCH 2/2] linux-firmware: Package intel 9260 WiFi and BT firmware
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Oct 2021 18:06:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 07, 2021 at 07:39:39PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
> repository.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>  .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> index 146596ad..2e2ab1c4 100644
> --- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> @@ -1,4 +1,16 @@
> -PR_append = ".arago0"
> +PR_append = ".arago1"
> +
> +PACKAGES_prepend_j7-evm =+ "${PN}-iwlwifi-9260"
> +PACKAGES_prepend_j7-evm =+ "${PN}-ibt-18"

Two issues here:

1. use either _prepend or =+ but not both
2. making machine-specific changes to only PACKAGES isn't right for several 
reasons - should probably be a generic change


> +LICENSE_${PN}-iwlwifi-9260 =+ "Firmware-iwlwifi_firmware"
> +LICENSE_${PN}-ibt-18 =+ "Firmware-ibt_firmware"
> +
> +FILES_${PN}-iwlwifi-9260 =+ "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
> +FILES_${PN}-ibt-18 =+ "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
> +
> +RDEPENDS_${PN}-iwlwifi-9260 =+ "${PN}-iwlwifi-license"
> +RDEPENDS_${PN}-ibt-18 =+ "${PN}-ibt-license"
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

