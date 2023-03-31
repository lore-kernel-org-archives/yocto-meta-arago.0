Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF9BC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 22:33:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.9114.1680302012513653929
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 15:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C8EA40C62;
	Fri, 31 Mar 2023 22:33:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8_wBxykSTbH; Fri, 31 Mar 2023 22:33:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E41D40A0B;
	Fri, 31 Mar 2023 22:33:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 05B561637EA; Fri, 31 Mar 2023 18:32:53 -0400 (EDT)
Date: Fri, 31 Mar 2023 18:32:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell][PATCH] images: Add variable to add extra
 packages from the local.conf
Message-ID: <20230331223252.GK18050@denix.org>
References: <20230331220143.20090-1-reatmon@ti.com>
 <20230331220847.GJ18050@denix.org>
 <0cacad68-0e77-a9da-3129-c7095b45d934@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cacad68-0e77-a9da-3129-c7095b45d934@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 Mar 2023 22:33:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14290

On Fri, Mar 31, 2023 at 05:29:31PM -0500, Ryan Eatmon wrote:
> 
> 
> On 3/31/2023 17:08, Denys Dmytriyenko wrote:
> >On Fri, Mar 31, 2023 at 05:01:43PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>The bootstrap, thinlinux and tiny images all had a variable that allowed
> >>for adding additional packages to the image from the local.conf file.
> >>Add this same concept to the default and base images.
> >
> >Missing Suggested-by? :) But sure, looks good to me!
> >
> >Why is it dunfell specific?
> >
> 
> Because the patch did not apply to kirkstone/master, so I sent a
> second patch with the updated patch.

Yeah, I saw that later - I guess I commented too fast...


> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  meta-arago-distro/recipes-core/images/tisdk-base-image.bb    | 3 +++
> >>  meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 3 +++
> >>  2 files changed, 6 insertions(+)
> >>
> >>diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
> >>index 8698816d..ec09b90b 100644
> >>--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
> >>+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
> >>@@ -8,12 +8,15 @@ require arago-image.inc
> >>  IMAGE_FSTYPES += "cpio.xz"
> >>  IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
> >>+ARAGO_BASE_IMAGE_EXTRA_INSTALL ?= ""
> >>+
> >>  IMAGE_INSTALL += "\
> >>      packagegroup-arago-base \
> >>      packagegroup-arago-console \
> >>      packagegroup-arago-base-tisdk \
> >>      ${VIRTUAL-RUNTIME_initramfs} \
> >>      ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
> >>+    ${ARAGO_BASE_IMAGE_EXTRA_INSTALL} \
> >>  "
> >>  export IMAGE_BASENAME = "tisdk-base-image"
> >>diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >>index 16772ee9..9cd0a28f 100644
> >>--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >>+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> >>@@ -7,6 +7,8 @@ require arago-image.inc
> >>  SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
> >>+ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
> >>+
> >>  IMAGE_INSTALL += "\
> >>      packagegroup-arago-base \
> >>      packagegroup-arago-console \
> >>@@ -27,6 +29,7 @@ IMAGE_INSTALL += "\
> >>      ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> >>      ti-analytics \
> >>      ti-demos \
> >>+    ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
> >>  "
> >>  export IMAGE_BASENAME = "tisdk-default-image"
> >>-- 
> >>2.17.1

