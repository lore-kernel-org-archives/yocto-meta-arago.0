Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D545EC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:39:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.9261.1647607156615020622
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lvtiGSwn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICdEBe018299;
	Fri, 18 Mar 2022 07:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647607154;
	bh=7S9bOc0ykavYoZ0JYUf1n+uTDK3BhTcqQWyqvBQrip0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lvtiGSwnlogboApqyvQ7HViu5BOozwGKozDSkIjgE+9Mp1FUzW6RCTJQioTukro2J
	 UNA+zFe20csBHRGs5eqIJFpYe5pomKF5PM8sp3uvvVRCE3stQfWwwigsoSFmfuWGju
	 SgXqkfJwNvSGyjAC85FhhZh9nZ/mccjTMUUeObbE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICdEcB130657
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:39:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:39:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:39:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICdEqE108161;
	Fri, 18 Mar 2022 07:39:14 -0500
Date: Fri, 18 Mar 2022 07:39:14 -0500
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
Subject: Re: [meta-arago] [dunfell/master PATCH 6/6] recipes-core: images:
 Introduce tisdk-bootstrap-image
Message-ID: <20220318123914.w5d4vd54vlnmq5hw@paycheck>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-7-nm@ti.com>
 <20220311213430.GG1766@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311213430.GG1766@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:39:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13635

On 16:34-20220311, Denys Dmytriyenko wrote:
[...]

> > +
> > +IMAGE_INSTALL += " \
> > +	packagegroup-arago-bootstrap \
> > +	kernel \
> 
> This should probably be kernel-base. There's no package called just kernel, 
> but rather kernel-<version> which is kernel-base in disguise :)

Woops.. thanks a bunch. will fix.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

