Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0288C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 19:12:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4156.1685733135041934154
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 12:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BE75D40CA2;
	Fri,  2 Jun 2023 19:12:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uamY9OgTJp-m; Fri,  2 Jun 2023 19:12:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C7EA40C37;
	Fri,  2 Jun 2023 19:12:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 601FE16394A; Fri,  2 Jun 2023 15:11:23 -0400 (EDT)
Date: Fri, 2 Jun 2023 15:11:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] clacc: Fix TARGET name
Message-ID: <20230602191123.GP9226@denix.org>
References: <20230602182716.2344-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602182716.2344-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Jun 2023 19:12:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14492

On Fri, Jun 02, 2023 at 01:27:16PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The last update that fixed the syntax of changing _ to : was a little
> too aggressive and changed the TARGET values incorrectly.

Might want to drop this comment:

> Not sure why it took this long to see this pop up.

Because opencl was disabled since dunfell until this commit:
https://git.yoctoproject.org/meta-arago/commit/?id=1e2df30581aeb8c6f0e60bc0be788bc36f0f9d6a


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> index 4d78e7b7..f56d65cc 100644
> --- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> +++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
> @@ -9,9 +9,9 @@ RDEPENDS:${PN} += "clocl"
>  
>  S = "${WORKDIR}/git/host"
>  
> -TARGET:class-target = "clacc:arm"
> -TARGET:class-native = "clacc:x86"
> -TARGET:class-nativesdk = "clacc:x86"
> +TARGET:class-target = "clacc_arm"
> +TARGET:class-native = "clacc_x86"
> +TARGET:class-nativesdk = "clacc_x86"
>  
>  export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
>  export X86_HOST_ROOT = "${STAGING_DIR_HOST}"
> -- 
> 2.17.1

