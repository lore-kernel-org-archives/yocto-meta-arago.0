Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0648C0015E
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 18:53:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5063.1688064771821397323
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 11:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8B8440C30;
	Thu, 29 Jun 2023 18:52:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ah0yei9KBVef; Thu, 29 Jun 2023 18:52:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AE4B240031;
	Thu, 29 Jun 2023 18:52:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6C9B5163BB2; Thu, 29 Jun 2023 14:52:48 -0400 (EDT)
Date: Thu, 29 Jun 2023 14:52:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago] [master][PATCH] arago-prefs: pin down mbedtls
 version for open62541
Message-ID: <20230629185248.GY1518@denix.org>
References: <20230629182244.3533996-1-denis@denix.org>
 <c33f642a-acb0-9b9c-f51c-7a793daf6925@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c33f642a-acb0-9b9c-f51c-7a793daf6925@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 18:53:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14739

On Thu, Jun 29, 2023 at 01:26:10PM -0500, Ryan Eatmon wrote:
> 
> 
> On 6/29/2023 1:22 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Our patched version of open62541 uses entropy_poll.h header from mbedtls
> >that is no longer being exported by version 3.x, pin to version 2.x for
> >now.
> 
> 
> Competing patches...  which one will win?

Yeah, I saw your patches and since I've been carrying my change locally for 
several days, decided to send it out for completeness. Mine is very low-key 
and least invasive, but may not be the best one long-term...


> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> >diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >index 34c3c539..60d7838c 100644
> >--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >@@ -10,6 +10,10 @@ PREFERRED_PROVIDER_virtual/kernel:append = "${ARAGO_KERNEL_SUFFIX}"
> >  PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
> >+# open62541 requires entropy_poll.h which is not provided by mbedtls 3.x
> >+PREFERRED_VERSION_mbedtls = "2.%"
> >+PREFERRED_VERSION_nativesdk-mbedtls = "2.%"
> >+
> >  # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
> >  # application that does not have a GPLv3 license
> >  PREFERRED_VERSION_crda = "3.18"

