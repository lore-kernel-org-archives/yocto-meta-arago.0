Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE38EE9D416
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:50:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25258.1770223832667063257
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 08:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D1FD840C8C;
	Wed,  4 Feb 2026 16:50:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5xBXvAjBmml; Wed,  4 Feb 2026 16:50:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B24FE40B13;
	Wed,  4 Feb 2026 16:50:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6EA0C17850C; Wed,  4 Feb 2026 11:50:30 -0500 (EST)
Date: Wed, 4 Feb 2026 11:50:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd
 service for system-wide audio daemon
Message-ID: <20260204165030.GA11121@denix.org>
References: <20260204160813.2393421-1-j-sahu@ti.com>
 <20260204163056.3336685-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204163056.3336685-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 16:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17082

On Wed, Feb 04, 2026 at 10:30:56AM -0600, PRC Automation via lists.yoctoproject.org wrote:
> meta-arago / na / 20260204160813.2393421-1-j-sahu
> 
> PRC Results: FAIL
> 
> =========================================================
>   check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> All patches passed
> 
> 
> 
> =========================================================
>   apply-yocto-patch: PASS
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd service for system-wide audio daemon
> - Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> - Date: Date: Wed, 4 Feb 2026 21:38:13 +0530
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 9eb3f83089e67ac2fdf065915304bcd7e28f2a85
> 
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: master-wip
> - Commit Author: Andrew Davis <afd@ti.com>
> - Commit Subject: meta-arago-distro: Remove tisdk name from Arago packagegroups
> - Commit SHA: 5fb7dfe249b07778f706eb50635e2c5a2c56b13d
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>   check-yocto-repo: PASS
> =========================================================
> master
> =====================
> PASS
> 
> 
> 
> =========================================================
>   yocto-check-layers: FAIL
> =========================================================
> master - FAIL
> =====================
> ERROR: Nothing RPROVIDES 'packagegroup-arago-base-erver-extra' (but <build-dir>/sources/meta-arago/meta-arago-distro/recipes-core/packagegroups/ti-world.bb RDEPENDS on or otherwise requires it)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

Ryan,

Somehow there's a typo snuck in in the commit:
https://git.yoctoproject.org/meta-arago/commit/?h=master-wip&id=5fb7dfe249b07778f706eb50635e2c5a2c56b13d

At the very bottom, it has 'packagegroup-arago-base-erver-extra'

I checked Andrew's patches and neither v1 nor v2 had that typo.

