Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC903CA5FB1
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:46:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10894.1768927556912145581
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30A6C40CB4;
	Tue, 20 Jan 2026 16:45:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9aV9R6FK4wF; Tue, 20 Jan 2026 16:45:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F339A40A3D;
	Tue, 20 Jan 2026 16:45:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 58617177BAB; Tue, 20 Jan 2026 11:45:52 -0500 (EST)
Date: Tue, 20 Jan 2026 11:45:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: denys@konsulko.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 0/2] Clean up patches for open62541
Message-ID: <20260120164552.GW11121@denix.org>
References: <20260120152519.12538-1-a-christidis@ti.com>
 <20260120154224.GV11121@denix.org>
 <c6a5ad33-1859-4150-b494-b427ff4bb2cc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6a5ad33-1859-4150-b494-b427ff4bb2cc@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16992

On Tue, Jan 20, 2026 at 09:56:32AM -0600, Antonios Christidis wrote:
> Yeah just noticed that. This series might be redundant then.
> 
> Ryan's patch
> 0001-server_pubsub_publisher_rt_level-Add-missing-pthread.patch is
> status pending upstream, with no link and I cannot find his PR on
> the github repo.

Yeah, it is listed as "pending" for submission.

Since you submitted the same fix upstream already (with slightly different 
commit message, which is fine), it could be as easy as to send a follow up 
patch that simply updates Upstream-Status: tag from Pending to Submitted with 
your PR link.


> On 1/20/26 9:42 AM, Denys Dmytriyenko wrote:
> >On Tue, Jan 20, 2026 at 09:25:17AM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> >>From: Antonios Christidis <a-christidis@ti.com>
> >>
> >>Dear all,
> >>
> >>LTS migration related efforts to fix the recipe.
> >I think Ryan already made the same changes last week:
> >https://git.yoctoproject.org/meta-arago/commit/?h=master-next&id=bf47628886392400787668c9b203334ce00e2e4d
> >
> >
> >>Kind Regards,
> >>Antonios Christidis
> >>
> >>Antonios Christidis (2):
> >>   open62541: Remove deprecated examples patch
> >>   open62541: Add patch for implicit declaration error
> >>
> >>  .../open62541/open62541-arago.inc             |  2 +-
> >>  .../0001-examples-Remove-sys-io.h.patch       | 68 -------------------
> >>  ...plicit-declaration-of-pthread_create.patch | 30 ++++++++
> >>  3 files changed, 31 insertions(+), 69 deletions(-)
> >>  delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-Remove-sys-io.h.patch
> >>  create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-fix-pubsub-Implicit-declaration-of-pthread_create.patch
> >>
> >>-- 
> >>2.34.1

