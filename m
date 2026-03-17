Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E03FEDA1F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:57:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85323.1773777418981546982
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F12C40CCA;
	Tue, 17 Mar 2026 19:56:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQhZkngTgQH7; Tue, 17 Mar 2026 19:56:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 34D8D40BEC;
	Tue, 17 Mar 2026 19:56:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EABE317A43D; Tue, 17 Mar 2026 15:56:54 -0400 (EDT)
Date: Tue, 17 Mar 2026 15:56:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: reatmon@ti.com, denys@konsulko.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 1/2] libsdl2: Add tests package
Message-ID: <20260317195654.GC11121@denix.org>
References: <20260317185724.34717-1-a-christidis@ti.com>
 <20260317185724.34717-2-a-christidis@ti.com>
 <20260317191426.GA11121@denix.org>
 <b1bd0c0f-15c9-4f35-88fe-12e12e88ee22@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1bd0c0f-15c9-4f35-88fe-12e12e88ee22@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17376

On Tue, Mar 17, 2026 at 02:29:16PM -0500, Antonios Christidis wrote:
> 
> On 3/17/26 2:14 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 17, 2026 at 01:57:23PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> >>From: Antonios Christidis <a-christidis@ti.com>
> >>
> >>The software provides tests, configure cmake to build and install them.
> >>Package the tests in -tests package.
> >This might be useful to get it upstreamed as a new PACKAGECONFIG to OE-Core...
> 
> Thank you for the idea, I'll keep that in mind.
> 
> >
> >>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >>---
> >>  meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
> >>  meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
> >>  2 files changed, 10 insertions(+)
> >>  create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> >>  create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> >>
> >>diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> >>new file mode 100644
> >>index 00000000..f33ff909
> >>--- /dev/null
> >>+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> >>@@ -0,0 +1,6 @@
> >>+EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
> >>+                         -DSDL_INSTALL_TESTS=ON \
> >>+                       "
> >There's no reason for :append here, while += could work just fine.
> Do you want me to send a v2 for this ?
> >>+PACKAGE_BEFORE_PN = "${PN}-tests"
> >>+FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
> >>+FILES:${PN}-tests:class-nativesdk += "${libexecdir} ${datadir}/installed-tests/SDL2"
> >If the values for these 2 are identical, why do you need to set
> >class-nativesdk variant explixitly?
> 
> Ryan observed an issue when class-nativesdk variant wasn't set
> explicitly on scarthgap branch.
> 
> Link: https://patchwork.yoctoproject.org/project/arago/patch/20250917220826.2078836-2-a-christidis@ti.com/#31054

Ah, right, we had that discussion back in September... Still not sure why it 
was failing.


> >>diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> >>new file mode 100644
> >>index 00000000..385aa801
> >>--- /dev/null
> >>+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> >>@@ -0,0 +1,4 @@
> >>+LIBSDL2_TI = ""
> >>+LIBSDL2_TI:ti-soc = "libsdl2-ti.inc"
> >>+
> >>+require ${LIBSDL2_TI}
> >>-- 
> >>2.34.1

