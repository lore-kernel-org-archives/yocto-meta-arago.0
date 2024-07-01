Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F82DC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 21:21:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9179.1719868878985698465
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jul 2024 14:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FB7C40C50;
	Mon,  1 Jul 2024 21:21:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9XJ5tX-PPXh; Mon,  1 Jul 2024 21:21:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48D5B40C16;
	Mon,  1 Jul 2024 21:21:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 65391163FD9; Mon,  1 Jul 2024 17:21:13 -0400 (EDT)
Date: Mon, 1 Jul 2024 17:21:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH] openssl-perf: Add
 openssl_aes256_encdec.sh script
Message-ID: <20240701212113.GL18231@denix.org>
References: <20240701143728.26618-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701143728.26618-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jul 2024 21:21:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15423

On Mon, Jul 01, 2024 at 09:37:28AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> This is an additional openssl script that our testing flow requires.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-benchmark/openssl-perf/openssl-perf.bb        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
> index 02f41f41..d1c51528 100644
> --- a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
> +++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
> @@ -1,5 +1,5 @@
> -SUMMARY = "Benchmark for checking various OpenSSL performance functions"
> -HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh"
> +SUMMARY = "Benchmarks for checking various OpenSSL performance functions"
> +HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/"
>  LICENSE = "CC-BY-SA-3.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  
> @@ -7,9 +7,11 @@ PV = "1.0"
>  
>  SRC_URI = " \
>      https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=openssl_perf \
> +    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=openssl_aes256_encdec \
>      https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
>  "
>  SRC_URI[openssl_perf.sha256sum] = "1ba5188beb6a1fa69d9f34df12c596ed49907c2b2d2ce2d985a305b9ecbed800"
> +SRC_URI[openssl_aes256_encdec.sha256sum] = "c63efc35f7c161e02ef6d53b428bfbfce7ea3f2d329c552dbb04f865317eb408"
>  SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
>  
>  S = "${WORKDIR}"
> @@ -17,7 +19,9 @@ S = "${WORKDIR}"
>  do_install() {
>      install -d ${D}${bindir}
>      install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
> +    install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_aes256_encdec.sh
>  }
>  
>  FILES:${PN} = "${bindir}/openssl_perf.sh"
> +FILES:${PN} = "${bindir}/openssl_aes256_encdec.sh"

Should be += here to include both files:

ERROR: openssl-perf-1.0-r0 do_package: QA Issue: openssl-perf: Files/directories were installed but not shipped in any package:
  /usr/bin/openssl_perf.sh

-- 
Denys

