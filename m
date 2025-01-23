Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D3DC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 22:35:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24329.1737671733954851991
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 14:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 239C140C86;
	Thu, 23 Jan 2025 22:35:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2J2Lfa7qQgf; Thu, 23 Jan 2025 22:35:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F159F40A22;
	Thu, 23 Jan 2025 22:35:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 433E91641A2; Thu, 23 Jan 2025 17:35:29 -0500 (EST)
Date: Thu, 23 Jan 2025 17:35:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Chirag <c-shilwant@ti.com>, meta-arago@lists.yoctoproject.org,
	Ryan <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH 1/1] meta-arago-extras: Add
 recipe for TFLite Runtime
Message-ID: <20250123223529.GA21836@denix.org>
References: <20250123172509.445473-1-c-shilwant@ti.com>
 <20250123172509.445473-2-c-shilwant@ti.com>
 <068aa65b-e965-4dec-a779-e9baa0a1f11b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <068aa65b-e965-4dec-a779-e9baa0a1f11b@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 22:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15752

> >+do_configure[network] = "1"
> >+
> >+do_configure:prepend() {
> >+    if [ -n "${http_proxy}" ]; then
> >+        export HTTP_PROXY=${http_proxy}
> >+        export http_proxy=${http_proxy}
> >+    fi
> >+
> >+    if [ -n "${https_proxy}" ]; then
> >+        export HTTPS_PROXY=${https_proxy}
> >+        export https_proxy=${https_proxy}
> >+    fi
> 
> 
> Are these checks needed? If it is unset then exporting doesn't hurt,
> could replace all this with:
> 
> export http_proxy
> export https_proxy
> do_configure[network] = "1"
> 
> >+do_compile[network] = "1"
> >+
> >+do_compile:prepend() {
> >+    # Used to download cmake dependencies when behind a proxy
> >+    if [ -n "${http_proxy}" ]; then
> >+        export HTTP_PROXY=${http_proxy}
> >+        export http_proxy=${http_proxy}
> >+    fi
> >+
> >+    if [ -n "${https_proxy}" ]; then
> >+        export HTTPS_PROXY=${https_proxy}
> >+        export https_proxy=${https_proxy}
> >+    fi
> 
> Do you need network during compile? Seems to only be used in configure.

Both of the above will get you in trouble later on - these are considered a 
very bad antisocial behavior and an almost sure way to strip off of any Yocto 
Project Compatible status...

I'd suggest spending some time trying to find a way to do any and all 
downloads inside the do_fetch() task, which is the only one allowed to have 
network access.

In other words - do_configure() and do_compile() are definitely not the right 
places to do any network fetching...

-- 
Denys

