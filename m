Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6532C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:07:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6690.1788210448636562101
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA14E40C3E;
	Mon, 31 Aug 2026 21:07:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j917TQ5pXsSV; Mon, 31 Aug 2026 21:07:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B058940B13;
	Mon, 31 Aug 2026 21:07:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 597CE17C887; Mon, 31 Aug 2026 17:07:25 -0400 (EDT)
Date: Mon, 31 Aug 2026 17:07:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	"Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: Re: [meta-arago] [master][PATCH] open62541: update bbappend for
 new version
Message-ID: <20260831210725.GP19759@denix.org>
References: <20260831210210.1908432-1-denis@denix.org>
 <503db6fe-43a7-457b-9d22-199cc94d329a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <503db6fe-43a7-457b-9d22-199cc94d329a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:07:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17632

On Mon, Aug 31, 2026 at 04:02:58PM -0500, Ryan Eatmon wrote:
> 
> Beat ya!

Heh, yeah - my outdated build machine takes several hours to build master now 
in order to validate the fix...


> On 8/31/2026 4:02 PM, Denys Dmytriyenko wrote:
> >From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
> >
> >meta-openembedded has bumped the version recently [1], update our
> >bbappend accordingly.
> >
> >[1] https://git.openembedded.org/meta-openembedded/commit/?id=b6c09f6630d5e88a993252cb7e5ee23aec9fd569
> >
> >Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> >---
> >  .../{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend}        | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.6.bbappend => open62541_1.5.7.bbappend} (100%)
> >
> >diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
> >similarity index 100%
> >rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend
> >rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend

