Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19E3C678D4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 22:56:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.430.1677711413062751267
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 14:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F27A940C46;
	Wed,  1 Mar 2023 22:56:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVS3iZz4XCo9; Wed,  1 Mar 2023 22:56:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5D2540C22;
	Wed,  1 Mar 2023 22:56:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8D684163799; Wed,  1 Mar 2023 17:56:20 -0500 (EST)
Date: Wed, 1 Mar 2023 17:56:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: dannenberg@ti.com
Cc: meta-arago@lists.yoctoproject.org, denys@konsulko.com, afd@ti.com,
	reatmon@ti.com
Subject: Re: [meta-arago][kirkstone/master] ti-rtos-firmware: use
 nonarch_base_libdir for firmware installations
Message-ID: <20230301225620.GR22689@denix.org>
References: <20230301225047.15898-1-dannenberg@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301225047.15898-1-dannenberg@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Mar 2023 22:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14245

On Wed, Mar 01, 2023 at 04:50:47PM -0600, Andreas Dannenberg via lists.yoctoproject.org wrote:
> It was previously established that we should only use nonarch_base_libdir
> for firmware installations, see
> 
> fa8035fc263 ("meta-ti: use nonarch_base_libdir for firmware installations")
> 
> However there have been some regressions on this endeavour with some
> additional changes that were since committed to ti-rtos-firmware. Go ahead
> and fix those to prevent this from biting us later, for example during
> multilib builds.

1. wrong list

2. see this:
https://patchwork.yoctoproject.org/project/ti/patch/20230215193355.9676-15-afd@ti.com/

It is now in WIP branches going through the testing.


> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
> 
> I see there are other instances of ${base_libdir} being used probably
> incorrectly such as in...
> 
> meta-ti-extras/recipes-ti/beagleboard/beaglebone-capes.bb
> meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb

Those are severely outdated and probably should be removed instead...


BTW, Ryan, I see you didn't pick up these patches from the Patchwork for some 
reason.


> ...related to systemd but since I'm not 100% sure about those and can't
> test those changes at the moment I'm not including them here.

-- 
Denys

