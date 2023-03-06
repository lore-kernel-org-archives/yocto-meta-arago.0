Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9E2C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 21:03:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1209.1678136583210709469
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 Mar 2023 13:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B0E3140C50
	for <meta-arago@lists.yoctoproject.org>; Mon,  6 Mar 2023 21:03:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piCxbdDI9-Dn for <meta-arago@lists.yoctoproject.org>;
	Mon,  6 Mar 2023 21:03:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9AB3C40C47
	for <meta-arago@lists.yoctoproject.org>; Mon,  6 Mar 2023 21:03:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1C63C1637B7; Mon,  6 Mar 2023 16:02:33 -0500 (EST)
Date: Mon, 6 Mar 2023 16:02:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [master/kirkstone][PATCH] all: unbreak
 populate_sdk task (again)
Message-ID: <20230306210233.GV22689@denix.org>
References: <17474F7B5189B28F.29542@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17474F7B5189B28F.29542@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 Mar 2023 21:03:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14251

Ping.


On Sun, Feb 26, 2023 at 07:32:51AM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Being able to run populate_sdk task against minimal and base images
> has always been supported by Arago, though needed to get fixed once
> in a while, e.g.:
> https://git.yoctoproject.org/meta-arago/commit/?id=d47710c8219e036cb7005bc0a22099e63c5e1901
> 
> This time around the issue is due to upstream packages lmbench and
> mbedtls both installing /usr/bin/hello binary and causing a conflict
> when the files collide in the sysroot.
> 
> The fix has been submitted upstream to meta-oe and meta-networking
> layers of the meta-openembedded repo:
> https://patchwork.yoctoproject.org/project/oe/list/?series=10748
> 
> For now add local bbappends with the same fix, which can be removed
> when the fix is merged upstream and backported to kirkstone.
> 
> While at it, also look into the conflict caused by matrix launcher
> packaging function being reused by multiple subpackages, resulting
> in lots of file conflicts between them. There's a lot of rework
> required for the matrix (and it might get moved to another layer
> altogether), but for now just cutoff the reverse dependency from
> development -dev packages.
> 
> With this simple change it is now possible to run populate_sdk task
> even against the default full/graphics tisdk-default-image.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../recipes-benchmark/lmbench/lmbench_%.bbappend              | 2 ++
>  .../recipes-connectivity/mbedtls/mbedtls_%.bbappend           | 4 ++++
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc     | 3 +++
>  3 files changed, 9 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>  create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
> new file mode 100644
> index 00000000..96dd2010
> --- /dev/null
> +++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
> @@ -0,0 +1,2 @@
> +ALTERNATIVE:${PN} += "hello"
> +ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
> diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> new file mode 100644
> index 00000000..f3c16796
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> @@ -0,0 +1,4 @@
> +inherit update-alternatives
> +
> +ALTERNATIVE:${PN}-programs += "hello"
> +ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
> index 2bcc908b..adb998e1 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
> @@ -38,3 +38,6 @@ do_install:append(){
>      # other appends.
>      cd -
>  }
> +
> +RDEPENDS:${PN}-dev = ""
> +RRECOMMENDS:${PN}-dev = ""
> -- 
> 2.25.1

