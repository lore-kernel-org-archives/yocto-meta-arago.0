Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48D7CFD352
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 19:20:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25185.1764012031963856555
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 11:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 69DB540C6C;
	Mon, 24 Nov 2025 19:20:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pe_cGvgWX6ER; Mon, 24 Nov 2025 19:20:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45ECD40BA8;
	Mon, 24 Nov 2025 19:20:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 831B9175A21; Mon, 24 Nov 2025 14:20:26 -0500 (EST)
Date: Mon, 24 Nov 2025 14:20:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [scarthgap][PATCH] arago,conf: set preferred
 runtime provider for weston-init
Message-ID: <20251124192026.GN3125@denix.org>
References: <20251121234400.1356544-1-denis@denix.org>
 <20251122000026.1022350-1-prc@list.ti.com>
 <54898c34-58f2-4ac7-aa46-24458f9153db@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54898c34-58f2-4ac7-aa46-24458f9153db@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Nov 2025 19:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16835

On Mon, Nov 24, 2025 at 08:47:51AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 11/21/2025 6:00 PM, PRC Automation via lists.yoctoproject.org wrote:
> >meta-arago / na / 20251121234400.1356544-1-denis
> >
> >PRC Results: PASS
> >
> >=========================================================
> >   check-yocto-patches: PASS
> >=========================================================
> >Patches
> >----------------------------------------
> >WARN - [scarthgap][PATCH] arago,conf: set preferred runtime provider for weston-init
> >     WARN: Commit message does not include file/recipe name: arago,conf: set preferred runtime provider for weston-init. (COMMIT-MESSAGE-2)
> >         patch
> >     For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> >
> 
> Score one for the checker!  Change the comma to a period.

Ah, good point


> >=========================================================
> >   apply-yocto-patch: PASS
> >=========================================================
> >scarthgap
> >=====================
> >Summary:
> >- Patch Series: [scarthgap][PATCH] arago,conf: set preferred runtime provider for weston-init
> >- Submitter: From: Denys Dmytriyenko <denis@denix.org>
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >- Date: Date: Fri, 21 Nov 2025 18:44:00 -0500
> >- Num Patches: 1
> >- Mailing List (public inbox) Commit SHA: 60ec81d5be40337dee935203f168119768e48293
> >
> >Applied to:
> >- Repository: lcpd-prc-meta-arago
> >- Base Branch: scarthgap-wip
> >- Commit Author: Ryan Eatmon <reatmon@ti.com>
> >- Commit Subject: nnshark: Set missing PV
> >- Commit SHA: 7b5396d2e36debe754adaaaef84d4eb46688d4e0
> >
> >Patches
> >----------------------------------------
> >All patches applied
> >
> >
> >
> >=========================================================
> >   check-yocto-repo: PASS
> >=========================================================
> >scarthgap
> >=====================
> >PASS
> >
> >
> >
> >=========================================================
> >   yocto-check-layers: PASS
> >=========================================================
> >scarthgap - PASS
> >=====================
> >All checks passed
> >
> >
> >
> >
> >
> >
> >
> >

