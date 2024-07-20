Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E546FC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 18:00:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.10817.1721498432318005428
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 20 Jul 2024 11:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B023E40C16;
	Sat, 20 Jul 2024 18:00:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfrwIvYv3wux; Sat, 20 Jul 2024 18:00:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B592F40B66;
	Sat, 20 Jul 2024 18:00:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7EE82164001; Sat, 20 Jul 2024 14:00:27 -0400 (EDT)
Date: Sat, 20 Jul 2024 14:00:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] ti-llvm: Fix for buildpaths errors
Message-ID: <20240720180027.GP17572@denix.org>
References: <20240719025328.28669-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719025328.28669-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 20 Jul 2024 18:00:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15461

On Thu, Jul 18, 2024 at 09:53:28PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Make sure that llvm-config does not have any absolute build paths within
> the compiled binary.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> index 4b990b7f..395651d3 100644
> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
> @@ -72,6 +72,10 @@ do_compile:class-native() {
>  }
>  
>  do_compile:class-nativesdk() {
> +    # Fix for buildpaths error referring to TMPDIR
> +    sed -i 's:@LLVM_SRC_ROOT@::g' ${S}/tools/llvm-config/BuildVariables.inc.in
> +    sed -i 's:@LLVM_OBJ_ROOT@::g' ${S}/tools/llvm-config/BuildVariables.inc.in

Yeah, I was also looking at patching this .in file, but got pre-occupied with 
upstream breakage lately... Thanks for taking care of this.


>      cd ${LLVM_BUILD_DIR}
>  
>      # Fix libdir for multilib
> -- 
> 2.17.1

