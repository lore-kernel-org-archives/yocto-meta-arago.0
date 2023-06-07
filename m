Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A2CC7EE2F
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 01:03:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3466.1686099816676868128
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 18:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wlxTspKA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35713Z74129467
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 20:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686099815;
	bh=zB2+FtC69NwZERQIlgqmd1l+598Py50HjhoRCUTk9k8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=wlxTspKAO0/CmYS3v1D1FEpifJeKOlFQswOvKTI1btBQ1fkwH6U2z7PIboXboU9yP
	 RVvQtqy0KBLZtbBWmmGp5Bu7QJPRGzu1/lnCxuV6Lpp1oyFCRwcOARap+wM3LwMX0g
	 MPR2fIPxZO69K2evY6sfQbm/QQ54OKPakycm16PI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35713Zxb029044
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 20:03:35 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 20:03:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 20:03:35 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35713Zch025397
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 20:03:35 -0500
Message-ID: <119fb974-745c-5230-1f25-e344ffd72350@ti.com>
Date: Tue, 6 Jun 2023 20:03:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] [meta-arago][master/kirkstone][PATCHv3]
 arago-image.inc: fix the default systemd target
Content-Language: en-US, en-US-large
To: <meta-arago@lists.yoctoproject.org>
References: <176635AEC230C132.22117@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176635AEC230C132.22117@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 01:03:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14517

On 6/6/23 18:28, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> SYSTEMD_DEFAULT_TARGET is dynamically set based on the contents of
> IMAGE_FEATURES. Would you like to know what doesn't get updated when we
> use a bunch of package groups to dictate what is present in the image?
> 
> This makes systemd actually start graphical applications if the opengl
> distro feature is set. This will need to be adjusted if further
> graphical environments are added.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/arago-image.inc | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
> index d00c1f70..a17288c6 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
>   
>   IMAGE_FEATURES += "package-management splash"
>   
> +# this is required to make sure the proper systemd default target gets set
> +IMAGE_FEATURES += " \
> +	${@bb.utils.filter("DISTRO_FEATURES", "weston", d)} \

I need sleep apparently. Making up distro features.

> +"
> +
>   # 4KB per 1 inode should be enough
>   EXTRA_IMAGECMD:ext2.gz += "-i 4096"
>   


