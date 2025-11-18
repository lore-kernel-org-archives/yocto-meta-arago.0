Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF05FCEE34F
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 19:20:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5189.1763493612195226114
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 11:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A02B440C7B;
	Tue, 18 Nov 2025 19:20:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmU-GcqBZ5Qw; Tue, 18 Nov 2025 19:20:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56F2740BD6;
	Tue, 18 Nov 2025 19:20:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 078501756F6; Tue, 18 Nov 2025 14:20:06 -0500 (EST)
Date: Tue, 18 Nov 2025 14:20:05 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: s-joshi@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Shiva Tripathi <s-tripathi1@ti.com>,
	Kamlesh Gudaseni <kamlesh@ti.com>,
	Kavitha Malarvizhi <k-malarvizhi@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Add
 libp11 library
Message-ID: <20251118192005.GF3125@denix.org>
References: <20251117081833.3718999-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117081833.3718999-1-s-joshi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Nov 2025 19:20:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16787

Per PRC, the Subject line should specify the recipe, not the layer, that gets 
modified by the patch.


On Mon, Nov 17, 2025 at 01:48:33PM +0530, Suhaas Joshi via lists.yoctoproject.org wrote:
> Add libp11 library to meta-arago-distro layer. This library provides the
> pkcs11.so engine, which OpenSSL uses for its PKCS#11-related operations.
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 5cb4e30c..f0f5b66c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -49,6 +49,7 @@ ARAGO_EXTRA = "\
>      cifs-utils \
>      phytool \
>      lldpd \
> +    libp11 \
>  "
>  
>  ARAGO_EXTRA:append:arago = "\
> -- 
> 2.34.1

