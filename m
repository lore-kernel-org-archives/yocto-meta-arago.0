Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789E5C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 23:52:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.49537.1656373950067252746
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 16:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 28BFE40C7F;
	Mon, 27 Jun 2022 23:52:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgqKZPwBQjFR; Mon, 27 Jun 2022 23:52:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0956240C5D;
	Mon, 27 Jun 2022 23:52:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BCCC7174981; Mon, 27 Jun 2022 19:52:26 -0400 (EDT)
Date: Mon, 27 Jun 2022 19:52:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: "Humphreys, Jonathan" <j-humphreys@ti.com>,
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove
 uEnv.txt for k3
Message-ID: <20220627235226.GO18692@denix.org>
References: <20220609170520.31162-1-afd@ti.com>
 <16989.1655137101944524297@lists.yoctoproject.org>
 <ae85101ccf564b72adcd54a83965af3a@ti.com>
 <e2701861-a955-dee9-3234-2ec160fecd8c@ti.com>
 <ab8c4f5585f144a680686130e65010bf@ti.com>
 <9da0eb07-d8c4-d3c5-572c-db4e57436de8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da0eb07-d8c4-d3c5-572c-db4e57436de8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Jun 2022 23:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13919

Jon,

This particular change is rather trivial, indeed.

Other changes are more involved due to override syntax change and meta-ti 
restructure. I am collecting recent changes in Dunfell and will do another 
sync with Kirkstone/master soon.

-- 
Denys


On Mon, Jun 27, 2022 at 11:07:17AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> Not this one, but there are a number of other patches in line before
> it that might be.
> 
> 
> On 6/27/2022 11:02, Humphreys, Jonathan wrote:
> >I don't think the layer changes will have any impact on it.
> >
> >+Denys
> >
> >
> >-----Original Message-----
> >From: Eatmon, Ryan <reatmon@ti.com>
> >Sent: Monday, June 27, 2022 11:00 AM
> >To: Humphreys, Jonathan <j-humphreys@ti.com>; meta-arago@lists.yoctoproject.org
> >Subject: Re: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove uEnv.txt for k3
> >
> >
> >It is not applied in master yet.  I have not had time to keep it in sync with dunfell given all of the layer changes.  I believe Denys will be doing another sync up soon.
> >
> >
> >
> >On 6/26/2022 15:18, Humphreys, Jonathan wrote:
> >>Ryan, I do not see this patch applied to master.  Can you check?
> >>
> >>Thanks
> >>Jon
> >>
> >>-----Original Message-----
> >>From: meta-arago@lists.yoctoproject.org
> >><meta-arago@lists.yoctoproject.org> On Behalf Of Jonathan Humphreys
> >>via lists.yoctoproject.org
> >>Sent: Monday, June 13, 2022 11:18 AM
> >>To: meta-arago@lists.yoctoproject.org
> >>Subject: Re: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv:
> >>remove uEnv.txt for k3
> >>
> >>On Thu, Jun  9, 2022 at 10:05 AM, Andrew Davis wrote:
> >>
> >>>
> >>>This fixup should have been done in u-boot and not in a uEnv.txt file.
> >>>It is not correct for all K3 anymore either. Remove it.
> >>>
> >>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>---
> >>>
> >>>Changes from v1:
> >>>   - Subject s/tiusdk-uenv/tisdk-uenv
> >>>
> >>>   .../tisdk-uenv/tisdk-uenv/k3/uEnv.txt         | 19 -------------------
> >>>   1 file changed, 19 deletions(-)
> >>>   delete mode 100644
> >>>meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> >>>
> >>>diff --git
> >>>a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> >>>b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> >>>deleted file mode 100644
> >>>index 80ea34f5..00000000
> >>>---
> >>>a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv/k3/uEnv.txt
> >>>+++ /dev/null
> >>>@@ -1,19 +0,0 @@
> >>>-# This uEnv.txt file can contain additional environment settings
> >>>that you -# want to set in U-Boot at boot time.  This can be simple
> >>>variables such -# as the serverip or custom variables.  The format of this file is:
> >>>-#    variable=value
> >>>-# NOTE: This file will be evaluated after the bootcmd is run and the
> >>>-#       bootcmd must be set to load this file if it exists (this is the
> >>>-#       default on all newer U-Boot images.  This also means that some
> >>>-#       variables such as bootdelay cannot be changed by this file since
> >>>-#       it is not evaluated until the bootcmd is run.
> >>>-
> >>
> >>Shouldn't we keep the above, as this is generic information about how to use uEnv.txt and when it is invoked?
> >>
> >>>-# The specific board is not able to be automatically detected. The
> >>>below is a -# workaround to set a sane default incase the user has
> >>>not manually configured -# a specific board.
> >>>-def_board_name="am65x"
> >>>-
> >>>-# Check if using default board_name when name_overlays is not set
> >>>-check_for_board=if test $name_overlays; then echo "Using board_name
> >>>= $board_name"; else setenv board_name $def_board_name; fi
> >>>-
> >>>-uenvcmd=run check_for_board; run findfdt
> >>>--
> >>>2.36.1

