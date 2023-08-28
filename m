Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40F7C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:32:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15407.1693233122255989592
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 915EC40CB0;
	Mon, 28 Aug 2023 14:32:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkcNDp2KMoT1; Mon, 28 Aug 2023 14:32:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67EB140C24;
	Mon, 28 Aug 2023 14:31:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 257D0163C75; Mon, 28 Aug 2023 10:31:59 -0400 (EDT)
Date: Mon, 28 Aug 2023 10:31:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCHv2 1/3]
 packagegroup-arago-bootstrap: fix RDEPENDS notation
Message-ID: <20230828143159.GK3359@denix.org>
References: <20230822224427.1880115-1-rs@ti.com>
 <20230822224427.1880115-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822224427.1880115-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:32:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14868

I believe this was already acked:

https://patchwork.yoctoproject.org/project/arago/patch/20230728002032.853330-2-rs@ti.com/


On Tue, Aug 22, 2023 at 05:38:29PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> The RDEPENDS for this packagegroup was still using the legacy format so
> it was being evaluated as a do-nothing group. Enable it.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-bootstrap.bb  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> index b0ec64b0..50f759be 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> @@ -47,6 +47,6 @@ UTILS:append:k3 = " \
>      k3conf \
>  "
>  
> -RDEPENDS_${PN} = "\
> +RDEPENDS:${PN} = "\
>      ${UTILS} \
>  "
> -- 
> 2.41.0

