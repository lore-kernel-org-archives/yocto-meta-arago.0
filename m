Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1FBC4829C
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:06:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11781.1707757595664507726
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 09:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PMixoWp7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CH6WQW081771;
	Mon, 12 Feb 2024 11:06:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707757592;
	bh=iajlP3+tEZnfzFWOcY7xTrQ4a/+7vnmXgpUHLy6UDyc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PMixoWp7o9016xMot3Oz/HaXfPF0wHPUraniYBQPJKzyKiL9wyxTtLX3ipvebsgP6
	 8P5KOtepA7li/PgnsZQftjSoaoJ/vzimex7687lSX/2tBbhAlCsigIypwCHCjir71f
	 Q0P02FbknWrV3VILIq1o8Naj+vXAhUumUVj5UqKk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CH6WpR065793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 11:06:32 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 11:06:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 11:06:31 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CH6VW7020778;
	Mon, 12 Feb 2024 11:06:31 -0600
Message-ID: <0bf9ab21-a7dd-478f-b406-888115e9c727@ti.com>
Date: Mon, 12 Feb 2024 11:06:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] graphics: kms++: Enable OmapCard
 support in pykms library
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Sinthu Raja <sinthu.raja@ti.com>
References: <20240212163122.20728-1-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240212163122.20728-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 17:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15167

On 2/12/24 10:31 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> AM57x platform supports OMAP DRM. By default the pykms library
> disabled the OmapCard support. Enable the same by defining the
> HAS_LIBDRM_OMAP as a compiler flags

What project uses this feature? I didn't think there were any
remaining users of the libdrm OMAP specific framebuffers.

Andrew

> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   ...-Add-OMAP-Card-support-for-AM57x-DRM.patch | 26 +++++++++++++++++++
>   .../recipes-graphics/kms++/kms++_git.bb       |  2 ++
>   2 files changed, 28 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> 
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> new file mode 100644
> index 00000000..48c9068d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++/0001-Add-OMAP-Card-support-for-AM57x-DRM.patch
> @@ -0,0 +1,26 @@
> +From bc6e89ea8695c7e94eb6892755e47781682e28a7 Mon Sep 17 00:00:00 2001
> +From: Sinthu Raja <sinthu.raja@ti.com>
> +Date: Mon, 12 Feb 2024 21:47:52 +0530
> +Subject: [PATCH] Add OMAP Card support for AM57x DRM
> +
> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> +---
> + py/pykms/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/py/pykms/meson.build b/py/pykms/meson.build
> +index de05d12..ce6c013 100644
> +--- a/py/pykms/meson.build
> ++++ b/py/pykms/meson.build
> +@@ -49,7 +49,7 @@ if get_option('libutils')
> +     pykms_deps += [ libkmsxxutil_dep ]
> + endif
> +
> +-pykms_args = [ '-fvisibility=hidden' ]
> ++pykms_args = [ '-fvisibility=hidden' , '-DHAS_LIBDRM_OMAP' ]
> +
> + destdir = get_option('libdir') / 'python' + py3_dep.version() / 'site-packages/pykms'
> +
> +--
> +2.36.1
> +
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> index 2c0abaa7..010a1f0a 100644
> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> @@ -28,3 +28,5 @@ inherit python3native meson pkgconfig update-alternatives
>   ALTERNATIVE_PRIORITY = "100"
>   ALTERNATIVE:${PN} = "kmstest"
>   ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
> +
> +SRC_URI:append:am57xx = "file://0001-Add-OMAP-Card-support-for-AM57x-DRM.patch"

