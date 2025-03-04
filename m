Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28426C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 21:00:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.33688.1741122036693671961
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 13:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE2BD40C3E;
	Tue,  4 Mar 2025 21:00:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFYcqU0wv087; Tue,  4 Mar 2025 21:00:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C12AC40A03;
	Tue,  4 Mar 2025 21:00:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2C1D51642D0; Tue,  4 Mar 2025 16:00:33 -0500 (EST)
Date: Tue, 4 Mar 2025 16:00:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: a-christidis@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-test: Add runtime
 dependencies for pytesseract
Message-ID: <20250304210033.GL1879@denix.org>
References: <20250304060645.217310-1-a-christidis@ti.com>
 <a790bc63-0a40-44f6-94bf-da7f067ce52d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a790bc63-0a40-44f6-94bf-da7f067ce52d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 21:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15940

On Tue, Mar 04, 2025 at 01:35:20PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> The subject is not quite right.  It should be:
> 
> pytesseract: Add runtime dependencies
> 
> I don't care so much about knowing this patch was for
> meta-arago-test or whichever layer.  But the first part should
> always contain the recipe name being updated.
> 
> Please fix.
> 
> 
> On 3/4/2025 12:06 AM, Antonios Christidis via lists.yoctoproject.org wrote:
> >From: Antonios Christidis <a-christidis@ti.com>
> >
> >Pytesseract is a python wrapper for tesseract, so it should depend on it.
> >The pytesseract script calls the python packaging module, so add it as
> >well as a dependecy.
> >
> >This is only for scarthgap branch, as the master recipe for this package
> >is in meta-openembedded.
> >
> >Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >---
> >  .../recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb  | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> >index 91350cd5..0f505f63 100644
> >--- a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> >+++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> >@@ -7,6 +7,8 @@ HOMEPAGE = "https://github.com/madmaze/pytesseract"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> >+RDEPENDS:${PN}:append = "python3-packaging tesseract"

This can potentially mangle the existing RDEPENDS list...


> >  SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
> >  PYPI_PACKAGE = "pytesseract"

