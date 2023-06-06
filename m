Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B0CC7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 22:57:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1082.1686092220773979668
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 15:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E618F40C37;
	Tue,  6 Jun 2023 22:56:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QznNtyym41ma; Tue,  6 Jun 2023 22:56:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B42E340AE9;
	Tue,  6 Jun 2023 22:56:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 62A35163953; Tue,  6 Jun 2023 18:56:09 -0400 (EDT)
Date: Tue, 6 Jun 2023 18:56:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: rs@ti.com, detheridge@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] arago.conf: add
 opencl as a distro feature
Message-ID: <20230606225609.GW9226@denix.org>
References: <20230530214757.3693099-1-rs@ti.com>
 <20230530214757.3693099-2-rs@ti.com>
 <f237479f-5cca-11df-60dd-eb0bfc66da79@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f237479f-5cca-11df-60dd-eb0bfc66da79@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 22:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14507

On Mon, Jun 05, 2023 at 11:57:51AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 5/30/2023 4:47 PM, rs@ti.com wrote:
> >From: Randolph Sapp <rs@ti.com>
> >
> >Rogue devices now have limited support for opencl. Further testing is
> >required but this is safe to enable now.
> >
> >Signed-off-by: Randolph Sapp <rs@ti.com>
> >---
> >  meta-arago-distro/conf/distro/arago.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> >index 379b1d44..a6425fae 100644
> >--- a/meta-arago-distro/conf/distro/arago.conf
> >+++ b/meta-arago-distro/conf/distro/arago.conf
> >@@ -47,7 +47,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
> >  # Add additional distro features
> >  DISTRO_FEATURES:append = " pam wayland opengl"
> >-#DISTRO_FEATURES:append = " opencl"
> >+DISTRO_FEATURES:append = " opencl"
> 
> This change has opened a can of worms.  A lot of build failures.
> Some of the dependent recipes were not migrated over from dunfell to
> kirkstone and those dependencies were hidden behind this feature
> being turned off.
> 
> If you want to recreate the build failures you can run:
> 
> MACHINE=am57xx-evm bitbake -k tisdk-core-bundle tisdk-tiny-image ti-world
> 
> 
> We need to either prune out some more older recipes that are
> depending on the missing packages, restore the missing packages and
> clean them up per the kirkstone rules and machine renames, or option
> C (yet to be thought of).
> 
> Needless to say, no quick fix for this one.  So I'm holding off
> accepting this patch series.
> 
> 
> >  DISTRO_FEATURES:append = " vulkan"
> >  DISTRO_FEATURES:append = " opencv"
> >  DISTRO_FEATURES:append = " openmp"

There are several old components in meta-arago-extras that are keyed off of 
"opencl" distro feature, that were doing task offloading to DSPs and EVEs on 
older platforms, like K2 and AM57x. Those are TI forks of OpenCL, OpenMP, 
OpenVX to work with old version of TIDL for EdgeAI back in the day:
https://www.cnx-software.com/2019/02/28/ti-am5729-beaglebone-ai-dsp-eve/

And when meta-ti was being restructured for Kirkstone and lower level 
dependencies were deprecated couple years ago, the fate of these components 
wasn't decided yet. If there are no downstream consumers of these pieces now, 
I guess they can be removed:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-extras/recipes-ti

-- 
Denys

