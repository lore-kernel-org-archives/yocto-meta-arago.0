Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE95C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 04:51:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3062.1648529477476035052
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 21:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C5A8840C1E;
	Tue, 29 Mar 2022 04:51:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjE648q3REsl; Tue, 29 Mar 2022 04:51:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9EF4540952;
	Tue, 29 Mar 2022 04:51:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E6D61748B6; Tue, 29 Mar 2022 00:51:12 -0400 (EDT)
Date: Tue, 29 Mar 2022 00:51:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 1/2] meta-arago: rename j7-evm to
 j721e-evm
Message-ID: <20220329045112.GR23554@denix.org>
References: <20220325184615.17398-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325184615.17398-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Mar 2022 04:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13757

On Fri, Mar 25, 2022 at 01:46:14PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> In many places we use "j7" the family when we should be using a
> specific SoC or EVM and vice-versa. For instance when including
> graphics drivers we add for all "j7" family, but what we really
> want is only for some specific j7 SoC.
> 
> First step in untangling this is to make it clear that there is
> no SoC called j7. There is a SoC called j721e with a j721e-evm.
> 
> Fix up this naming here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

