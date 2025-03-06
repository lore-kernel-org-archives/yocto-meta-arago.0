Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DF5C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 19:22:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2905.1741288946166163688
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 11:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5199240C2E;
	Thu,  6 Mar 2025 19:22:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdCHq6tK64DQ; Thu,  6 Mar 2025 19:22:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A42440B66;
	Thu,  6 Mar 2025 19:22:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8AC681642DE; Thu,  6 Mar 2025 14:22:22 -0500 (EST)
Date: Thu, 6 Mar 2025 14:22:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: a-christidis@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH v2] pytesseract: Add runtime
 dependencies
Message-ID: <20250306192222.GN1879@denix.org>
References: <20250304205358.268668-1-a-christidis@ti.com>
 <40ec00b0-abcd-489a-ad35-e17534a3a824@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40ec00b0-abcd-489a-ad35-e17534a3a824@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 19:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15957

On Tue, Mar 04, 2025 at 04:24:43PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 3/4/2025 2:53 PM, a-christidis@ti.com wrote:
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
> >
> >v2:
> >- Updated subject to start off with recipe name that is changed
> >
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
> >+
> 
> As Denys pointed out on v1.  The append requires a " " at the
> beginning of the string.  += adds the space, but append is just a
> raw append.
> 
> RDEPENDS:${PN}:append = " python3-packaging tesseract"
>                          ^

The rule of thumb is to avoid using generic (non SoC/machine specific) :append 
when += can be used on space-separated lists.

E.g. don't use:

VAR:append = " val"

Instead, use:

VAR += "val"

But this is fine:

VAR:append:k3 = " val"

-- 
Denys

