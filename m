Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65D7CD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 12:47:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22965.1779022071830783275
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 17 May 2026 05:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE35F40C3A;
	Sun, 17 May 2026 12:47:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JBXw2Kca7OO; Sun, 17 May 2026 12:47:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 922D940BA9;
	Sun, 17 May 2026 12:47:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C919F17DB9B; Sun, 17 May 2026 08:47:44 -0400 (EDT)
Date: Sun, 17 May 2026 08:47:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, detheridge@ti.com,
	b-brnich@ti.com, a-christidis@ti.com
Subject: Re: [meta-arago][master][PATCH] open62541: Update upstream-status
 of pthread patch
Message-ID: <20260517124744.GE7941@denix.org>
References: <20260517034702.1309037-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517034702.1309037-1-t-lannynd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 17 May 2026 12:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17525

On Sat, May 16, 2026 at 10:47:02PM -0500, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Update Upstream-Status from Submitted to Backport because it
> got merged upstream.

I guess next step for you would be to upstream these 2 now backported patches 
to meta-openembedded and get rid of this bbappend in meta-arago? :)

You'd need to use the openembedded-devel mailing list to send patches to:
https://lists.openembedded.org/g/openembedded-devel


> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>  ...2-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch
> index 57e6ee8d..66610546 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch
> @@ -7,7 +7,7 @@ Subject: [PATCH] examples: pubsub: fix missing pthread.h include in RT
>  Include header file, to fix error of implicit declaration of
>  pthread_create.
>  
> -Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/8044]
> +Upstream-Status: Backport [12f122e16a6a76dbff0022f64a615a5ba459e71e]
>  
>  Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
>  ---
> -- 
> 2.34.1

