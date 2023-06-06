Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C11DC7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 22:40:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.769.1686091235961297720
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 15:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F28640C37;
	Tue,  6 Jun 2023 22:40:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9twjKqUooUiN; Tue,  6 Jun 2023 22:40:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 151B540AE9;
	Tue,  6 Jun 2023 22:40:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BD60716394F; Tue,  6 Jun 2023 18:39:43 -0400 (EDT)
Date: Tue, 6 Jun 2023 18:39:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, detheridge@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] kexec-tools: drop the
 bbappend
Message-ID: <20230606223943.GV9226@denix.org>
References: <20230606215108.2655321-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606215108.2655321-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 22:40:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14506

On Tue, Jun 06, 2023 at 04:51:08PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> This is a do-nothing bbappend. On top of that, it always expects the
> sysvinit script to be present, which is not supposed to be true in our
> default config. Drop the append entirely.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> This is a prereq for the following patch apparently:
> https://lists.yoctoproject.org/g/meta-arago/message/14498
> 
> I tested that patch against core build targets not expecting us to do
> something this weird in meta-arago.

Heh, that was a weird one indeed - I was being asked to apply hacks and weird 
fixes w/o much explanation, so I couldn't even put anything in the commit log:
https://git.yoctoproject.org/meta-arago/log/meta-arago-distro/recipes-kernel/kexec/

Some dark history... That's why meta-arago-distro was often a dumping ground 
of hacks and kludges :(


>  .../recipes-kernel/kexec/kexec-tools_%.bbappend            | 7 -------
>  1 file changed, 7 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
> deleted file mode 100644
> index 88786124..00000000
> --- a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> -
> -PR:append = ".arago2"
> -
> -do_install:append() {
> -	chmod -x ${D}${sysconfdir}/init.d/kdump
> -}
> -- 
> 2.40.1

