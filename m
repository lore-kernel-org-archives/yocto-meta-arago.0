Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58885C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 16:44:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.238.1648658688218205049
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 09:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 26E0540C3E;
	Wed, 30 Mar 2022 16:44:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAFkPbDUUOym; Wed, 30 Mar 2022 16:44:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04E0440A03;
	Wed, 30 Mar 2022 16:44:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C92AD1748C4; Wed, 30 Mar 2022 12:44:42 -0400 (EDT)
Date: Wed, 30 Mar 2022 12:44:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/dunfell][PATCH v3 2/2]
 packagegroup-*-graphics: add virtual provider for AM62x GPU driver v2
Message-ID: <20220330164442.GC23554@denix.org>
References: <20220330125356.32492-1-reatmon@ti.com>
 <20220330125356.32492-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330125356.32492-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Mar 2022 16:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13769

On Wed, Mar 30, 2022 at 07:53:56AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Krunal Bhargav <k-bhargav@ti.com>
> 
> Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index a356c76c..f9fab020 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -21,6 +21,13 @@ PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
>  
> +# am62xx has a Rogue GPU core
> +PREFERRED_PROVIDER_virtual/egl_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles1_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles2_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgbm_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/gpudriver_am62xx = "ti-img-rogue-driver"
> +
>  # This is required when using keystone devices with graphical support
>  # such as Qt5
>  PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
> -- 
> 2.17.1

