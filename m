Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABEAC76195
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 19:30:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.53620.1679513395263558939
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 12:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B3A440C5D;
	Wed, 22 Mar 2023 19:29:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GCKLOh1Bsx8; Wed, 22 Mar 2023 19:29:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0E74540C06;
	Wed, 22 Mar 2023 19:29:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 915531637D6; Wed, 22 Mar 2023 15:29:19 -0400 (EDT)
Date: Wed, 22 Mar 2023 15:29:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [kirkstone/master][PATCH 1/4] irqbalance: Move to
 the latest tip v1.9.2+
Message-ID: <20230322192919.GM18050@denix.org>
References: <20230321190428.2818600-1-denis@denix.org>
 <09bcf9cf-eb0f-24c0-ddbb-b1c5dcc58e56@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09bcf9cf-eb0f-24c0-ddbb-b1c5dcc58e56@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Mar 2023 19:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14273

On Wed, Mar 22, 2023 at 01:20:17PM -0500, Andrew Davis wrote:
> On 3/21/23 2:04 PM, Denys Dmytriyenko wrote:
> >From: Vignesh Raghavendra <vigneshr@ti.com>
> >
> >This fixes timeouts seen on daemon stop during reboot
> >Switches to using irqbalance provide irqbalance.service instead of
> >custom one
> >Fixes some IRQs not being classified and thus not balanced.
> >
> >Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  .../recipes-extended/irqbalance/irqbalance_git.bbappend   | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> >new file mode 100644
> >index 00000000..3ba30b5d
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
> >@@ -0,0 +1,8 @@
> >+SRCREV = "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
> >+PV = "1.9.2"
> >+
> >+do_install_append () {
> 
> Old override syntax here and below.

Grrr, right, I got sloppy here...

-- 
Denys

