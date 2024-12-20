Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4086E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 18:04:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1311.1734717861129774587
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 10:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3680340C8F;
	Fri, 20 Dec 2024 18:04:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uje4HGU3CImH; Fri, 20 Dec 2024 18:04:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0961C40A03;
	Fri, 20 Dec 2024 18:04:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C47EA164142; Fri, 20 Dec 2024 13:04:16 -0500 (EST)
Date: Fri, 20 Dec 2024 13:04:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 0/2] Add ARM Compute
 Library
Message-ID: <20241220180416.GM23825@denix.org>
References: <20241220164910.318809-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220164910.318809-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Dec 2024 18:04:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15680

Andrew,

We used to have older versions of arm-compute-library and ARMNN in meta-arago, 
but those were unmaintained and removed not long ago...

Just a quick look around, there's a meta-machinelearning layer from Witekio, 
that hasn't been updated for 5.5 years.

Also, meta-webos has a bit newer versions of both in rather curiously named 
recipes-upstreamable directory:

https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-upstreamable/arm-compute-library/arm-compute-library_22.08.bb
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-upstreamable/armnn/armnn_22.08.bb

Maybe you can find anything useful there?



On Fri, Dec 20, 2024 at 10:49:08AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> Hello all,
> 
> This series adds support for arm-compute-library which will be used
> as the base for several other ARM based ML frameworks and apps.
> 
> This package will be sent for inclusion in meta-arm as it is ARM
> produced and supported software. This will be done after the patches
> here for ACL are taken into the project's upstream. We can drop
> this out of meta-arago master after that.
> 
> Thanks,
> Andrew
> 
> Andrew Davis (2):
>   flatbuffers: Remove this recipe
>   meta-arago-extras: Add recipe for arm-compute-library
> 
>  ...-indention-in-cmake-generator-script.patch | 130 ++++++++++++
>  ...ENABLE_NEON-in-code-for-checking-NEO.patch | 114 ++++++++++
>  ...ENABLE_SVE-in-code-for-checking-SVE-.patch | 197 ++++++++++++++++++
>  ...rce-files-at-library-definition-time.patch | 167 +++++++++++++++
>  ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 ++++++++++
>  ...SVE2-support-to-be-disabled-in-CMake.patch |  91 ++++++++
>  .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ++++++++
>  ...ymbol-error-when-building-TensorInfo.patch |  46 ++++
>  .../arm-compute-library_24.12.bb              |  79 +++++++
>  .../flatbuffers/flatbuffers_1.11.0.bb         |  34 ---
>  .../recipes-core/packagegroups/ti-test.bb     |   1 +
>  11 files changed, 1023 insertions(+), 34 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0004-Add-source-files-at-library-definition-time.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library/0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch
>  create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-library_24.12.bb
>  delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb

