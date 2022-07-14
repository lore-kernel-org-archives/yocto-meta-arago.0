Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FEFC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 17:37:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.10560.1657820264696353613
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Jul 2022 10:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0970040C8E;
	Thu, 14 Jul 2022 17:37:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmJWzWVjZXZC; Thu, 14 Jul 2022 17:37:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0BC840C67;
	Thu, 14 Jul 2022 17:37:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C51821749AB; Thu, 14 Jul 2022 13:37:39 -0400 (EDT)
Date: Thu, 14 Jul 2022 13:37:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCH 1/3] ti-crypto-examples:
 Remove ti-crypto-examples
Message-ID: <20220714173739.GQ18692@denix.org>
References: <20220711164933.21445-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711164933.21445-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Jul 2022 17:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13952

This series looks good to me, thanks!


On Mon, Jul 11, 2022 at 11:49:31AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> These examples have not been updated in a long time and are arguably not
> correct anymore. Remove this.

