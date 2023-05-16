Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AAFC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:03:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.25981.1684253019158760065
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 66D1240C2B;
	Tue, 16 May 2023 16:03:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cENCmCxpG8I; Tue, 16 May 2023 16:03:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3150240A77;
	Tue, 16 May 2023 16:03:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8BED01638CA; Tue, 16 May 2023 12:02:51 -0400 (EDT)
Date: Tue, 16 May 2023 12:02:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] ltp-ddt: Intial LTS
 migration version
Message-ID: <20230516160251.GL9226@denix.org>
References: <20230516143156.1961-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516143156.1961-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14402

1. There's no 20231017 version of ltp-ddt in meta-arago:

https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-devtools/ltp-ddt

2. ltp-ddt is based on upstream ltp - while OE-Core/master has version 
20231017 of ltp, kirkstone has an older 20220121 version:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp

So you'd need to overlay ltp 20231017 here:

https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-extended/ltp

3. Once the upgrade is done, you can remove the old overlayed 20200120 and 
20210524 versions of ltp


On Tue, May 16, 2023 at 09:31:55AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: LCPD Automation Script <lcpdbld@list.ti.com>
> 
> As part of the initial LTS migration, move to the latest commits for the
> various repos.
>  - ltp-ddt_20230127
> 
> Going forward all updates will come from the CICD flow.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> index d56c5b7b..c14ddba7 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> @@ -14,7 +14,7 @@ PE = "1"
>  PR = "r7"
>  PV:append = "+git${SRCPV}"
>  
> -SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
> +SRCREV = "41e97da730b9064d9fc5337afb515a8b6f752099"
>  BRANCH ?= "master"
>  
>  SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
> -- 
> 2.17.1

