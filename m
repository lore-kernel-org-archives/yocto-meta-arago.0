Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94171C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 17:21:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.82457.1747156861794699903
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 May 2025 10:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ECCF040C8A;
	Tue, 13 May 2025 17:21:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Htks40a1m-D3; Tue, 13 May 2025 17:21:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B509F40A30;
	Tue, 13 May 2025 17:20:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7055B167F96; Tue, 13 May 2025 13:20:57 -0400 (EDT)
Date: Tue, 13 May 2025 13:20:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add
 optee-test, strongswan, and libgpiod-tools to image
Message-ID: <20250513172057.GR18383@denix.org>
References: <20250501144357.355212-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501144357.355212-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 May 2025 17:21:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16197

On Thu, May 01, 2025 at 09:43:57AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> These packages are used by ltp-ddt and the test framework. These are
> added to the default Arago images, but when doing upstream testing with
> Poky these packages are missing. Add these to the base testing layer.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-arago-test/recipes-core/packagegroups/ti-test.bb        | 2 ++
>  meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index c8eaf266..e387b978 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -41,6 +41,7 @@ TI_TEST_BASE = "\
>      nbench-byte \
>      netperf \
>      openntpd \
> +    optee-test \

Should this be conditional on whether OPTEE is used for the platform?
Like it is done here:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb#n58


>      pcitest \
>      perf \
>      powertop \
> @@ -53,6 +54,7 @@ TI_TEST_BASE = "\
>      stream \
>      stress \
>      stress-ng \
> +    strongswan \
>      tcpdump \
>      v4l-utils \
>      yavta \
> diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> index 1950ffe9..2c65e851 100644
> --- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> +++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> @@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
>      pm-qa \
>      serialcheck \
>      memtester \
> +    libgpiod-tools \
>  "
>  
>  do_install:prepend() {
> -- 
> 2.39.2

