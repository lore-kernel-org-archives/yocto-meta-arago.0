Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEA5CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 15:21:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.271.1757344872782848842
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D613340C8E;
	Mon,  8 Sep 2025 15:21:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoo25c4nSKDH; Mon,  8 Sep 2025 15:21:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA883406B9;
	Mon,  8 Sep 2025 15:21:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C3AC617398C; Mon,  8 Sep 2025 11:21:08 -0400 (EDT)
Date: Mon, 8 Sep 2025 11:21:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-arago][master][PATCH v2 2/3] meta-arago-test:
 recipes-extended: Specify correct PV for OCL C headers
Message-ID: <20250908152108.GC3125@denix.org>
References: <20250905233849.2506703-1-a-christidis@ti.com>
 <20250905233849.2506703-3-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905233849.2506703-3-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 15:21:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16545

Please don't use "meta-arago-test: recipes-extended:" prefix in the commit 
summary (Subject) - it's very high level and absolutely useless.

The convention that OE layers use is to specify the "area:", which is usually 
the name of the recipe for a single change, or a common name for multiple 
changes in the same commit, e.g. "conf/machine:" or even "opencl:" here.

So, this would change current subject

"meta-arago-test: recipes-extended: Specify correct PV for OCL C headers"

into

"opencl-headers: specify correct PV"

And for #3:

"opencl-clhpp: update v2.0.16 -> v2024.05.08"

In other words, instead of doing this:

"blah: blah: blah: do foo for bar"

do this:

"bar: do foo"


On Fri, Sep 05, 2025 at 06:38:48PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> With the .bbappend and .inc file, the version of the headers is
> increased. So, specify the correct PV of the headers.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
> index 48335204..1216adf5 100644
> --- a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
> +++ b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
> @@ -1,6 +1,7 @@
>  inherit cmake
>  
>  SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
> +PV = "2024.05.08"
>  
>  EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
>  
> -- 
> 2.34.1

