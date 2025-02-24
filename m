Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CB1C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 16:45:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.94411.1740415499358313160
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 08:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 96FA0407E5;
	Mon, 24 Feb 2025 16:44:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFIbyPLlKhCe; Mon, 24 Feb 2025 16:44:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5D699407DA;
	Mon, 24 Feb 2025 16:44:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BCDCB164299; Mon, 24 Feb 2025 11:44:53 -0500 (EST)
Date: Mon, 24 Feb 2025 11:44:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: jcormier@criticallink.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH v2] templates: Fix
 paths for DL_DIR and SSTATE_DIR
Message-ID: <20250224164453.GF1879@denix.org>
References: <20250221163150.3367-1-reatmon@ti.com>
 <CADL8D3aHkzaCiQQUaSA+L6OkxH=_RkzW07FTs_Yv0gMM7XdR+w@mail.gmail.com>
 <CADL8D3Z6CCEQxFPpTwgnGBwrVOgUTyeS_3NTrZw6r9Q38WPHkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADL8D3Z6CCEQxFPpTwgnGBwrVOgUTyeS_3NTrZw6r9Q38WPHkA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Feb 2025 16:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15905

On Mon, Feb 24, 2025 at 09:53:30AM -0500, Jon Cormier via lists.yoctoproject.org wrote:
> Ryan, I also had a question about the bitbake-setup configs.  Is there some
> documentation on this setup tool?  Googling this is tricky since the name
> is so generic. The other tools docs pop right up in google.

bitbake-setup is currently being developed by the upstream Yocto Project and 
is now still in flux. The approach is staged, where some pieces already exist 
in the master branches of bitbake and openembedded-core, while others are 
still "work in progress" and under review, so will be merged when ready. The 
final goal is to have it all ready by the next LTS release. Obviously, there's 
very little documentation right now. If you want to learn more, you can follow 
the corresponding discussions on the bitbake, openembedded-core and of course, 
the openembedded-architecture mailing lists.

Regards,
Denys

