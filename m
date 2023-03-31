Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A652C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 20:26:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6320.1680294396638234716
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 13:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 259C440C6C;
	Fri, 31 Mar 2023 20:26:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHa9qPKtdxcj; Fri, 31 Mar 2023 20:26:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC22E40C24;
	Fri, 31 Mar 2023 20:26:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52E6C1637E8; Fri, 31 Mar 2023 16:25:56 -0400 (EDT)
Date: Fri, 31 Mar 2023 16:25:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v3] branding-ltsprep: LTS
 migration brand
Message-ID: <20230331202556.GH18050@denix.org>
References: <20230331191713.13675-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331191713.13675-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Mar 2023 20:26:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14285

On Fri, Mar 31, 2023 at 02:17:13PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add a new brand to control picking the next LTS version of kernel and
> u-boot while they are under development.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v3: Change u-boot version to 2023.04
> v2: Make the versions wildcarded so that they actually match...
> 
>  .../conf/distro/include/branding-ltsprep.inc          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> new file mode 100644
> index 00000000..a944bcdf
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> @@ -0,0 +1,11 @@
> +
> +PREFERRED_VERSION_linux-ti-staging = "6.1%"
> +PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
> +PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
> +PREFERRED_VERSION_u-boot-ti-staging = "2023.04%"
> +
> +# GPU support requires out-of-tree SGX and RGX drivers not available in until
> +# LTS prep is complete.  fall back to software rendering
> +MACHINE_FEATURES:remove = "gpu"
> +PREFERRED_PROVIDER_virtual/gpudriver = ""
> +
> -- 
> 2.17.1

