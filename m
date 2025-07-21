Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFA8C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 20:12:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.51519.1753128759206450810
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 13:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64E1440C2C;
	Mon, 21 Jul 2025 20:12:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNRIF5DkN4BZ; Mon, 21 Jul 2025 20:12:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 26DFD40800;
	Mon, 21 Jul 2025 20:12:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 582AE16C974; Mon, 21 Jul 2025 16:12:34 -0400 (EDT)
Date: Mon, 21 Jul 2025 16:12:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2] dma-heap-tests: Update SRCREV
 to fix CMake 4.0 issue
Message-ID: <20250721201234.GH24899@denix.org>
References: <20250721194739.23450-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721194739.23450-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Jul 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16320

On Mon, Jul 21, 2025 at 02:47:39PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> License-Update: New central file was created to hold the license
> information.  No change in actual license for the project.

License-Update: license text moved to its own file

https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html#license-updates


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> 
> ---
> v2: Another SRCREV bump to pick up new LICENSE file and move the
> LIC_FILES_CHKSUM to that new file.
> 
>  meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
> index 69f95391..3c0eaa5a 100644
> --- a/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
> +++ b/meta-arago-test/recipes-devtools/dma-heap/dma-heap-tests.bb
> @@ -1,13 +1,13 @@
>  SUMMARY = "Test cases for DMA-Heap framework"
>  HOMEPAGE = "https://github.com/glneo/dma-heap-tests"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=d16465a9e7dc8f53bfdf997c4bf55540"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4c3b4cb87cfc8ccba69d579fbd7b0fb3"
>  
>  PV = "1.0"
>  
>  BRANCH = "master"
>  SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "334fc8ec8056badc9c6667e6f1328705cb973ab4"
> +SRCREV = "230b406e97c12be5f930125a432d0dfa0316aa39"
>  
>  DEPENDS = "googletest"
>  
> -- 
> 2.17.1

