Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89638FD45E5
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:57:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54347.1772049456528927329
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 11:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A092D40BA7;
	Wed, 25 Feb 2026 19:57:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T_IMeF5WBbG; Wed, 25 Feb 2026 19:57:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5394440A22;
	Wed, 25 Feb 2026 19:57:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A56C1179016; Wed, 25 Feb 2026 14:57:31 -0500 (EST)
Date: Wed, 25 Feb 2026 14:57:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: b-brnich@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [meta-arago][master][PATCH] ti-test: Add Required Multimedia
 Packages to ti-test
Message-ID: <20260225195731.GS11121@denix.org>
References: <20260225190339.3295692-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225190339.3295692-1-b-brnich@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 19:57:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17147

On Wed, Feb 25, 2026 at 01:03:39PM -0600, Brandon Brnich via lists.yoctoproject.org wrote:
> FFMPEG and MPV are required during automated testing. Explicitly add
> these to ti-test.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index f2ae1aef..c694545d 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -16,6 +16,7 @@ TI_TEST_BASE = "\
>      dosfstools \
>      ethtool \
>      evtest \
> +    ffmpeg \
>      fio \
>      git \
>      gst-devtools \
> @@ -36,6 +37,7 @@ TI_TEST_BASE = "\
>      lsof \
>      media-ctl \
>      memtester \
> +    mpv \
>      mstpd \
>      mtd-utils \
>      mtd-utils-ubifs \
> @@ -145,7 +147,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
>  "
>  
>  # Disable due to breakage
> -#    viddec-test-app 
> +#    viddec-test-app

Was there a meaningful change here?


>  TI_TEST_TI_TOOLS:append:j721e = " \
>      pru-icss \
>      ufs-utils \
> -- 
> 2.43.0

