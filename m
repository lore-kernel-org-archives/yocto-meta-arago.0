Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F25DC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 20:00:26 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.4547.1748980825613367747
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 13:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rehEyK05;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553K0MKn603206;
	Tue, 3 Jun 2025 15:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748980822;
	bh=I/NeuZlArwu9UdbzhLXQ2rUktqLnX08op8n6uSzvk00=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rehEyK05rSNftI7QjdEZzcdfZknslgX5bI4/Tzev57kN5ZgmtgSFiL12WE5Qbh7WF
	 vsn3P0sM06bAi6gb4Sl2fj2A+p3R59v0d+c7KiX0V1nIpon2iWB8emhRhYQX6QXRvb
	 J5tkJjxq7AGmLpd0NmDf28PecqT6T4iZKY89wJfo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553K0M4j3826996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 15:00:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 15:00:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 15:00:22 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553K0M57838693;
	Tue, 3 Jun 2025 15:00:22 -0500
Message-ID: <4b4f002d-69f1-44e6-a5f0-e5abece7e210@ti.com>
Date: Tue, 3 Jun 2025 15:00:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] packagegroup-arago-tisdk-graphics:
 add mesa-demos and sdl2
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <vijayp@ti.com>
References: <20250602220116.2091347-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250602220116.2091347-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Jun 2025 20:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16249

On 6/2/25 5:01 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add the new mesa-demos package to this group so that users and scripts
> can use eglinfo to query information about supported extensions and
> configs for multiple platforms. It also adds vkgears and es2gears to
> test Vulkan and GLES 2 respectively.
> 
> Add libsdl2 as it's a useful, minimal graphics toolkit that allows users
> to build GLES and Vulkan applications with less boilerplate. We have a
> few internal test applications that currently use it.

Any reason these applications could not be added here? libsdl2 like other
pure libraries should only be added as dependencies of the applications
that use them.

Andrew

> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-graphics.bb          | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index fc1a5be3..3728ae52 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> @@ -9,6 +9,8 @@ inherit packagegroup
>   GFX_WAYLAND = "\
>       weston-init-arago \
>       weston-examples \
> +    mesa-demos \
> +    libsdl2 \
>   "
>   
>   RDEPENDS:${PN} = "\

