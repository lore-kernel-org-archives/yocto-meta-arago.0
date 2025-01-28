Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340B6C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 21:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9417.1738101085662453361
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 13:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E735340CBA;
	Tue, 28 Jan 2025 21:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHv48bDEvHer; Tue, 28 Jan 2025 21:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C7BEB40BD4;
	Tue, 28 Jan 2025 21:51:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 34AAB1641BD; Tue, 28 Jan 2025 16:51:23 -0500 (EST)
Date: Tue, 28 Jan 2025 16:51:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] meta-arago-test: Add
 recipe for pytesseract
Message-ID: <20250128215123.GJ21836@denix.org>
References: <20250128205901.57080-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128205901.57080-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 21:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15774

On Tue, Jan 28, 2025 at 02:59:01PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Recipe builds the python module pytessereact, version 0.3.13.
> 
> The module is a wrapper for Google's Tesseract-OCR engine.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>

Thank you for a quick turnaround. Probably not critical here, but in the 
future it is also recommended to briefly summarize the changes berween v1 
and v2 of the patches right below the --- line:

> ---

Here, you mention what were the changes between v1 and v2, e.g.:

v2:
- fixed SUMMARY/DESCRIPTION usage for short/long recipe descriptions
- used sha256sum instead of deprecated md5sum

>  .../python3-pytesseract/pytesseract_0.3.13.bb    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> new file mode 100644
> index 00000000..f63e9fd9
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Python-tesseract is a python wrapper for Google's Tesseract"
> +
> +DESCRIPTION = "Python-tesseract is an optical character recognition (OCR) tool for python. That is, it will recognize and "read" the text embedded in images."
> +
> +HOMEPAGE = "https://github.com/madmaze/pytesseract"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
> +
> +PYPI_PACKAGE = "pytesseract"
> +
> +inherit pypi setuptools3 
> +
> +BBCLASSEXTEND = "native"
> -- 
> 2.34.1

