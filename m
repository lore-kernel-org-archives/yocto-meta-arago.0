Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4F0C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 19:15:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24920.1674587729970145448
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 11:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4A6940A08;
	Tue, 24 Jan 2023 19:15:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POhT5QKu2lYM; Tue, 24 Jan 2023 19:15:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD6AC409B0;
	Tue, 24 Jan 2023 19:15:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ACBD2163702; Tue, 24 Jan 2023 14:15:06 -0500 (EST)
Date: Tue, 24 Jan 2023 14:15:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago] [master/kirkstone][PATCH] libdrm: remove
 alternative setup for kmstest
Message-ID: <20230124191506.GY22689@denix.org>
References: <20230105212608.2105546-1-denis@denix.org>
 <7668158d-2a76-3025-d01f-3b48e0692a2e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7668158d-2a76-3025-d01f-3b48e0692a2e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Jan 2023 19:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14181

Sorry, my bad, this is only for master with latest libdrm, not kirkstone:
https://git.yoctoproject.org/meta-arago/commit/?id=548657e4d8118af98ad047a7c19b3cc49b7480bb


On Tue, Jan 24, 2023 at 08:16:00AM -0600, Ryan Eatmon wrote:
> I'm not 100% certain, but all of the builds are now failing with this error:
> 
> 
> tisdk-default-image_1.0-r0_do_rootfs.log
> ----------------------------------------
> 
> WARNING: kms++.postinst returned 1, marking as unpacked only,
> configuration required on target.
> ERROR: Postinstall scriptlets of ['kms++'] have failed. If the
> intention is to defer them to first boot,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /scratch/jenkins_builds/arago-kirkstone-wip/build/build/arago-tmp-default-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_rootfs.
> DEBUG: Python function do_rootfs finished
> 
> 
> Seeing as this is the only recent change that mentions kms, this
> might be culprit?
> 
> 
> On 1/5/2023 15:26, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >libdrm no longer provides kms driver and tests for it.
> >
> >Fixes:
> >
> >WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: alternative target (/usr/bin/kmstest or /usr/bin/kmstest.libdrm) does not exist, skipping...
> >WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: NOT adding alternative provide /usr/bin/kmstest: /usr/bin/kmstest.libdrm does not exist
> >WARNING: libdrm-2.4.114-r0.arago3 do_package: libdrm: alt_link == alt_target: /usr/bin/kmstest == /usr/bin/kmstest
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> >index 85152b5f..ea8b5ca1 100644
> >--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> >+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
> >@@ -8,10 +8,4 @@ file://0001-libsync-add-support-for-pre-v4.7-kernels.patch \
> >  file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
> >  "
> >-PR:append = ".arago3"
> >-
> >-inherit update-alternatives
> >-
> >-ALTERNATIVE_PRIORITY = "10"
> >-ALTERNATIVE:${PN} = "kmstest"
> >-ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
> >+PR:append = ".arago4"

