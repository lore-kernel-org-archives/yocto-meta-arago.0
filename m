Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48FAD0EE09
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 15:49:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.495.1764085788456143634
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 07:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB7EA40C2A;
	Tue, 25 Nov 2025 15:49:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMEfpbyyQsTH; Tue, 25 Nov 2025 15:49:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B58040A2F;
	Tue, 25 Nov 2025 15:49:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CB691175ACA; Tue, 25 Nov 2025 10:49:44 -0500 (EST)
Date: Tue, 25 Nov 2025 10:49:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: prc@list.ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [scarthgap][PATCH v2] arago.conf: set preferred
 runtime provider for weston-init
Message-ID: <20251125154943.GO3125@denix.org>
References: <20251125151825.20660-1-denis@denix.org>
 <20251125153823.3708356-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125153823.3708356-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Nov 2025 15:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16838

On Tue, Nov 25, 2025 at 09:38:23AM -0600, PRC Automation via lists.yoctoproject.org wrote:
> meta-arago / na / 20251125151825.20660-1-denis
> 
> PRC Results: PASS
> 
> =========================================================
>   check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [scarthgap][PATCH v2] arago.conf: set preferred runtime provider for weston-init
>     WARN: Revised patch missing a comment. (REVISION-1)
>         patch
>     
>     For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

This time around the check fails...


> =========================================================
>   apply-yocto-patch: PASS
> =========================================================
> scarthgap
> =====================
> Summary:
> - Patch Series: [scarthgap][PATCH v2] arago.conf: set preferred runtime provider for weston-init
> - Submitter: From: Denys Dmytriyenko <denis@denix.org>
> From: Denys Dmytriyenko <denys@konsulko.com>
> - Date: Date: Tue, 25 Nov 2025 10:18:25 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 527d17477f48f9629ea6b5e51c5b2843076f503a
> 
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: scarthgap-wip
> - Commit Author: sadik <s-sadik@ti.com>
> - Commit Subject: coremark: add Coremark CPU benchmark
> - Commit SHA: 28c94265012ec97c21a7e78c6ae34e1fd1ef0401
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
> scarthgap
> =====================
> PASS
> 
> 
> 
> =========================================================
>   yocto-check-layers: PASS
> =========================================================
> scarthgap - PASS
> =====================
> All checks passed

