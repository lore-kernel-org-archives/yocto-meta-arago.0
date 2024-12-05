Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A68E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 20:39:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22213.1733431171981538615
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 12:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 013DC40CAF;
	Thu,  5 Dec 2024 20:39:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFTmrVCsb8mU; Thu,  5 Dec 2024 20:39:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B864540C56;
	Thu,  5 Dec 2024 20:39:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 242FD1640F6; Thu,  5 Dec 2024 15:39:25 -0500 (EST)
Date: Thu, 5 Dec 2024 15:39:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: jm@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test: Add rng-tools
Message-ID: <20241205203925.GC23825@denix.org>
References: <20241205201212.1114249-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205201212.1114249-1-jm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Dec 2024 20:39:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15643

rng-tools were removed back in 2023:
https://git.yoctoproject.org/meta-arago/commit/?id=dc19fed1b898cf5abdf50fa04dda7b1d9afd22ca

and added back last September to master and scarthgap:
https://git.yoctoproject.org/meta-arago/commit/?id=662a5119446e7d47094a68efe8b775b3dda2b4e8

I see you are trying to backport that to kirkstone, even though the subject 
states master...

Anyway, based on Randolph's comments for the removal, rngd was deprecated 
and is no longer needed - should testcases be adjusted for the removal of 
rng-tools?


On Thu, Dec 05, 2024 at 02:12:12PM -0600, Mendez, Judith via lists.yoctoproject.org wrote:
> Add rng-tools to the ti-test tool list.
> 
> RNG testcases are failing since they require
> rngtest, so add rng-tools to ti-test only.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> This patch has been previously sent and merged to scarthgap
> branch, but is also required for kirkstone
> ---
>  meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index a80b943b..85398eaf 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -44,6 +44,7 @@ TI_TEST_BASE = "\
>      powertop \
>      procps \
>      pulseaudio-misc \
> +    rng-tools \
>      rt-tests \
>      rwmem \
>      smcroute \
> -- 
> 2.46.0

