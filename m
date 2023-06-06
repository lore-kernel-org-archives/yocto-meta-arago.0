Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14FEC7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:29:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1632.1686094151402117452
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Fx55pjbT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356NTALl004258
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 18:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686094150;
	bh=8oZR9uGOXiUbC6kYE50KXyumLRq/N/I/Mif2hM4aWuE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Fx55pjbT9uHqShnHC3LmtTn2CEhvAj6/TJxvzQ2FougSP3eq8xo4LtvE1dJDUvs1i
	 kIWh16i5c49A4L51b9Oih4N50fguuDYxa3KkzBjB6OvGQdPTaVFxWv5GnU5e1imRSJ
	 0zBQfHl/qX5qdgYCOh+WhgWFYtP09eBPCjCjpe4g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356NTAD5055024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 18:29:10 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 18:29:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 18:29:10 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356NTADD044158
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 18:29:10 -0500
Message-ID: <2adad8b0-5bc1-93d4-1a3e-f19a4377c5e2@ti.com>
Date: Tue, 6 Jun 2023 18:29:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] [meta-arago][master/kirkstone][PATCHv2]
 arago-image.inc: fix the default systemd target
Content-Language: en-US, en-US-large
To: <meta-arago@lists.yoctoproject.org>
References: <176635A00B5FC239.22117@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176635A00B5FC239.22117@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:29:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14516

On 6/6/23 18:27, Randolph Sapp via lists.yoctoproject.org wrote:
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
> index d00c1f70..ce1f2ad7 100644
> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> @@ -6,6 +6,11 @@ COMPATIBLE_MACHINE = "ti-soc"
>   
>   IMAGE_FEATURES += "package-management splash"
>   
> +# this is required to make sure the proper systemd default target gets set
> +IMAGE_FEATURES += " \
> +	${@bb.utils.filter("DISTRO_FEATURES", "weston", d)}

Rats.

> +"
> +
>   # 4KB per 1 inode should be enough
>   EXTRA_IMAGECMD:ext2.gz += "-i 4096"
>   


