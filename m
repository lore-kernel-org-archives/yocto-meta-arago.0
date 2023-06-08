Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014DCC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:32:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1957.1686249171096362868
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0034F40C86;
	Thu,  8 Jun 2023 18:32:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmAtgre50sQM; Thu,  8 Jun 2023 18:32:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5D9B40C16;
	Thu,  8 Jun 2023 18:32:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E8F516396E; Thu,  8 Jun 2023 14:31:58 -0400 (EDT)
Date: Thu, 8 Jun 2023 14:31:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, nm@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [oe-layersetup][PATCH 00/15] Sacrifice your first
 born to the linter
Message-ID: <20230608183157.GB9226@denix.org>
References: <20230607200504.3810426-1-rs@ti.com>
 <20230608174829.GA9226@denix.org>
 <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14547

On Thu, Jun 08, 2023 at 01:13:32PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> On 6/8/23 12:48, Denys Dmytriyenko wrote:
> >Do you need to correct From: and SoB: lines in all the patches?
> 
> I don't know, do I? I did this work at home at 5AM with my personal
> machine, hence my personal account being the author, signer, and
> sender. If you need me to change it I can.

For the most part I don't care, was just checking it wasn't an oversight.


> >On Wed, Jun 07, 2023 at 03:04:49PM -0500, rs@ti.com wrote:
> >>From: Randolph Sapp <rs@ti.com>
> >>
> >>Last night someone in the beagle community reported some cryptic errors from
> >>oe-layersetup so I took the time to address all of the issues reported
> >>by Shellcheck and add some extra sanity checks.
> >>
> >>I tried to split it into reasonable segments.
> >>
> >>StaticRocket (15):
> >>   oe-layertool-setup: prefer use of $() notation
> >>   oe-layertool-setup: replace all x comparisons with -n/-z
> >>   oe-layertool-setup: fix all the printf calls
> >>   oe-layertool-setup: fix all quoting, switch eval to export
> >>   oe-layertool-setup: only invoke read with -r
> >>   oe-layertool-setup: check exit code directly
> >>   oe-layertool-setup: guard all cd calls
> >>   oe-layertool-setup: eliminate useless cat
> >>   oe-layertool-setup: use subshell execution with redirect
> >>   oe-layertool-setup: guard against invalid expression in case
> >>   oe-layertool-setup: replace all calls to echo with printf
> >>   oe-layertool-setup: drop unused variable
> >>   oe-layertool-setup: add a path sanity check for oebase
> >>   oe-layertool-setup: fix multi-line printfs
> >>   oe-layertool-setup: add sanity check for layer names
> >>
> >>  oe-layertool-setup.sh | 435 +++++++++++++++++++++---------------------
> >>  1 file changed, 220 insertions(+), 215 deletions(-)
> >>
> >>-- 
> >>2.40.1

