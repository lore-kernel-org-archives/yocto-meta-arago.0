Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6AAEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 17:08:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22627.1687972083443932678
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 10:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46DEF40A20;
	Wed, 28 Jun 2023 17:08:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1xGe01Ca3nM; Wed, 28 Jun 2023 17:08:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 00BF9408CD;
	Wed, 28 Jun 2023 17:07:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1403E163B7B; Wed, 28 Jun 2023 13:07:56 -0400 (EDT)
Date: Wed, 28 Jun 2023 13:07:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, g-gupta@ti.com,
	praneeth@ti.com, afd@ti.com
Subject: Re: [master/kirkstone][PATCH v4 1/8] meta-arago-extras: sysrepo:
 Update checksum for nw-configurator
Message-ID: <20230628170756.GU1518@denix.org>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-2-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627144249.30543-2-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 17:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14728

On Tue, Jun 27, 2023 at 08:12:42PM +0530, Ravi Gunasekaran wrote:
> Instead of using the source file to compute the license checksum,
> use the license text only from source file.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> 
> Changes since v3:
> ----------------
> No change
> 
> Changes since v2:
> ----------------
> 1) Corrected the license type
> 2) License checksum calculated based on the license header instead of the 
> entire source file
> 
> Changes since v1:
> ---------------
> No change
> 
>  .../recipes-sysrepo/nw-configurator/nw-configurator.bb       | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> index 5a152017..c5d9a86b 100644
> --- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> +++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> @@ -1,6 +1,7 @@
> -LICENSE="GPLv2"
>  DESCRIPTION = "Sysrepo based repo to configure EST"
> -LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf9bfb8372347877ad393660fa"

Thanks, this is a move in the right direction!

However, you also changed the LICENSE identifier w/o explaining the reason in 
the commit message! This is rather critical... I checked the nw-configurator.c 
and indeed GPLv2 was totally wrong, but you have to explain the change anyway. 
Going forward there will be a new requirement for Yocto compliance to properly 
explain license changes like that and there's a new field "License-Update:"
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Describing_license_changes


>  SRC_URI = "file://nw-configurator.c"

