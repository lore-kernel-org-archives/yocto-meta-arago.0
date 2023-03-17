Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6374C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 18:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.27000.1679076793322404742
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 11:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2268B40C8E;
	Fri, 17 Mar 2023 18:13:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HELo3m_t7MsL; Fri, 17 Mar 2023 18:13:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DA5C9409B0;
	Fri, 17 Mar 2023 18:13:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ED9241637C3; Fri, 17 Mar 2023 14:12:35 -0400 (EDT)
Date: Fri, 17 Mar 2023 14:12:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH v2] branding-ltsprep: LTS
 migration brand
Message-ID: <20230317181235.GF18050@denix.org>
References: <20230317161550.17946-1-reatmon@ti.com>
 <97a18261-4c62-5cc1-b7b2-4f00befadfd3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97a18261-4c62-5cc1-b7b2-4f00befadfd3@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Mar 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14262

On Fri, Mar 17, 2023 at 12:15:01PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/17/23 11:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >Add a new brand to control picking the next LTS version of kernel and
> >u-boot while they are under development.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> >v2: Make the versions wildcarded so that they actually match...
> >
> >  .../conf/distro/include/branding-ltsprep.inc          | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> >
> >diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> >new file mode 100644
> >index 00000000..0238327c
> >--- /dev/null
> >+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
> >@@ -0,0 +1,11 @@
> >+
> >+PREFERRED_VERSION_linux-ti-staging = "6.1%"
> >+PREFERRED_VERSION_linux-ti-staging-rt = "6.1%"
> >+PREFERRED_VERSION_linux-ti-staging-systest = "6.1%"
> >+PREFERRED_VERSION_u-boot-ti-staging = "2023.01%"
> >+
> >+# GPU support requires out-of-tree SGX and RGX drivers not available in until
> >+# LTS prep is complete.  fall back to software rendering
> >+MACHINE_FEATURES:remove = "gpu"
> 
> We can leave the MACHINE_FEATURES as is, that way we still build the GUI bits,
> only the below line is needed to switch to software rendering.

There's at least one demo in Arago that requires HW accelerated graphics and 
doesn't make sense with software rendering, hence it still checks for "gpu" 
machine feature.


> Otherwise, I would have preferred this patch the other way, have a new branding
> to use the old unsupported kernel. Either way this seems reasonable for now.

I guess we could switch Arago to default to 6.1, as long as we keep meta-ti on 
5.10 for the migration phase.


> Acked-by: Andrew Davis <afd@ti.com>
> 
> >+PREFERRED_PROVIDER_virtual/gpudriver = ""

