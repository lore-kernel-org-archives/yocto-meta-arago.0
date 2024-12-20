Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA83DE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 17:52:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1050.1734717163809095167
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 09:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 151BF40C8F;
	Fri, 20 Dec 2024 17:52:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_4HRiTPCg_D; Fri, 20 Dec 2024 17:52:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D542740A03;
	Fri, 20 Dec 2024 17:52:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 44D5D164142; Fri, 20 Dec 2024 12:52:39 -0500 (EST)
Date: Fri, 20 Dec 2024 12:52:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 1/2] flatbuffers: Remove
 this recipe
Message-ID: <20241220175239.GL23825@denix.org>
References: <20241220164910.318809-1-afd@ti.com>
 <20241220164910.318809-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220164910.318809-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Dec 2024 17:52:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15679

On Fri, Dec 20, 2024 at 10:49:09AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> This was used for TFlite and ARMNN before it was included in meta-oe.
> A newer better maintained version of this is in meta-oe now.

This was already merged?
https://git.yoctoproject.org/meta-arago/commit/?id=5b89c02419ba9dc6a2025019f55f46f4f12ea052


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../flatbuffers/flatbuffers_1.11.0.bb         | 34 -------------------
>  1 file changed, 34 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> deleted file mode 100644
> index 7f7b8b99..00000000
> --- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -SUMMARY = "Memory Efficient Serialization Library"
> -HOMEPAGE = "https://github.com/google/flatbuffers"
> -SECTION = "console/tools"
> -LICENSE = "Apache-2.0"
> -
> -PACKAGE_BEFORE_PN = "${PN}-compiler"
> -
> -RDEPENDS:${PN}-compiler = "${PN}"
> -RDEPENDS:${PN}-dev += "${PN}-compiler"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
> -
> -SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
> -
> -SRC_URI = "git://github.com/google/flatbuffers.git;protocol=https;branch=master"
> -
> -# Make sure C++11 is used, required for example for GCC 4.9
> -CXXFLAGS += "-std=c++11"
> -BUILD_CXXFLAGS += "-std=c++11"
> -
> -# BUILD_TYPE=Release is required, otherwise flatc is not installed
> -EXTRA_OECMAKE += "\
> -    -DCMAKE_BUILD_TYPE=Release \
> -    -DFLATBUFFERS_BUILD_TESTS=OFF \    
> -    -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
> -"
> -
> -inherit cmake
> -
> -S = "${WORKDIR}/git"
> -
> -FILES:${PN}-compiler = "${bindir}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.39.2

