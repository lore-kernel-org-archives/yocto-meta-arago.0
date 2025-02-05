Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F62C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 17:02:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.17700.1738774975591018305
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 09:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB35340C85;
	Wed,  5 Feb 2025 17:02:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieQxMJ2sRyK2; Wed,  5 Feb 2025 17:02:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7B60D407E5;
	Wed,  5 Feb 2025 17:02:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D56F516420F; Wed,  5 Feb 2025 12:02:50 -0500 (EST)
Date: Wed, 5 Feb 2025 12:02:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/scarthgap][PATCH] kms++: Move to
 meta-arago-test
Message-ID: <20250205170250.GK21608@denix.org>
References: <20250205143526.24695-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205143526.24695-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 17:02:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15807

On Wed, Feb 05, 2025 at 08:35:26AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Since we added kms++ as a dependency to ti-test, we missed that kms++
> was coming from meta-arago-extras which created a dependency we do not
> want.  So move it to meta-arago-test.

Since scarthgap, it is now available from meta-oe as kmsxx, pointing to a 
newer commit:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-graphics/kms++/kms++_git.bb                           | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-arago-extras => meta-arago-test}/recipes-graphics/kms++/kms++_git.bb (100%)
> 
> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-test/recipes-graphics/kms++/kms++_git.bb
> similarity index 100%
> rename from meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
> rename to meta-arago-test/recipes-graphics/kms++/kms++_git.bb
> -- 
> 2.17.1

