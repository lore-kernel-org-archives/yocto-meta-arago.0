Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB57CC41513
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 03:04:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5453.1691204647416610777
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Aug 2023 20:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCDDC40A20;
	Sat,  5 Aug 2023 03:04:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVJ4Qi7OlBsm; Sat,  5 Aug 2023 03:04:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8335040C88;
	Sat,  5 Aug 2023 03:04:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9DF33163C1B; Mon, 31 Jul 2023 16:10:01 -0400 (EDT)
Date: Mon, 31 Jul 2023 16:10:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, nm@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][kirkstone/master][PATCH 1/5]
 packagegroup-arago-bootstrap: fix RDEPENDS notation
Message-ID: <20230731201001.GA3359@denix.org>
References: <20230728002032.853330-1-rs@ti.com>
 <20230728002032.853330-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728002032.853330-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 05 Aug 2023 03:04:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14824

On Thu, Jul 27, 2023 at 07:20:28PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> The RDEPENDS for this packagegroup was still using the legacy format so
> it was being evaluated as a do-nothing group. Enable it.

Good catch!


> Signed-off-by: Randolph Sapp <rs@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


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

