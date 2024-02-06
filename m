Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAFCC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 00:01:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10137.1707177653953448160
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 16:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RyjgTtDn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41600rm0065050
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Feb 2024 18:00:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707177653;
	bh=qQTphbPtwBACymlSeuR5JPIvy13GX8pyCuCN4psVOiM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=RyjgTtDnmjOwwHgaMHN5qY3d0/Apc6U+i9iTEHLngcxeOt1wm4sQWe/PvpTjZIyMf
	 sRsFK2AIFW5w/Y4OyqPOV7kOaIS6qLguE+50r8jWrjAhnGeYAUb6i0AFS6xJmFyg0o
	 GqXxRVfQuVdYb1567xw88BXeiU8ii0p8nU+82d6Y=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41600rXo098081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Feb 2024 18:00:53 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 18:00:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 18:00:52 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41600qNc119631
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 Feb 2024 18:00:52 -0600
Message-ID: <410539b1-fd8a-417e-8c65-d0aa3c5ffe34@ti.com>
Date: Mon, 5 Feb 2024 18:00:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] cairo: remove cairo append and
 include
Content-Language: en-US, en-US-large
To: <meta-arago@lists.yoctoproject.org>
References: <17B11CAE712BD54F.26550@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <17B11CAE712BD54F.26550@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Feb 2024 00:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15115

On 2/5/24 17:54, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Cairo versions greater than 1.17.8 dropped both the GL render backend
> entirely, invalidating both the opengl and glesv2 PACKAGECONFIGS and
> this override entirely.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
>   meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
>   2 files changed, 6 deletions(-)
>   delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>   delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
> 
> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> deleted file mode 100644
> index 459d8d09..00000000
> --- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
> diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
> deleted file mode 100644
> index b41f1a01..00000000
> --- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# This is required since cairo expects the opengl distro feature to refer to
> -# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
> -
> -PACKAGECONFIG:remove = "opengl"
> -PACKAGECONFIG:append = " glesv2"

Whoops, wrong list. Ignore this.

