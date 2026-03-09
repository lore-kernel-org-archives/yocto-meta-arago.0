Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46660FCA17B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 19:38:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23426.1773085078353195933
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 12:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 79E5640CB9;
	Mon,  9 Mar 2026 19:37:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTqSbSI64MYB; Mon,  9 Mar 2026 19:37:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27F7D40BD6;
	Mon,  9 Mar 2026 19:37:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6DF2D179BBA; Mon,  9 Mar 2026 15:37:51 -0400 (EDT)
Date: Mon, 9 Mar 2026 15:37:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Pratham Deshmukh <p-deshmukh@ti.com>, meta-arago@lists.yoctoproject.org,
	c-shilwant@ti.com, denys@ti.com, v-singh1@ti.com
Subject: Re: [meta-arago][master][PATCH 1/1] nnstreamer: Skip buildpaths QA
 check
Message-ID: <20260309193751.GR11121@denix.org>
References: <20260309053346.3827889-1-p-deshmukh@ti.com>
 <20260309053346.3827889-2-p-deshmukh@ti.com>
 <73a153ec-d0db-4db7-b3d8-450a29e6deaa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a153ec-d0db-4db7-b3d8-450a29e6deaa@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 19:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17299

On Mon, Mar 09, 2026 at 08:02:03AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/9/26 12:33 AM, Pratham Deshmukh wrote:
> >The nnstreamer-src package contains debug source files that reference
> >TMPDIR paths, causing QA buildpaths errors during do_package_qa.
> 
> Any read on "why" this is happening? How do the build paths end up in
> the source files packaged in the -src package?

Probably a generated file, such as version.h, config.h or similar.
If that's the case, "sed" may help here.


> >Skip the buildpaths check for the source package to resolve the
> >build failure.
> >
> >Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> >---
> >  .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> >index c62589ac..74d72d9e 100644
> >--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> >+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> >@@ -64,6 +64,8 @@ FILES:${PN}-tests += "\
> >  "
> >  INSANE_SKIP:${PN}-tests += "buildpaths"
> >+INSANE_SKIP:${PN}-src += "buildpaths"
> >+
> >  FILES:${PN}-dev = "\
> >  	${includedir}/nnstreamer/* \
> >  	${libdir}/pkgconfig/*.pc \

