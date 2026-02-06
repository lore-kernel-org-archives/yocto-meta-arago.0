Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE85EE209F
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:58:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10914.1770382724472777746
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 04:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F99B40CD7;
	Fri,  6 Feb 2026 12:58:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBX0Ums8AcyC; Fri,  6 Feb 2026 12:58:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 34F9640CC3;
	Fri,  6 Feb 2026 12:58:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6BB66178596; Fri,  6 Feb 2026 07:58:39 -0500 (EST)
Date: Fri, 6 Feb 2026 07:58:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, jcormier@criticallink.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup][PATCH 2/5] oe-layertool-setup:
 trim trailing whitespace
Message-ID: <20260206125839.GB11121@denix.org>
References: <20260205225528.92769-2-rs@ti.com>
 <20260205225528.92769-4-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205225528.92769-4-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Feb 2026 12:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17092

On Thu, Feb 05, 2026 at 04:55:26PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Trim the existing trailing whitespace to align with editorconfig.

Unfrotunately, this will not come through as an inline patch via the mailing 
list.

Ryan will have to apply the original patch or make the same changes on his 
side.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  oe-layertool-setup.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index eb412ff..cd6d04e 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -136,7 +136,7 @@ check_input() {
>      if [ ! -f "$inputfile" ]
>      then
>          printf '%s\n' "ERROR: the file \"$inputfile\" given for inputfile does not exist"
> -        usage 
> +        usage
>      fi
>  
>      # If directories do not exist then create them
> @@ -348,7 +348,7 @@ configure_repo() {
>          printf '%s\n' "Skipping configuring duplicate repository"
>          return 1
>      fi
> -  
> +
>      if [ -z "$uri" ]
>      then
>          get_repo_uri
> @@ -431,7 +431,7 @@ The $name repository has the following branches available:
>  
>  $branches
>  
> -What branch would you like to checkout for the $name repository? 
> +What branch would you like to checkout for the $name repository?
>  EOM
>          read -r input
>  
> -- 
> 2.52.0

