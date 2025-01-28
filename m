Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB91C02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 18:14:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4042.1738088084524524500
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 10:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D6C7A40CBA;
	Tue, 28 Jan 2025 18:14:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RqwmJR_PPba; Tue, 28 Jan 2025 18:14:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BE3FE40ACD;
	Tue, 28 Jan 2025 18:14:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 849D01641AB; Tue, 28 Jan 2025 13:14:42 -0500 (EST)
Date: Tue, 28 Jan 2025 13:14:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [PATCH][scarthgap/master] meta-arago-test: Add
 recipe for pytesseract
Message-ID: <20250128181442.GD21836@denix.org>
References: <20250127170059.1525548-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127170059.1525548-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 18:14:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15767

On Mon, Jan 27, 2025 at 11:00:59AM -0600, a-christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Recipe builds the python module pytessereact, version 0.3.13.
> 
> The module is a wrapper for Google's Tesseract-OCR engine.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../python3-pytesseract/pytesseract_0.3.13.bb      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> new file mode 100644
> index 00000000..ff2814f8
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Python-tesseract is an optical character recognition (OCR) tool for python. That is, it will recognize and "read" the text embedded in images."

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-SUMMARY
SUMMARY - A short summary for the recipe, which is 72 characters or less.

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-DESCRIPTION
DESCRIPTION - A long description for the recipe.

> +
> +HOMEPAGE = "https://github.com/madmaze/pytesseract"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[md5sum] = "73f9645e59b437f064d05882b95832ce"

We are moving away from MD5-only hashes. Either provide both MD5 and SHA-256, 
or only SHA-256 is also allowed.


> +
> +PYPI_PACKAGE = "pytesseract"
> +
> +inherit pypi setuptools3 
> +
> +BBCLASSEXTEND = "native"
> -- 
> 2.34.1

