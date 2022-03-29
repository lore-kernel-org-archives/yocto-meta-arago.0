Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B148CC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 04:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3006.1648529489827730475
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 21:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 266E440C1E;
	Tue, 29 Mar 2022 04:51:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SE3qTksC7HC7; Tue, 29 Mar 2022 04:51:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F236F40952;
	Tue, 29 Mar 2022 04:51:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C35141748B6; Tue, 29 Mar 2022 00:51:24 -0400 (EDT)
Date: Tue, 29 Mar 2022 00:51:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 2/2] arago-prefs: only the j721e
 SoC is currently supported
Message-ID: <20220329045124.GS23554@denix.org>
References: <20220325184615.17398-1-afd@ti.com>
 <20220325184615.17398-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325184615.17398-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 04:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13758

On Fri, Mar 25, 2022 at 01:46:15PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> There are now three SoCs in the J7 family, but only the j721e variant
> is currently supported. Be specific here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

