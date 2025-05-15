Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CCCC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 22:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.595.1747349448877077903
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 May 2025 15:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B51640800;
	Thu, 15 May 2025 22:50:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zvur5DOt4-mL; Thu, 15 May 2025 22:50:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5587407E5;
	Thu, 15 May 2025 22:50:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3B471168391; Thu, 15 May 2025 18:50:44 -0400 (EDT)
Date: Thu, 15 May 2025 18:50:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add
 optee-test, strongswan, and libgpiod-tools to image
Message-ID: <20250515225044.GV18383@denix.org>
References: <20250501144357.355212-1-afd@ti.com>
 <20250513172057.GR18383@denix.org>
 <4eac99a3-2e4a-4f5b-a70b-03cf66f820f9@ti.com>
 <20250515200832.GU18383@denix.org>
 <689f0997-8ed3-43c3-93f4-1936878094c9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <689f0997-8ed3-43c3-93f4-1936878094c9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 May 2025 22:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16201

On Thu, May 15, 2025 at 04:53:11PM -0500, Andrew Davis wrote:
> On 5/15/25 3:08 PM, Denys Dmytriyenko wrote:
> >On Thu, May 15, 2025 at 02:29:15PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>On 5/13/25 12:20 PM, Denys Dmytriyenko wrote:
> >>>On Thu, May 01, 2025 at 09:43:57AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>>>These packages are used by ltp-ddt and the test framework. These are
> >>>>added to the default Arago images, but when doing upstream testing with
> >>>>Poky these packages are missing. Add these to the base testing layer.
> >>>>
> >>>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>---
> >>>>  meta-arago-test/recipes-core/packagegroups/ti-test.bb        | 2 ++
> >>>>  meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 1 +
> >>>>  2 files changed, 3 insertions(+)
> >>>>
> >>>>diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>>index c8eaf266..e387b978 100644
> >>>>--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>>+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>>>@@ -41,6 +41,7 @@ TI_TEST_BASE = "\
> >>>>      nbench-byte \
> >>>>      netperf \
> >>>>      openntpd \
> >>>>+    optee-test \
> >>>
> >>>Should this be conditional on whether OPTEE is used for the platform?
> >>>Like it is done here:
> >>>https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb#n58
> >>>
> >>
> >>Good catch, this does need to be conditional or AM335x (the only plat we
> >>have without OP-TEE) will break, will update and resend.
> >
> >The other legacy platform that doesn't use OPTEE is OMAP-L138.
> >
> >Also, if you recall, only HS variants of AM437x and AM57x use OP-TEE, not GP.
> >
> 
> Sure but these still have valid platform targets in OP-TEE, so the building
> the optee-test package should still work; there are no target names for AM335
> (and L138) so they would cause an issue when building the OP-TEE dependency.

Those GP platforms don't set any valid OP-TEE targets, so the build will still 
fail.


> Side thought, I wonder if having an "optee" MACHINE_FEATURE would be a better
> solution than checking OPTEEOUTPUTMACHINE as done in packagegroup-arago-base.bb
> (which shouldn't that be OPTEEMACHINE?)

Ah, indeed:
https://git.yoctoproject.org/meta-ti/commit/?id=0942b58dab47920f6d5661017720f3e5589389d4

Though OPTEEMACHINE is either "ti-am57xx" or "ti-dra7xx" or "ti-am43xx" for 
legacy platforms and "k3-*" for K3 platforms (though all K3 use OPTEE).

Can probably simply check if OPTEEMACHINE is defined and not empty...


> Andrew
> 
> >
> >>Thanks,
> >>Andrew
> >>
> >>>
> >>>>      pcitest \
> >>>>      perf \
> >>>>      powertop \
> >>>>@@ -53,6 +54,7 @@ TI_TEST_BASE = "\
> >>>>      stream \
> >>>>      stress \
> >>>>      stress-ng \
> >>>>+    strongswan \
> >>>>      tcpdump \
> >>>>      v4l-utils \
> >>>>      yavta \
> >>>>diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> >>>>index 1950ffe9..2c65e851 100644
> >>>>--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> >>>>+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
> >>>>@@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
> >>>>      pm-qa \
> >>>>      serialcheck \
> >>>>      memtester \
> >>>>+    libgpiod-tools \
> >>>>  "
> >>>>  do_install:prepend() {
> >>>>-- 
> >>>>2.39.2

