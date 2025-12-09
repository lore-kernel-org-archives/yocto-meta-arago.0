Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B103D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:10:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9968.1765293044191446344
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 07:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 628E840C2A;
	Tue,  9 Dec 2025 15:10:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8n4U8OHRmBwM; Tue,  9 Dec 2025 15:10:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1EA1D406B5;
	Tue,  9 Dec 2025 15:10:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6FD981765F5; Tue,  9 Dec 2025 10:10:39 -0500 (EST)
Date: Tue, 9 Dec 2025 10:10:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com
Subject: Re: [meta-arago][master/scarthgap][PATCH v2] stb: Update false
 version v2.31 -> v2.30
Message-ID: <20251209151039.GI11121@denix.org>
References: <20251208212718.4002485-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208212718.4002485-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 15:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16876

On Mon, Dec 08, 2025 at 03:27:18PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> stb is a header only library, that does not have an overall version.
> Instead it tracks individual header versions. All header versions can be
> found within the README. The header with the highest version is labled
> v2.30. v2.31 has never existed.
> 
> Also update the commit sha.
> 
> License-Update: README update due to new header file library
> (stb_include.h)
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> 
> v2:
> - Add License-Update reasoning 
> 
>  meta-arago-extras/recipes-support/stb/stb_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-extras/recipes-support/stb/stb_git.bb
> index 01443f7a..ecc9911c 100644
> --- a/meta-arago-extras/recipes-support/stb/stb_git.bb
> +++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
> @@ -1,11 +1,11 @@
>  SUMMARY = "single-file public domain (or MIT licensed) libraries for C/C++"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README.md;md5=42144ce827adcfa5170032f0ea03c227"
> +LIC_FILES_CHKSUM = "file://README.md;md5=b499fad62f2f8e336bbea84cc94d1e60"
>  
> -PV = "2.31"
> +PV = "2.30"

The version should never go backwards - this will cause problems with package 
feeds, releases and distro upgradeability.

If you absolutely must do this, you also need to bump the epoch (PE):
https://docs.yoctoproject.org/ref-manual/variables.html#term-PE


>  BRANCH = "master"
> -SRCREV = "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
> +SRCREV = "f1c79c02822848a9bed4315b12c8c8f3761e1296"
>  
>  SRC_URI = " \
>      git://github.com/nothings/stb.git;protocol=https;branch=${BRANCH} \
> -- 
> 2.34.1

