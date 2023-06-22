Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49328EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:56:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.15310.1687449397889215450
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 08:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 94C3E40C52;
	Thu, 22 Jun 2023 15:56:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ygm3PQ0Fq-sF; Thu, 22 Jun 2023 15:56:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 593E740BD4;
	Thu, 22 Jun 2023 15:56:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 70287163B34; Thu, 22 Jun 2023 11:56:31 -0400 (EDT)
Date: Thu, 22 Jun 2023 11:56:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, g-gupta@ti.com,
	praneeth@ti.com
Subject: Re: [master/kirkstone][PATCH v2 1/3] meta-arago-extras: sysrepo:
 Update checksum for nw-configurator
Message-ID: <20230622155631.GN1518@denix.org>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
 <20230622103445.31114-2-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622103445.31114-2-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:56:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14679

On Thu, Jun 22, 2023 at 04:04:43PM +0530, Ravi Gunasekaran wrote:
> Update the checksum values for nw-configurator

Why?

It is always "why?" question you should answer in the commit log. Everyone 
can see in the patch itself "what?" you are changing - license checksum - 
and "where?" you are changing it - in nw-configurator.

Moreover, any license change when the checksum differs should be explicitly 
explained to track any re-licensing due to legal reasons.


> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  .../recipes-sysrepo/nw-configurator/nw-configurator.bb          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> index 5a152017..b8a93f1c 100644
> --- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> +++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> @@ -1,6 +1,6 @@
>  LICENSE="GPLv2"
>  DESCRIPTION = "Sysrepo based repo to configure EST"
> -LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
> +LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=f2ec672593c3707bb4fe68307dbf0506"

Since you are using a source file for license checksum, you might want to 
limit it to the license text only, so code changes won't affect the checksum. 
Use beginline=x and endline=y, e.g.:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb#n4


>  SRC_URI = "file://nw-configurator.c"
>  
> -- 
> 2.17.1

