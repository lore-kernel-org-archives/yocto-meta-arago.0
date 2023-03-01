Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA70BC64EC4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 00:15:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.10020.1677629748768659189
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 16:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 061B440C2C;
	Wed,  1 Mar 2023 00:15:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGLY8uizNcjy; Wed,  1 Mar 2023 00:15:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF08640C13;
	Wed,  1 Mar 2023 00:15:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3C973163766; Tue, 28 Feb 2023 19:15:19 -0500 (EST)
Date: Tue, 28 Feb 2023 19:15:19 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [master/kirkstone][PATCH 2/2] weston: drop patch
 reverting GL_EXT_unpack_subimage requirement
Message-ID: <20230301001519.GO22689@denix.org>
References: <20230224101240.4132411-1-denis@denix.org>
 <20230224101240.4132411-2-denis@denix.org>
 <a328ae4f-51af-000d-17d8-8e2889462ee2@ti.com>
 <20230228232943.GM22689@denix.org>
 <654a4a43-ece4-feb2-85ac-b0ce5cf38211@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <654a4a43-ece4-feb2-85ac-b0ce5cf38211@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Mar 2023 00:15:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14239

On Tue, Feb 28, 2023 at 05:57:40PM -0600, Andrew Davis wrote:
> On 2/28/23 5:29 PM, Denys Dmytriyenko wrote:
> >On Fri, Feb 24, 2023 at 08:16:25AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>On 2/24/23 4:12 AM, Denys Dmytriyenko wrote:
> >>>From: Denys Dmytriyenko <denys@konsulko.com>
> >>>
> >>>With the updated graphics recipes in meta-ti this hack is no longer needed.
> >>
> >>Did you test that? What board and with what program?
> >
> >If I remember correctly, there was a build failure in the past with newer
> >Weston complaining that the extenstion does not exist in the old binary DDK.
> >Since I haven't seen this failure with the updated Mesa-based graphics stack,
> >I assumed that is now resolved.
> >
> >My testing was mostly with Rogue and I see in the commit log that this is
> >specific to SGX, which currently builds full software-rendering stack w/o any
> >HW acceleration.
> >
> >Is this extension a pure software implementation in Mesa or does it require
> >corresponding HW support? If the latter, then we definitely still need this
> >revert and my patch removing it can be dropped.
> >
> 
> Unfortunately it needs to be handled in the GPU driver on the UM side, so
> not something Mesa can fix for us. And the error only shows up as a runtime
> issue when you try to start Weston and it sees the extension is not available.
> 
> We will need to keep this patch until someone can add the software emulation
> of this function inside the SGX UM driver. It is on my todo list for someday..

Andrew,

Thanks for confirming.

Ryan,

We still need Andrew's revert, please drop my patch from the queue. Thanks.

-- 
Denys

