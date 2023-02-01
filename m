Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5C5C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 19:09:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.33127.1675278560104077970
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 11:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19E0140BEB;
	Wed,  1 Feb 2023 19:09:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 801DEj9UHkSN; Wed,  1 Feb 2023 19:09:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2CC040429;
	Wed,  1 Feb 2023 19:09:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8DCBD163712; Wed,  1 Feb 2023 14:08:54 -0500 (EST)
Date: Wed, 1 Feb 2023 14:08:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] arago-prefs: Change how
 variants interact with the kernel choice
Message-ID: <20230201190854.GP22689@denix.org>
References: <20230201144300.24040-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201144300.24040-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Feb 2023 19:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14197

On Wed, Feb 01, 2023 at 08:43:00AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Rather than just explicitly locking the PREFERRED_PROVIDER_virtual/kernel
> to linux-ti-staging and the suffix, use the :append to add the suffix to
> whatever value PREFERRED_PROVIDER_virtual/kernel is.  This allows a
> machine in a BSP layer to control which kernel to use as the bsse.
> 
> In the event that the kernel/variant choice is not valid the error
> report from bitbake is very vague, but it does fail so you will not get
> an incorrect build.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 2dc4f212..34c3c539 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -6,7 +6,7 @@ PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
>  
>  PREFERRED_PROVIDER_virtual/gettext = "gettext"
>  
> -PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
> +PREFERRED_PROVIDER_virtual/kernel:append = "${ARAGO_KERNEL_SUFFIX}"
>  
>  PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"

