Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D429AC7618E
	for <webhook@archiver.kernel.org>; Sun, 23 Apr 2023 00:09:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19248.1682208556679337863
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 17:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8EEF2408CD;
	Sun, 23 Apr 2023 00:09:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A5JMFzABb-f; Sun, 23 Apr 2023 00:09:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C9C640301;
	Sun, 23 Apr 2023 00:09:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32F1516383C; Sat, 22 Apr 2023 20:08:32 -0400 (EDT)
Date: Sat, 22 Apr 2023 20:08:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v3 0/2] Add support for
 ltp-ddt_20230127
Message-ID: <20230423000832.GF9226@denix.org>
References: <20230422225555.12772-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422225555.12772-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 23 Apr 2023 00:09:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14340

I'm a bit confused - I see the original patch is already merged to kirkstone 
and master:

https://git.yoctoproject.org/meta-arago/log/
https://git.yoctoproject.org/meta-arago/log/?h=kirkstone


On Sat, Apr 22, 2023 at 05:55:53PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The internal testing team would like to move to this version as the
> basis for our internal ltp-ddt.  So we need to capture the recipe
> settings for this version from oe-core master and provide a new version
> for us to overload.
> 
> v3: Put the space in the correct place...
> v2: Add missing space to :append line in ltp-ddt_20230127.bb
> 
> Ryan Eatmon (2):
>   ltp: Add version 20230127 from oe_core master
>   ltp-ddt: Add support for version 20230127
> 
>  .../ltp-ddt/ltp-ddt_20230127.bb               |  47 ++++++
>  ...002-Remove-OOM-tests-from-runtest-mm.patch |  35 +++++
>  .../ltp/ltp/disable_hanging_tests.patch       |  27 ++++
>  .../recipes-extended/ltp/ltp_20230127.bb      | 140 ++++++++++++++++++
>  4 files changed, 249 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
>  create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
>  create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
>  create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb
> 
> -- 
> 2.17.1

