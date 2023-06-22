Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C393EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:58:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15399.1687449490718086655
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 08:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E03440C37;
	Thu, 22 Jun 2023 15:58:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5Bo0k254Jmu; Thu, 22 Jun 2023 15:58:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD8B440BD4;
	Thu, 22 Jun 2023 15:58:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 94EEB163B34; Thu, 22 Jun 2023 11:58:05 -0400 (EDT)
Date: Thu, 22 Jun 2023 11:58:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, g-gupta@ti.com,
	praneeth@ti.com
Subject: Re: [master/kirkstone][PATCH v2 3/3] tisdk-default-image: Add
 package group for netopeer/sysrepo
Message-ID: <20230622155805.GO1518@denix.org>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
 <20230622103445.31114-4-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622103445.31114-4-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:58:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14680

On Thu, Jun 22, 2023 at 04:04:45PM +0530, Ravi Gunasekaran wrote:
> Add new package group for netopeer2, sysrepo, nw-configurator
> and yang models.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  .../recipes-core/images/tisdk-default-image.bb  |  1 +
>  .../packagegroup-arago-tisdk-sysrepo.bb         | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index bb825e09..7769c97c 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -28,6 +28,7 @@ IMAGE_INSTALL += "\
>      ti-analytics \
>      ti-demos \
>      ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
> +    packagegroup-arago-tisdk-sysrepo \
>  "
>  
>  export IMAGE_BASENAME = "tisdk-default-image"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> new file mode 100644
> index 00000000..14608dfe
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Netopeer2 and Sysrepo packagegroup"
> +LICENSE = "MIT"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

This packagegroup doesn't seem to be machine-specific, so no need for the 
above line.


> +inherit packagegroup
> +
> +ARAGO_NETOPEER_SYSREPO = "\
> +    sysrepo \
> +    netopeer2-server \
> +    nw-configurator \
> +    tsn-yang-models \
> +"
> +
> +RDEPENDS:${PN} = "\
> +    ${ARAGO_NETOPEER_SYSREPO} \
> +"
> -- 
> 2.17.1

