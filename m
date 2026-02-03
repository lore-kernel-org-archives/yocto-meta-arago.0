Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DC5E8784B
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 16:53:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21150.1770137587798687427
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 08:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 183C240CB7;
	Tue,  3 Feb 2026 16:53:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGscxbD72lqq; Tue,  3 Feb 2026 16:53:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE52040C1C;
	Tue,  3 Feb 2026 16:53:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 37F18177531; Tue,  3 Feb 2026 11:53:04 -0500 (EST)
Date: Tue, 3 Feb 2026 11:53:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] FIXME: systemd: Remove new OSC
 prompt feature
Message-ID: <20260203165304.GW11121@denix.org>
References: <20251219172103.363206-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219172103.363206-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 16:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17067

BTW, there was a patch that now sits in master-next to control this with a 
PACKAGECONFIG:

https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=0d7575d32a7b14762d80b1c09db4065ff247a903


On Fri, Dec 19, 2025 at 11:21:03AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> Our testing flow is blocked because of the OSC prompt code that was
> added to systemd 258.1.  This feature seeks to put a lot more extra
> information on the prompt using escape sequences, but it is conflicting
> with our board setup in some way.  All of the escaped sequences are
> being printed at the prompt which makes our testing detection code
> fail.
> 
> We need to get this fixed in the long run, but we also need to be able
> to pass CICD in the meantime.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-arago-distro/recipes-core/systemd/systemd-arago.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
> index 6e5baef7..3c31b92d 100644
> --- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
> +++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
> @@ -27,4 +27,9 @@ do_install:append() {
>  
>      install -d ${D}${sysconfdir}/systemd/
>      install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
> +
> +    # Remove new prompt code that is polluting the testing output
> +    rm ${D}/${nonarch_libdir}/tmpfiles.d/20-systemd-osc-context.conf
> +    rm ${D}/${nonarch_libdir}/systemd/profile.d/80-systemd-osc-context.sh
> +    rm ${D}/${sysconfdir}/profile.d/80-systemd-osc-context.sh
>  }
> -- 
> 2.43.0

