Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934CEC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:25:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.45519.1753115099735256822
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 09:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91D46406B9;
	Mon, 21 Jul 2025 16:24:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNskxYH4WcJT; Mon, 21 Jul 2025 16:24:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5787840021;
	Mon, 21 Jul 2025 16:24:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8983416C6FF; Mon, 21 Jul 2025 12:24:54 -0400 (EDT)
Date: Mon, 21 Jul 2025 12:24:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] dma-heap-tests: Update SRCREV to
 fix CMake 4.0 issue
Message-ID: <20250721162454.GG24899@denix.org>
References: <20250721145146.21181-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721145146.21181-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 16:25:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16316

ERROR: dma-heap-tests-1.0-r0 do_populate_lic: QA Issue: dma-heap-tests: LIC_FILES_CHKSUM points to an invalid file: .../dma-heap-tests-1.0/src/heap_test_fixture.cpp [license-checksum]


On Mon, Jul 21, 2025 at 09:51:46AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
> index 69f95391..c0eeaaaa 100644
> --- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
> +++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
> @@ -7,7 +7,7 @@ PV = "1.0"
>  
>  BRANCH = "master"
>  SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
> +SRCREV = "ead2ea8a9c3b81e97324da44c76cd9295e6c5efc"
>  
>  DEPENDS = "googletest"
>  
> -- 
> 2.17.1

