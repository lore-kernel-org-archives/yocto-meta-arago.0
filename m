Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72339D29C31
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 14:29:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35762.1768832987623911728
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jan 2026 06:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B6D6A40C6C;
	Mon, 19 Jan 2026 14:29:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Juu_n4Zqw-q2; Mon, 19 Jan 2026 14:29:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 64678406B9;
	Mon, 19 Jan 2026 14:29:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8FEA4177AA6; Mon, 19 Jan 2026 09:29:40 -0500 (EST)
Date: Mon, 19 Jan 2026 09:29:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: max.oss.09@gmail.com
Cc: reatmon@ti.com, denys@konsulko.com, meta-arago@lists.yoctoproject.org,
	praneeth@ti.com, Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-arago][master][PATCH v4] packagegroup-arago-console: Fix
 package names for alsa-utils-*
Message-ID: <20260119142940.GU11121@denix.org>
References: <3b1583b6-bd10-4dcb-b339-57d37c0c7049@ti.com>
 <20260119125927.646098-2-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119125927.646098-2-max.oss.09@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Jan 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16983

On Mon, Jan 19, 2026 at 01:59:28PM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Hi
> 
> FYI.
> 
> I run into issues installing alsa-utils. Some of the dynamically split
> packages are empty making alsa-utils depend on empty packages which
> made do_rootfs fail.
> 
> I guess you will run eventually into the same issue.
> 
> I sent a patch which works around the issue:
> 
> https://lore.kernel.org/all/20260119124722.646039-1-max.oss.09@gmail.com/

FYI:
https://lore.kernel.org/openembedded-core/20260116174128.1478960-1-ross.burton@arm.com/T/

-- 
Denys

