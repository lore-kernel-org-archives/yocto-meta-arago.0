Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C60CC3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 19:12:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.34374.1744571522354066476
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 13 Apr 2025 12:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4425840CB2;
	Sun, 13 Apr 2025 19:12:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZVdJUb2Riab; Sun, 13 Apr 2025 19:12:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0147540B13;
	Sun, 13 Apr 2025 19:11:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ACF061660A9; Sun, 13 Apr 2025 15:11:55 -0400 (EDT)
Date: Sun, 13 Apr 2025 15:11:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com, Suman Anna <s-anna@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>, reatmon@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/scarthgap][PATCH] hwspinlocktest: Fix
 build against latest kernel
Message-ID: <20250413191155.GM13634@denix.org>
References: <20250411192050.22024-1-reatmon@ti.com>
 <797859ae-8101-4833-a941-23dac48d8738@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <797859ae-8101-4833-a941-23dac48d8738@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 13 Apr 2025 19:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16168

On Sat, Apr 12, 2025 at 10:30:14PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hi Praneeth,
> 
> On 12/04/25 00:50, Ryan Eatmon via lists.yoctoproject.org wrote:
> >A recent change in the kernel removed a function that this test was
> >calling.  This patch removes the calls to that function and modifies the
> >flow to not need it.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> 
> <snip>
> 
> >+SRC_URI = "\
> >+    git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
> 
> 
> 
> What's preventing us to move this repository under [0] or [1] ?
> 
> 
> [0]: https://github.com/TexasInstruments/
> 
> [1]: https://git.ti.com/cgit/

+ Suman


> 
> 
> >+    file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
> >+    file://0002-Add-support-for-AM62-SoCs.patch \
> >+    file://0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch \
> >+"
> >+
> >  SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
> >  S = "${WORKDIR}/git"

