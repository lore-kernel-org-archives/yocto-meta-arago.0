Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F990C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 02:10:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2663.1666750208217970101
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 19:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3BA6B40CB3;
	Wed, 26 Oct 2022 02:10:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlSUcf7iZA5W; Wed, 26 Oct 2022 02:10:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1295640CA5;
	Wed, 26 Oct 2022 02:10:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 64E21174A3C; Tue, 25 Oct 2022 22:10:01 -0400 (EDT)
Date: Tue, 25 Oct 2022 22:10:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 0/6] Deprecated recipe
 removals
Message-ID: <20221026021001.GZ22689@denix.org>
References: <20221011175320.26843-1-afd@ti.com>
 <20221011192215.GB22689@denix.org>
 <9226da23-7ef8-32e3-ac97-8ff6b30b40ff@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9226da23-7ef8-32e3-ac97-8ff6b30b40ff@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Oct 2022 02:10:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14091

On Mon, Oct 24, 2022 at 02:08:28PM -0500, Andrew Davis wrote:
> On 10/11/22 2:22 PM, Denys Dmytriyenko wrote:
> >On Tue, Oct 11, 2022 at 12:53:14PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>Hello all,
> >>
> >>Same series as last time, just removed that last patch
> >>(meta-arago: Use new J7 SoC names over specific board names)
> >>as it will be expanded into a new series.
> >
> >LGTM, thanks!
> >
> >
> 
> 
> Ryan,
> 
> Ping? This series will merge-conflict with Denys' patch removing
> the makefiles, so this needs to go in first.

Yeah, there will be a conflict either way. I'm currently queueing up patches 
to master/kirkstone along with the final syncup from dunfell. I'll try to get 
to the list shortly.

-- 
Denys

