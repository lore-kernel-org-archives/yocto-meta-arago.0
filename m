Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B04D374AF
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 21:55:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4985.1764971695394346782
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 13:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9F79540C86;
	Fri,  5 Dec 2025 21:54:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfw9O74cFN5w; Fri,  5 Dec 2025 21:54:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 66A3540A20;
	Fri,  5 Dec 2025 21:54:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A863176412; Fri,  5 Dec 2025 16:54:50 -0500 (EST)
Date: Fri, 5 Dec 2025 16:54:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: rs@ti.com, reatmon@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] dbus: remove license selection
 override
Message-ID: <20251205215450.GG11121@denix.org>
References: <20251205205232.2471677-2-rs@ti.com>
 <43890281-3c9d-491f-bbee-319e38ad6e8c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43890281-3c9d-491f-bbee-319e38ad6e8c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 21:55:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16868

On Fri, Dec 05, 2025 at 03:25:42PM -0600, Andrew Davis wrote:
> On 12/5/25 2:52 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> >From: Randolph Sapp <rs@ti.com>
> >
> >Not entirely sure why this exists. History indicates that someone wanted
> >to select one of dbus's two license for distribution. Not entirely sure
> >we need to change the recipe itself to do that.
> >
> 
> Seems we do the same for freetype. Not sure if it was to fix some SBOM
> check issue or what. But yeah overwriting the LICENSE to hide that the
> project is dual licensed doesn't change the fact it is dual licensed..

SW Manifest in the early days of OSRB required to select a specific license 
if there was a choice. Seems silly now, I know.


> >Signed-off-by: Randolph Sapp <rs@ti.com>
> >---
> >  meta-arago-distro/recipes-core/dbus/dbus-arago.inc  | 3 ---
> >  meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 4 ----
> >  2 files changed, 7 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus-arago.inc
> >  delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-core/dbus/dbus-arago.inc b/meta-arago-distro/recipes-core/dbus/dbus-arago.inc
> >deleted file mode 100644
> >index da612c59..00000000
> >--- a/meta-arago-distro/recipes-core/dbus/dbus-arago.inc
> >+++ /dev/null
> >@@ -1,3 +0,0 @@
> >-PR:append = ".arago1"
> >-
> >-LICENSE = "GPL-2.0-or-later"
> >diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> >deleted file mode 100644
> >index 5464eaa7..00000000
> >--- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
> >+++ /dev/null
> >@@ -1,4 +0,0 @@
> >-DBUS_ARAGO = ""
> >-DBUS_ARAGO:arago = "dbus-arago.inc"
> >-
> >-require ${DBUS_ARAGO}

