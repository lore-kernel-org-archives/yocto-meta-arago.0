Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A02C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:03:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6720.1788210190231614911
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 99BAD40C3E;
	Mon, 31 Aug 2026 21:03:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D73ns3cPLKFm; Mon, 31 Aug 2026 21:03:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5DFC340B13;
	Mon, 31 Aug 2026 21:03:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A89317CF4B; Mon, 31 Aug 2026 17:03:06 -0400 (EDT)
Date: Mon, 31 Aug 2026 17:03:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] open62541: Bump to version 1.5.7
Message-ID: <20260831210306.GN19759@denix.org>
References: <20260831205233.3284636-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831205233.3284636-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17629

On Mon, Aug 31, 2026 at 03:52:33PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We need to follow a commit in meta-openembedded [1] and bump the
> version of our bbappend to 1.5.7.

Oops, I see you also stumbled upon this... You can disregard my patch.


> [1] https://git.openembedded.org/meta-openembedded/commit/?id=b6c09f6630d5e88a993252cb7e5ee23aec9fd569
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend} (100%)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
> similarity index 100%
> rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend
> rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
> -- 
> 2.43.0

