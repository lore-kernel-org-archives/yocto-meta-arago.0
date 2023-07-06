Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2596AEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:55:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28051.1688658940562825804
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 08:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C8BZPEjt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 366Ftd6G091507
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Jul 2023 10:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688658940;
	bh=2EVp4+HVLBibulJScxSSxzvf6Sq7/pBZerPRZLcuKrY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=C8BZPEjt/a65unPGUoCQ3CdgeqS5qsqiiM09duG2ZFh70UhWnJpK8isIHK1k+1m/F
	 X5XTd+HJQ8l4zh/PV6Ucnt3FKrDUYhUB1u/SL4af64t2dVw8Vx1mPqfHL0NhuoQ/0u
	 3dMv37Z3/hJTWloRsmP9EBfz1XjSGQvipWLrt1bc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 366FtdXb010770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Jul 2023 10:55:39 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jul 2023 10:55:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jul 2023 10:55:39 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 366FtdUh040241
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Jul 2023 10:55:39 -0500
Message-ID: <7f6dfc43-8bb2-7c3a-c31a-78b0a8bc50ca@ti.com>
Date: Thu, 6 Jul 2023 10:55:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] [meta-arago][master/kirkstone][PATCH]
 arago-tiny-image: set ARAGO_SYSVINIT properly
Content-Language: en-US, en-US-large
To: <meta-arago@lists.yoctoproject.org>
References: <176F50EF2C74F35E.31324@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176F50EF2C74F35E.31324@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 15:55:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14770

On 7/6/23 10:29, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Set ARAGO_SYSVINIT init properly so the init system and login service
> gets configured properly. Also add the bite back in from my old patch to
> drop the sysvinit distro feature when systemd is selected so we don't
> have legacy init scripts and modern init scripts mixed in the images
> that use systemd.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf                   | 1 +
>   meta-arago-distro/recipes-core/images/arago-tiny-image.inc | 6 +-----
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index e0087ab7..e00dddd4 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -66,6 +66,7 @@ VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVa
>   VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
>   
>   DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
> +DISTRO_FEATURES:remove = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
>   
>   # Distro-specific package configuration
>   PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
> diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> index 242e763c..e5c75946 100644
> --- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
> @@ -1,9 +1,5 @@
> -ARAGO_SYSVINIT = "1"
> -
>   require arago-image.inc
>   
>   IMAGE_FEATURES:remove = "splash"
>   
> -IMAGE_INSTALL = " \
> -	packagegroup-arago-sysvinit-boot \
> -"
> +ARAGO_SYSVINIT[export] := "1"

Hold on, this is incorrect as well. It just forces the tiny image to 
also use systemd currently. Still need to find that variable flag for 
setting dependency before arago.conf gets processed...

