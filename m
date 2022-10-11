Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07E1C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 19:22:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11664.1665516143118751375
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 12:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 510C940D4E;
	Tue, 11 Oct 2022 19:22:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s87AfSq8EzhO; Tue, 11 Oct 2022 19:22:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D0B640D49;
	Tue, 11 Oct 2022 19:22:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 894F5174A1B; Tue, 11 Oct 2022 15:22:15 -0400 (EDT)
Date: Tue, 11 Oct 2022 15:22:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 0/6] Deprecated recipe
 removals
Message-ID: <20221011192215.GB22689@denix.org>
References: <20221011175320.26843-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011175320.26843-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 19:22:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14078

On Tue, Oct 11, 2022 at 12:53:14PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Hello all,
> 
> Same series as last time, just removed that last patch
> (meta-arago: Use new J7 SoC names over specific board names)
> as it will be expanded into a new series.

LGTM, thanks!


> Thanks,
> Andrew
> 
> Andrew Davis (6):
>   ti-crypto-examples: Remove ti-crypto-examples
>   big-data-ipc-demo: Merge include file and rename
>   cmem: Remove Makefile_cmem-mod and cmem refrences
>   meta-arago: Remove remaining bits of ti-ocf-crypto-module
>   ti-pru-sw: Remove old TI-PRU-SW examples and helpers
>   ti-tisdk: Remove uio-module-drv kernel module
> 
>  .../conf/distro/include/arago-source-ipk.inc  | 19 ++---------
>  ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 19 +----------
>  ...kagegroup-arago-tisdk-addons-sdk-target.bb |  5 ---
>  .../packagegroup-arago-tisdk-addons.bb        | 24 +-------------
>  .../packagegroup-arago-tisdk-crypto.bb        |  1 -
>  .../recipes-core/packagegroups/ti-test.bb     |  2 --
>  .../ti-tisdk-makefile/Makefile_cmem-mod       | 33 -------------------
>  .../Makefile_ti-crypto-examples               | 24 --------------
>  .../Makefile_ti-ocf-crypto-module             | 18 ----------
>  .../ti-tisdk-makefile/Makefile_uio-module-drv | 28 ----------------
>  .../ti-tisdk-makefile_1.0.bb                  | 11 -------
>  .../big-data-ipc-demo/big-data-ipc-demo.inc   | 30 -----------------
>  ...-linux_git.bb => big-data-ipc-demo_git.bb} | 30 +++++++++++------
>  .../ti-crypto-examples_git.bb                 | 30 -----------------
>  .../ti-pru-sw-app-loader_1.00.00.bb           | 26 ---------------
>  .../ti-pru-sw-edma-library_1.00.00.bb         | 30 -----------------
>  .../ti-pru-sw-examples_1.00.00.bb             | 31 -----------------
>  17 files changed, 24 insertions(+), 337 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cmem-mod
>  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
>  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
>  delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
>  delete mode 100644 meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
>  rename meta-arago-extras/recipes-apps/big-data-ipc-demo/{big-data-ipc-demo-linux_git.bb => big-data-ipc-demo_git.bb} (54%)
>  delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
>  delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
>  delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
>  delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb

