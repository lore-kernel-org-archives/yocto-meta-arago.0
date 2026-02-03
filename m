Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F0AE7C712
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:30:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2031.1770147036346400018
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 11:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 626D840CB7;
	Tue,  3 Feb 2026 19:30:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AKQtrNOw005; Tue,  3 Feb 2026 19:30:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2AAAE40A46;
	Tue,  3 Feb 2026 19:30:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6369C17845D; Tue,  3 Feb 2026 14:30:31 -0500 (EST)
Date: Tue, 3 Feb 2026 14:30:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove
 tisdk name from Arago packagegroups
Message-ID: <20260203193031.GY11121@denix.org>
References: <20260130220830.2173125-1-afd@ti.com>
 <20260130220830.2173125-3-afd@ti.com>
 <3b100130-a5b8-458a-8c0d-9bffbd47410e@ti.com>
 <ddeb60f2-b8a6-4d7d-861b-36f11012afa7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddeb60f2-b8a6-4d7d-861b-36f11012afa7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 19:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17073

On Tue, Feb 03, 2026 at 12:58:52PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> On 2/3/26 12:07 PM, Ryan Eatmon wrote:
> >
> >There are still a few remaining files with tisdk in the name after this patch:
> >
> > > find . -name "*tisdk*"
> >./meta-arago-distro/recipes-tisdk
> >./meta-arago-distro/recipes-tisdk/tisdk-uenv
> >./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
> >./meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv
> 
> This recipe I've been wanting to remove for other reasons (DEPLOYDIR messiness), plan
> is either merge this into the U-Boot recipe as it is the consumer of the deployed
> uEnv.txt. Or just move it to meta-tisdk where is actually used for something.
> (the version of uEnv.txt in meta-arago is just an empty placeholder file).
> 
> >./meta-arago-distro/classes/tisdk-sw-manifest.bbclass
> >./meta-arago-distro/classes/tisdk-bundle.bbclass
> >./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> >./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc
> >./meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
> >./meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
> >./meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> >
> >
> 
> To be honest I don't know enough about the original intent of the Arago toolchain
> and bundle to feel safe messing with them. I think they should either move into
> meta-tisdk, or just be removed depending on discussions on switching to the Yocto
> provided "Standard SDK"[0]. But that would be a project outside of this renaming

What exactly do you mean "switching to the Yocto provided Standard SDK"??

Arago does produce a slightly extended and slightly customized "Standard SDK" 
from OE/Yocto perspective. Since that comes from meta-toolchain*, those terms 
are sometimes interchangeable...

Moreover, Arago produces 2 Standard SDKs - one for Linux Cortex-A and another 
for baremetal Cortex-R. They get named as devkits though, because from TI's 
perspective, the "released" SDK is a bundle of devkits, pre-built binaries 
and collateral, such as SW manifest in TI own format. That's the point of 
tisdk-bundle.bbclass and tisdk-sw-manifest.bbclass

So, everyhting is pretty "Standard" from OE/Yocto perspective. The only 
"Custom" part is bundling several separate pieces together into a single 
"release" tarball (product teams may create InstallShield executable of it).

Besides the 2 bbclasses, the rest of the recipes just slightly extend and 
slightly customize existing meta-toolchain* flow and are within the existing 
"Standard SDK" framework.


> PR.
> 
> Andrew
> 
> [0] https://docs.yoctoproject.org/sdk-manual/using.html
> 
> >Are we planning on addressing the above as well at some point?

