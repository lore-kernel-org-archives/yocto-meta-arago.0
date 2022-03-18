Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC66C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:35:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.8962.1647606929549497314
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SyeWzBsv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICZPp8002338;
	Fri, 18 Mar 2022 07:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647606925;
	bh=l8ZNOaKHUtsA37kFQ+hvO+lzqoYvl3VtWbsEgXVZQ14=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SyeWzBsv0zXTAoHCd+i90z6quk60vHSBIqqJJkxGJGb3uWBq/cy4RDJ3dntitctPe
	 u121euEriM2wBaO2xpSClMg0u7vDSfoLlMqtxWmczgePq+KTdz5MRQQsFuk7UpeYv/
	 /0kBXTVkyhoRQQjhPd4o/gvagcK4z9Pamf0REr6g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICZP64038393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:35:25 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:35:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:35:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICZOfT124912;
	Fri, 18 Mar 2022 07:35:24 -0500
Date: Fri, 18 Mar 2022 07:35:24 -0500
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
Subject: Re: [meta-arago] [dunfell/master PATCH 3/6] packagegroups: Add a new
 bootstrap package group
Message-ID: <20220318123524.vbyihvzno35zusic@scariness>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-4-nm@ti.com>
 <20220311174309.GC1766@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311174309.GC1766@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13631

On 12:43-20220311, Denys Dmytriyenko wrote:
> On Tue, Mar 08, 2022 at 08:13:13PM -0600, Nishanth Menon via lists.yoctoproject.org wrote:
> > Lets try and create a minimal package group for board bringup. Lets
> > call this basic system necessary for board bringup as "bootstrap".
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >  .../packagegroup-arago-bootstrap.bb           | 55 +++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> > new file mode 100644
> > index 000000000000..e5b670a16b73
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> > @@ -0,0 +1,55 @@
> > +DESCRIPTION = "Task to install additional utilities for initial board bringup"
> 
> Need to start setting SUMMARY by default, not DESCRIPTION. DESCRIPTION is an 
> alternative longer explanation for the package, otherwise it's the same as 
> SUMMARY. Yes, I know many recipes still use the old convention, but need to be 
> fixed.

Aaah, thanks.. will fix.

> > +LICENSE = "MIT"
> > +PR = "r0"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +inherit packagegroup
> > +
> > +PACKAGES =+ "${PN}-extra"
> 
> I don't see ${PN}-extra being used/populated anywhere here.

Will drop - carry over from copy paste.


[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

