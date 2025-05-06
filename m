Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA44C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:11:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.80297.1746547915503356168
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 May 2025 09:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B7EB440CC6;
	Tue,  6 May 2025 16:11:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXef93aEbIMb; Tue,  6 May 2025 16:11:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8ECE940CC5;
	Tue,  6 May 2025 16:11:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 506F21678F0; Tue,  6 May 2025 12:11:52 -0400 (EDT)
Date: Tue, 6 May 2025 12:11:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-arago][scarthgap][PATCH v1 2/3] meta-arago-test:
 recipes-graphics: Add opencl c headers
Message-ID: <20250506161152.GB18383@denix.org>
References: <20250505153309.1739313-1-a-christidis@ti.com>
 <20250505153309.1739313-3-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505153309.1739313-3-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 16:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16180

On Mon, May 05, 2025 at 10:33:08AM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Add opencl c headers, tag 2024.05.08.

Same comment I gave to Randolph for mesa-demos - adding a different/newer 
version of an upstream recipe is generally not recommended from a YP 
compliance perspective. That's why it was a guarded .bbappend here.

May not be a big issue for scarthgap only, as long as it's done properly in 
master.


> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../opencl/opencl-headers_2024.05.08.bb       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb b/meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb
> new file mode 100644
> index 00000000..b66181a9
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/opencl/opencl-headers_2024.05.08.bb
> @@ -0,0 +1,19 @@
> +SUMMARY  = "OpenCL API Headers"
> +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> +LICENSE  = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +SECTION = "base"
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
> +
> +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
> +
> +ALLOW_EMPTY:${PN} = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.34.1

