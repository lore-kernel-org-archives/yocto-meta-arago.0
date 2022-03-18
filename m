Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D09C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:34:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9222.1647606865801097584
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P6rMi1T4;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICYLlo016359;
	Fri, 18 Mar 2022 07:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647606861;
	bh=efnoquRRy0Puqw4FGZhlAYiTE/QLswXMMMnwidGqPew=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=P6rMi1T4elmftHyAu5FPhfM6AZXRkfTyLGr6vpjCEkgTx4HKqysOOVi4xDuXqoXpW
	 r+KN1aUM74DhMjDsasDu/5rhvxpjhfF7kssJ7thW/NqSGzoqhZaPTL45BMv6kDfIqm
	 RNbNo2sWKLlCFRqWAEXtbwT73xJJxtKWiKw1tIII=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICYLtB036177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:34:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:34:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:34:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICYKI4123161;
	Fri, 18 Mar 2022 07:34:20 -0500
Date: Fri, 18 Mar 2022 07:34:20 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman,
 Kevin" <khilman@ti.com>,
        "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar,
 Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [dunfell/master PATCH 2/6] tisdk-tiny-image: Add some usability
 notes
Message-ID: <20220318123420.vlyl2psuqxkbcnk2@engulf>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-3-nm@ti.com>
 <20220311173850.GB1766@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311173850.GB1766@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:34:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13630

On 12:38-20220311, Denys Dmytriyenko wrote:
> On Tue, Mar 08, 2022 at 08:13:12PM -0600, Nishanth Menon wrote:
> > Lets clarify the usage of tiny image as something meant as a building
> > block and not something that folks can directly use.
> 
> It still can be directly used though - see below.
> 
> 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >  meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> > index af04b76bc588..e9abe31894ff 100644
> > --- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
> > @@ -1,3 +1,8 @@
> > +# Arago TI SDK super minimal base image for initramfs
> > +# This will not get a completely usable image since kernel will be missing
> 
> I'd like to rephrase this a bit. The kernel is not in /boot of the rootfs, but 
> it will be deployed and there are still many other ways to load it separately 
> (tftp, separate boot partition, etc) and boot this image.

How about: This image does not package the kernel in the standard /boot
of rootfs, instead, it provides a template for allowing kernel to be
deployed elsewhere (tftp/separate boot partition/jtag log etc..) and
boot the image.


Thinking again, I should probably use a SUMMARY: and DESCRIPTION: tag to
help standardize the comment help sections (which could then be queried
by oe-layer-setup for proper list of images)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

