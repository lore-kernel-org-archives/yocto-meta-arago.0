Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3575CC54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 16:20:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.59780.1673540437637426375
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 08:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6574A40C2B;
	Thu, 12 Jan 2023 16:20:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soj32n2wU0tc; Thu, 12 Jan 2023 16:20:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3974540429;
	Thu, 12 Jan 2023 16:20:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 41DDE1636F6; Thu, 12 Jan 2023 11:20:14 -0500 (EST)
Date: Thu, 12 Jan 2023 11:20:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: j-choudhary@ti.com, meta-arago@lists.yoctoproject.org, reatmon@ti.com,
	praneeth@ti.com
Subject: Re: [meta-arago][master/dunfell][PATCH 1/2] systemd: fix the local
 rule to load modules when new hardware is added
Message-ID: <20230112162014.GX22689@denix.org>
References: <20230104141150.186773-1-j-choudhary@ti.com>
 <20230104141150.186773-2-j-choudhary@ti.com>
 <4e1c65ab-2028-a556-a539-a6ead6cab8ab@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1c65ab-2028-a556-a539-a6ead6cab8ab@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Jan 2023 16:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14167

On Wed, Jan 04, 2023 at 10:12:42AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 1/4/23 8:11 AM, Jayesh Choudhary via lists.yoctoproject.org wrote:
> >Using modprobe causes the rule to fail when the module is builtin in kernel
> >and it is logged in journalctl. So use the builtin command 'kmod' instead.
> >This makes the journalctl logs clean and significantly easier to read.
> >
> >Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >---
> >  meta-arago-distro/recipes-core/systemd/systemd/local.rules | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
> >index b0e9f84f..4829ca14 100644
> >--- a/meta-arago-distro/recipes-core/systemd/systemd/local.rules
> >+++ b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
> >@@ -14,7 +14,7 @@
> >  #
> >  # Try and modprobe for drivers for new hardware
> >-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
> >+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN{builtin}+="kmod load $env{MODALIAS}"
> 
> Is the builtin version as full featured? Does this work in non-systemd systems? Is this just
> masking all errors or do real errors still get logged somewhere? If this is just a way
> to mask errors then --quiet might be more portable.
> 
> (BTW I ran into this same issue of having no good way to know if a module was builtin or just
> missing when adding dynamic kernel module support for Android [0])
> 
> Andrew
> 
> [0] https://android.googlesource.com/platform/system/core/+/9963847419f41c76ca008cf0c09e986c79f04e4c

Ping! I haven't seen any answers to the above questions, but the patch 
unfortunately already got merged...

-- 
Denys

