Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0546C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:35:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2590.1672799744689896274
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 18:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FAC840AC9;
	Wed,  4 Jan 2023 02:35:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzL7DgYpwCva; Wed,  4 Jan 2023 02:35:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E93E4409B0;
	Wed,  4 Jan 2023 02:35:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 468C61636B7; Tue,  3 Jan 2023 21:35:27 -0500 (EST)
Date: Tue, 3 Jan 2023 21:35:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Bernd Sprenger <bernd@sprenger.org>
Cc: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] Patch to enable overriding linux-ti-staging kernel
Message-ID: <20230104023527.GF22689@denix.org>
References: <GVAP278MB0117A08C96137519825B1E57DBF49@GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVAP278MB0117A08C96137519825B1E57DBF49@GVAP278MB0117.CHEP278.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 02:35:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14146

On Tue, Jan 03, 2023 at 02:02:14PM +0000, Bernd Sprenger wrote:
> Hello,
> 
> for my projects I use another kernel than the linux-ti-staging. I had to 
> patch the meta-arago to achieve this. In my opinion this is a nice feature 
> and is achieved by the small patch below for tag 08.04.00.005. Maybe you 
> could integrate this into the next releases...

Well, if you want to use Arago but replace the kernel, this is probably fine. 
But please post it as a proper patch. Thanks.

-- 
Denys


> Thanks a lot,
> have a nice day,
> Bernd
> 
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index f9fab020..dc55bfec 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -37,7 +37,7 @@ PREFERRED_PROVIDER_virtual/libgbm_keystone = "mesa"
> PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
> PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
> -PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
>  # For TI devices with only baremetal/TI RTOS support
> PREFERRED_PROVIDER_virtual/kernel_c66x = "linux-dummy"

