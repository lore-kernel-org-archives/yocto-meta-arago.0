Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CE6CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 17:28:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.225793.1697563700110514202
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 10:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B595240CEF;
	Tue, 17 Oct 2023 17:28:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9I11I4QpPA7y; Tue, 17 Oct 2023 17:28:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4AB240CEE;
	Tue, 17 Oct 2023 17:28:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 35161163CF5; Tue, 17 Oct 2023 13:28:12 -0400 (EDT)
Date: Tue, 17 Oct 2023 13:28:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Andrew Davis <afd@ti.com>, Gyan Gupta <g-gupta@ti.com>,
	Khasim <khasim@ti.com>
Subject: Re: [EXTERNAL] [meta-arago][master/kirkstone][PATCH 2/2]
 shadow-securetty: Do not allow root login over telnet
Message-ID: <20231017172812.GK2408@denix.org>
References: <20231016211840.23815-1-afd@ti.com>
 <20231016211840.23815-2-afd@ti.com>
 <ecff143a-22fe-4033-97ca-5ee6b884672a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecff143a-22fe-4033-97ca-5ee6b884672a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Oct 2023 17:28:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14942

On Tue, Oct 17, 2023 at 02:52:43PM +0530, Chirag Shilwant wrote:
> 
> On 17/10/23 02:48, Andrew Davis via lists.yoctoproject.org wrote:
> >I'm sure I don't have to explain why this was a bad idea..
> 
> Still, It will be good to have a commit message explaining it :)

It is a very obvious major security weakness and is definitely a very bad 
idea for an end product!

But, there was never a clear definition of what meta-arago is - is it an 
end product distribution or simply a test environment for the BSP/SDK.

This was added over 10 years ago as part of AM-SDK for ease of testing. 
Even though the commit does not explain it [1], we had a discussion and 
the security implications of sending telnet passwords in clear text were 
questioned.

The counter-argument here is that we build "debug" images w/o root password 
anyway by default, so allowing password-less root logins over telnet is 
rather a moot point, as we already allow the same for ssh.

Mayve instead of completely removing this, it should be conditional and 
only enabled when "debug-tweaks" is enabled in EXTRA_IMAGE_FEATURES, 
similar to allowing ssh root logins w/o a password.

[1] https://git.yoctoproject.org/meta-arago/commit/?id=98b6209a3010e32da963a0f6f53fceebbc37f8f9


> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  .../shadow/shadow-securetty_%.bbappend            | 15 ---------------
> >  1 file changed, 15 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> >deleted file mode 100644
> >index 62999d2a..00000000
> >--- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
> >+++ /dev/null
> >@@ -1,15 +0,0 @@
> >-PR:append = ".arago0"
> >-
> >-do_install:append () {
> >-    # Allow telnet sessions to login as root
> >-    securetty_file=${D}${sysconfdir}/securetty
> >-
> >-    echo '' >> $securetty_file
> >-    echo '# Allow 5 telnet login' >> $securetty_file
> >-    echo 'pts/0' >> $securetty_file
> >-    echo 'pts/1' >> $securetty_file
> >-    echo 'pts/2' >> $securetty_file
> >-    echo 'pts/3' >> $securetty_file
> >-    echo 'pts/4' >> $securetty_file
> >-
> >-}

