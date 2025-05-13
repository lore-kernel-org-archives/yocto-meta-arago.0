Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6F3C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 17:14:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.81761.1747156484432120506
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 May 2025 10:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64E5140C8A;
	Tue, 13 May 2025 17:14:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTso7d8yH1K0; Tue, 13 May 2025 17:14:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 30B2C40A30;
	Tue, 13 May 2025 17:14:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 91205167F96; Tue, 13 May 2025 13:14:39 -0400 (EDT)
Date: Tue, 13 May 2025 13:14:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: meta-arago@lists.yoctoproject.org, "Menon, Nishanth" <nm@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago] [master/scarthgap][PATCH] omapconf: use proper
 definition of boolean type
Message-ID: <20250513171439.GQ18383@denix.org>
References: <20250507231810.2027418-1-denis@denix.org>
 <fedabe4b-451e-46e5-bf4a-178e35c95638@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fedabe4b-451e-46e5-bf4a-178e35c95638@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 May 2025 17:14:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16196

On Thu, May 08, 2025 at 09:01:36AM -0500, Andrew Davis wrote:
> On 5/7/25 6:18 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Newer versions of GCC and C standard have bool as a built-in
> >keyword - use a standard stdbool.h header to properly handle it.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  ...se-proper-definition-of-boolean-type.patch | 41 +++++++++++++++++++
> >  .../recipes-devtools/omapconf/omapconf_git.bb |  2 +
> >  2 files changed, 43 insertions(+)
> >  create mode 100644 meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch
> >
> >diff --git a/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch b/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch
> >new file mode 100644
> >index 00000000..e1a29c9c
> >--- /dev/null
> >+++ b/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch
> >@@ -0,0 +1,41 @@
> >+From c52280d923c167032a84f1c67574eb340e38572c Mon Sep 17 00:00:00 2001
> >+From: Denys Dmytriyenko <denys@konsulko.com>
> >+Date: Wed, 7 May 2025 17:03:20 -0400
> >+Subject: [PATCH] Use proper definition of boolean type
> >+
> >+Newer versions of GCC and C standard have bool as a built-in
> >+keyword - use a standard stdbool.h header to properly handle it.
> >+
> >+Upstream-Status: Inactive-Upstream
> 
> Are you sure? I bet +Nishanth would take this patch if you made the PR.

Sure, I can try submitting it upstream as well.


> >+
> >+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >+---
> >+ arch/arm/mach-omap/common/statcoll/sci.h | 8 +-------
> >+ 1 file changed, 1 insertion(+), 7 deletions(-)
> >+
> >+diff --git a/arch/arm/mach-omap/common/statcoll/sci.h b/arch/arm/mach-omap/common/statcoll/sci.h
> >+index 4134c00..1a393b4 100644
> >+--- a/arch/arm/mach-omap/common/statcoll/sci.h
> >++++ b/arch/arm/mach-omap/common/statcoll/sci.h
> >+@@ -48,17 +48,11 @@
> >+ #ifndef SCI_H
> >+ #define SCI_H
> >+
> >++#include <stdbool.h>
> >+ #include <stdlib.h>
> >+ #include <stdint.h>		// The library uses C99 exact-width integer types
> >+ #include "sci_dev.h"
> >+
> >+-#if !defined(__bool_true_false_are_defined) && !defined(_STM_Logging)
> >+-typedef enum {
> >+-	false = 0,
> >+-	true = 1
> >+-} bool;
> >+-#endif
> >+-
> >+ #ifdef _STM_Logging
> >+ #include "StmLibrary.h"
> >+ #endif
> >+--
> >+2.25.1
> >+
> >diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
> >index 175c6771..dad8ece0 100644
> >--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
> >+++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
> >@@ -13,6 +13,8 @@ SRCREV = "ff07b6992bacb1e1586c72b7d2be469caee4a347"
> >  SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=https;branch=${BRANCH}"
> >+SRC_URI += "file://0001-Use-proper-definition-of-boolean-type.patch"
> >+
> >  S = "${WORKDIR}/git"
> >  do_compile () {

