Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF8BC04FF9
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 15:05:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.23040.1713279948509956560
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 08:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A89CB40C82;
	Tue, 16 Apr 2024 15:05:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MB154vKj7TZ; Tue, 16 Apr 2024 15:05:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C5CE40C2A;
	Tue, 16 Apr 2024 15:05:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0B32A163F16; Tue, 16 Apr 2024 11:05:42 -0400 (EDT)
Date: Tue, 16 Apr 2024 11:05:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-core: dbus:
 Remove redundant bbappend
Message-ID: <20240416150541.GH28791@denix.org>
References: <20240415055542.3372278-1-c-shilwant@ti.com>
 <20240415195912.GE28791@denix.org>
 <7fb114e0-1b08-4a98-ab71-af45067779f0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fb114e0-1b08-4a98-ab71-af45067779f0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 15:05:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15290

On Tue, Apr 16, 2024 at 10:53:12AM +0530, Chirag Shilwant wrote:
> Hi Denys,
> 
> On 16/04/24 01:29, Denys Dmytriyenko wrote:
> >As dbus is dual-licensed, back in the day it was required to choose which one
> >is used when distributing the package with Arago and TI-SDK, hence:
> >
> >https://git.yoctoproject.org/meta-arago/commit/?id=3fa4af20ea823b91448ad03a8ef5da053890dc12
> >
> >Not sure if that's still the case though...
> 
> 
> Yes, I see the dbus recipe is still dual licensed [1]. I thought the
> bbappend in arago was to ensure
> that we have the appropriate SPDX license identifiers as earlier
> oe-core used a different format. Btw, can you help me understand why
> picking asingle license is essential...for software manifests?

I don't have all the details, but IIRC back in the day OSRB/Legal preferred 
making such selection in the SDK manifest, clearly statiing which one of the 
options is used by TI and distributed to customers.

Again, whether this is still a concern needs to be confirmed with OSRB/Legal.


> [1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap#n8
> 
> 
> >On Mon, Apr 15, 2024 at 11:25:42AM +0530, Chirag Shilwant wrote:
> >>dbus recipe from oe-core:meta already has the appropriate
> >>SPDX license identifiers [1]. Hence, remove this bbappend.
> >>
> >>[1]: https://git.openembedded.org/openembedded-core/plain/meta/recipes-core/dbus/dbus_1.14.10.bb?h=scarthgap
> >>
> >>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>---
> >>  meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>  delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> >>
> >>diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> >>deleted file mode 100644
> >>index da612c59..00000000
> >>--- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> >>+++ /dev/null
> >>@@ -1,3 +0,0 @@
> >>-PR:append = ".arago1"
> >>-
> >>-LICENSE = "GPL-2.0-or-later"
> >>-- 
> >>2.34.1

