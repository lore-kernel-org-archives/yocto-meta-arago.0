Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC70C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 19:55:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14478.1647633326364988570
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 12:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5D53C40C62;
	Fri, 18 Mar 2022 19:55:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikfMcx9IqjTZ; Fri, 18 Mar 2022 19:55:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4486A406B5;
	Fri, 18 Mar 2022 19:55:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0C2061747D2; Fri, 18 Mar 2022 15:55:23 -0400 (EDT)
Date: Fri, 18 Mar 2022 15:55:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Nishanth Menon <nm@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [oe-layersetup PATCH] configs: Switch github repos from git to
 https
Message-ID: <20220318195523.GD23554@denix.org>
References: <20220318172714.17656-1-nm@ti.com>
 <0ef8a8f1-cfd3-7e60-8922-fd271ae255b0@ti.com>
 <20220318174817.uosngm5oo2ppbyau@quotable>
 <2beb24fb-4c96-ffc6-4497-2283dd7066b6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2beb24fb-4c96-ffc6-4497-2283dd7066b6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 19:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13675

On Fri, Mar 18, 2022 at 02:26:15PM -0500, Ryan Eatmon wrote:
> 
> I have applied this patch, but I think we need to consider editing
> the other configs.

The only remaining configs are for past SDK releases - those are pinned down 
and not rolling, unlike those updated by Nishanth. Many of those releases are 
out of support already... I'd say, owners of corresponding SDKs should take 
care of updating still-supported release configs.

E.g. configs/coresdk/coresdk-08.xx.xx.xx-config.txt ... wink wink :)


> On 3/18/2022 12:48, Nishanth Menon wrote:
> >On 12:37-20220318, Ryan Eatmon wrote:
> >>
> >>What about all of the other configs?
> >
> >Did'nt want to touch the baseline configs. I am assuming folks will
> >probably need to do the following in ~/.gitconfig
> >
> >[url "https://github.com"]
> >         insteadOf = git://github.com
> >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

