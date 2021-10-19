Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.13376.1634665029840890906
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 10:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C228440C2B;
	Tue, 19 Oct 2021 17:37:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2a91SQ7IXL5Q; Tue, 19 Oct 2021 17:37:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B401406B5;
	Tue, 19 Oct 2021 17:37:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 648F2174698; Tue, 19 Oct 2021 13:37:04 -0400 (EDT)
Date: Tue, 19 Oct 2021 13:37:04 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc: meta-arago@lists.yoctoproject.org, Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [meta-arago][dunfell/master][PATCH V3 1/2] linux-firmware: Package intel 9260 WiFi and BT firmware
Message-ID: <20211019173704.GP10132@denix.org>
References: <20211011095204.7626-1-sinthu.raja@ti.com>
 <20211011095204.7626-2-sinthu.raja@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211011095204.7626-2-sinthu.raja@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2021 at 03:22:03PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The Intel 9260 WiFi and BT firmware is already part of the linux-firmware
> repository, so package it to make it available.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes in V3:
> Replaced PREPEND tag with '=+' to include the firmwares into the package,
> because the PREPEND tag throws error during parsing the recipes.

As mentioned in the other email, the difference between =+ and _prepend is 
that the first one adds a whitespace, but not the second one, so you end up 
concatenating two items in the list if you don't add whitespace yourself.


> V2: https://www.mail-archive.com/meta-arago@arago-project.org/msg12121.html
> V1: https://www.mail-archive.com/meta-arago@arago-project.org/msg12117.html
> 
>  .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> index 146596ad..752181ac 100644
> --- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend

For reference, you are extending this original linux-firmware recipe:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb

For consistency with the original recipe, consider these minor fixes:


> @@ -1,4 +1,16 @@
> -PR_append = ".arago0"
> +PR_append = ".arago1"
> +
> +PACKAGES =+ "${PN}-iwlwifi-9260"
> +PACKAGES =+ "${PN}-ibt-18"

As =+ does prepend with whitespace, and += does append with whitespace, using 
=+ here is correct:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb#n224


> +LICENSE_${PN}-iwlwifi-9260 =+ "Firmware-iwlwifi_firmware"
> +LICENSE_${PN}-ibt-18 =+ "Firmware-ibt_firmware"

You don't want to =+ or += (prepend or append) here to the common list of all 
the licenses, but set a specific license only for your package:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb#n317


> +FILES_${PN}-iwlwifi-9260 =+ "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
> +FILES_${PN}-ibt-18 =+ "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"

Same comment here, but less critical, as FILES var would be empty initially.


> +RDEPENDS_${PN}-iwlwifi-9260 =+ "${PN}-iwlwifi-license"
> +RDEPENDS_${PN}-ibt-18 =+ "${PN}-ibt-license"

You'd usually append (+=) to RDEPENDS, but it's mostly for consistency and not 
that critical:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-firmware_20210818.bb#n339


>  do_install_append() {
>  	rm -rf  ${D}/lib/firmware/ti-connectivity/
> -- 
> 2.31.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
