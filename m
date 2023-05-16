Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72945C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:24:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.26493.1684254253641552375
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E2C2C40C2B;
	Tue, 16 May 2023 16:24:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfFJRpKYZDLS; Tue, 16 May 2023 16:24:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AFD06409B0;
	Tue, 16 May 2023 16:24:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 199E81638CB; Tue, 16 May 2023 12:23:26 -0400 (EDT)
Date: Tue, 16 May 2023 12:23:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] ltp-ddt: Intial LTS
 migration version
Message-ID: <20230516162326.GM9226@denix.org>
References: <20230516143156.1961-1-reatmon@ti.com>
 <20230516160251.GL9226@denix.org>
 <93027b9f-da82-550c-1672-020772a701e9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93027b9f-da82-550c-1672-020772a701e9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:24:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14404

On Tue, May 16, 2023 at 11:19:29AM -0500, Ryan Eatmon wrote:
> 
> 
> On 5/16/2023 11:02 AM, Denys Dmytriyenko wrote:
> >1. There's no 20231017 version of ltp-ddt in meta-arago:
> >
> >https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-devtools/ltp-ddt
> 
> There is on wip/next which after a forced CICD is about to make it
> visiable to kirkstone.
> 
> All of these patches build on previous patches that are "Under
> Review" on the next branches.
> 
> I'm just sending out the patches so that as soon as CICD promotes it
> all I can get the patches applied to master as well.

Right. I wonder if those need to be re-sent again, since it's been a long time 
they came across. Or maybe post links here to corresponding base commits on 
wip branch for a refresher?


> >2. ltp-ddt is based on upstream ltp - while OE-Core/master has version
> >20231017 of ltp, kirkstone has an older 20220121 version:
> >
> >https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp
> >
> >So you'd need to overlay ltp 20231017 here:
> >
> >https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-extended/ltp
> >
> >3. Once the upgrade is done, you can remove the old overlayed 20200120 and
> >20210524 versions of ltp
> >
> >
> >On Tue, May 16, 2023 at 09:31:55AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>From: LCPD Automation Script <lcpdbld@list.ti.com>
> >>
> >>As part of the initial LTS migration, move to the latest commits for the
> >>various repos.
> >>  - ltp-ddt_20230127
> >>
> >>Going forward all updates will come from the CICD flow.
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> >>index d56c5b7b..c14ddba7 100644
> >>--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> >>+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> >>@@ -14,7 +14,7 @@ PE = "1"
> >>  PR = "r7"
> >>  PV:append = "+git${SRCPV}"
> >>-SRCREV = "7f2fc4b7c972f2f188836c739a7175fad2f2b288"
> >>+SRCREV = "41e97da730b9064d9fc5337afb515a8b6f752099"
> >>  BRANCH ?= "master"
> >>  SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
> >>-- 
> >>2.17.1

