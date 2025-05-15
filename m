Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE7FC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 20:08:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1042.1747339717641847917
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 May 2025 13:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 39B0140C16;
	Thu, 15 May 2025 20:08:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKSUvDW4OWK7; Thu, 15 May 2025 20:08:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 05EC440BA7;
	Thu, 15 May 2025 20:08:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 63059168357; Thu, 15 May 2025 16:08:32 -0400 (EDT)
Date: Thu, 15 May 2025 16:08:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add
 optee-test, strongswan, and libgpiod-tools to image
Message-ID: <20250515200832.GU18383@denix.org>
References: <20250501144357.355212-1-afd@ti.com>
 <20250513172057.GR18383@denix.org>
 <4eac99a3-2e4a-4f5b-a70b-03cf66f820f9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eac99a3-2e4a-4f5b-a70b-03cf66f820f9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 May 2025 20:08:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16199

On Thu, May 15, 2025 at 02:29:15PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 5/13/25 12:20 PM, Denys Dmytriyenko wrote:
> >On Thu, May 01, 2025 at 09:43:57AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>These packages are used by ltp-ddt and the test framework. These are
> >>added to the default Arago images, but when doing upstream testing with
> >>Poky these packages are missing. Add these to the base testing layer.
> >>
> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>  meta-arago-test/recipes-core/packagegroups/ti-test.bb        | 2 ++
> >>  meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 1 +
> >>  2 files changed, 3 insertions(+)
> >>
> >>diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>index c8eaf266..e387b978 100644
> >>--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>@@ -41,6 +41,7 @@ TI_TEST_BASE = "\
> >>      nbench-byte \
> >>      netperf \
> >>      openntpd \
> >>+    optee-test \
> >
> >Should this be conditional on whether OPTEE is used for the platform?
> >Like it is done here:
> >https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb#n58
> >
> 
> Good catch, this does need to be conditional or AM335x (the only plat we 
> have without OP-TEE) will break, will update and resend.

The other legacy platform that doesn't use OPTEE is OMAP-L138.

Also, if you recall, only HS variants of AM437x and AM57x use OP-TEE, not GP.


> Thanks,
> Andrew
> 
> >
> >>      pcitest \
> >>      perf \
> >>      powertop \
> >>@@ -53,6 +54,7 @@ TI_TEST_BASE = "\
> >>      stream \
> >>      stress \
> >>      stress-ng \
> >>+    strongswan \
> >>      tcpdump \
> >>      v4l-utils \
> >>      yavta \
> >>diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> >>index 1950ffe9..2c65e851 100644
> >>--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> >>+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> >>@@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
> >>      pm-qa \
> >>      serialcheck \
> >>      memtester \
> >>+    libgpiod-tools \
> >>  "
> >>  do_install:prepend() {
> >>-- 
> >>2.39.2

