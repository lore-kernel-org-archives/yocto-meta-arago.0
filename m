Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB88C53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 22:44:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5862.1672872282165756953
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 14:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A12040AC9;
	Wed,  4 Jan 2023 22:44:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqoCW96S5bSa; Wed,  4 Jan 2023 22:44:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5E2EF40027;
	Wed,  4 Jan 2023 22:44:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 746F31636B9; Wed,  4 Jan 2023 17:44:22 -0500 (EST)
Date: Wed, 4 Jan 2023 17:44:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] layer.conf: Update
 LAYERSERIES_COMPAT for mickledore
Message-ID: <20230104224422.GN22689@denix.org>
References: <20230104211711.10615-1-reatmon@ti.com>
 <20230104220048.GM22689@denix.org>
 <abba098c-8ecb-f1e0-fbac-b95d097d3f31@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abba098c-8ecb-f1e0-fbac-b95d097d3f31@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jan 2023 22:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14157

On Wed, Jan 04, 2023 at 04:15:48PM -0600, Ryan Eatmon wrote:
> 
> 
> On 1/4/2023 4:00 PM, Denys Dmytriyenko wrote:
> >On Wed, Jan 04, 2023 at 03:17:11PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>oe-core switched to mickedore [1]
> >>
> >>[1] https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  meta-arago-distro/conf/layer.conf | 2 +-
> >>  meta-arago-extras/conf/layer.conf | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> >>index 5de46fc9..1ffcd2fb 100644
> >>--- a/meta-arago-distro/conf/layer.conf
> >>+++ b/meta-arago-distro/conf/layer.conf
> >>@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
> >>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
> >>  BBFILE_PRIORITY_meta-arago-distro = "10"
> >>-LAYERSERIES_COMPAT_meta-arago-distro = "kirkstone langdale"
> >>+LAYERSERIES_COMPAT_meta-arago-distro = "mickledore"
> >
> >Do you want to keep existing compatibility around for a bit longer?
> 
> Is it worth keeping it around?  All of our testing is being done
> with master for everything.  How many people do you think are using
> an older version of bitbake with the latest master of
> meta-ti/meta-arago?  I would think they are likely pointing to
> latest of everything if they are doing anything.

You have to provide *some* branch that is compatible with langdale for people 
who has their products based on langdale release and wanting to use meta-ti 
and/or meta-arago. It could be master, or it could be a separately langdale 
branch, if you are willing to do that instead.

I see you already merged Khem's v1 patch to meta-ti, which means there's 
currently NO branches compatible with langdale! Even though TI does not 
officially test and support langdale, you should not actively prevent people 
from using it in their products with meta-ti, per the earlier message:
https://lists.yoctoproject.org/g/meta-ti/message/15137


> >>  LAYERDEPENDS_meta-arago-distro = " \
> >>      core \
> >>diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> >>index e2c8119f..9cdfcb32 100644
> >>--- a/meta-arago-extras/conf/layer.conf
> >>+++ b/meta-arago-extras/conf/layer.conf
> >>@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
> >>  BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
> >>  BBFILE_PRIORITY_meta-arago-extras = "10"
> >>-LAYERSERIES_COMPAT_meta-arago-extras = "kirkstone langdale"
> >>+LAYERSERIES_COMPAT_meta-arago-extras = "mickledore"
> >>  # Set a variable to get to the top of the metadata location
> >>  ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
> >>-- 
> >>2.17.1

