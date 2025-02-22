Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BB2C021B3
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 02:34:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.39517.1740191669305964906
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 18:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC86B40D60;
	Sat, 22 Feb 2025 02:34:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zowjjSvL9q0E; Sat, 22 Feb 2025 02:34:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7214040D2B;
	Sat, 22 Feb 2025 02:34:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2849816428D; Fri, 21 Feb 2025 21:34:23 -0500 (EST)
Date: Fri, 21 Feb 2025 21:34:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Andrew <afd@ti.com>,
	Ryan Eatmon <reatmon@ti.com>, Vijay <vijayp@ti.com>,
	Khasim <khasim@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v2 0/1] Add TFLite Runtime
Message-ID: <20250222023423.GE1879@denix.org>
References: <20250221222446.4019819-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221222446.4019819-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Feb 2025 02:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15900

Thank you for addressing the comments - this looks reasonable.


On Sat, Feb 22, 2025 at 03:54:45AM +0530, Chirag Shilwant wrote:
> Add a new recipe to enable TFLite support in meta-arago-extras.
> This recipe uses the CMake build system and is based on the TensorFlow
> Lite v2.18.0 release.
> 
> This patch is currently applicable to scarthgap only. The master branch may
> require a minor update to accommodate the UNPACKDIR changes. I plan to post a
> master-equivalent patch after some testing to ensure compatibility.
> 
> Testing:
> - Verified that the recipe builds successfully for scarthgap for armv7 & armv8
> - Performed DL inferencing on AM335x (armv7) & AM62x (armv8) via benchmark_model 
> 
> I would appreciate your review and feedback on this submission.
> 
> Changes in v2,
> * Addressed Denys's suggestion to avoid network connectivity after do_fetch
> * Moved to TFLite v2.18 which is the latest release tag
> * Addressed Andrew's suggestion posted on v1 patch [0]
> 
> [0]: https://patchwork.yoctoproject.org/project/arago/patch/20250123172509.445473-2-c-shilwant@ti.com/
> 
> Regards,
> Chirag
> 
> Chirag Shilwant (1):
>   meta-arago-extras: Add recipe for TFLite Runtime
> 
>  ...eLists-for-building-_pywrap_tensorfl.patch |  37 +++
>  ...eLists-for-building-shared-object-li.patch |  61 +++++
>  ...uild-issues-observed-in-TFlite-v2.18.patch |  36 +++
>  .../tensorflow-lite/tensorflow2-lite.pc.in    |   6 +
>  .../tensorflow-lite/tensorflow-lite_2.18.0.bb | 232 ++++++++++++++++++
>  5 files changed, 372 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
>  create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
>  create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
>  create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/tensorflow2-lite.pc.in
>  create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb
> 
> -- 
> 2.34.1

