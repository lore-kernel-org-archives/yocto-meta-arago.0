Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC89C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:37:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.9167.1647607068374530401
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UFYA7uee;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICbk6h076502;
	Fri, 18 Mar 2022 07:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647607066;
	bh=0cdwYPeLwuJyUArV7PVuG3c7feJxm9qdQk37ufYI19A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UFYA7ueeBWGAvLVUuMYpY2xTp6msz5A54EM2LWt5Y3yao4gvSAj1bLAIY9IDS3Xgw
	 iVeZeCvwNoZKesCtvKSbB6H+O/WFnP7hGwi23bwQDYtLuxyRtdNzjIbOOWfFZcDUlt
	 CdmSC2nfxm4Dk9RUSYrdyag6bZHatAst+wkdxUsE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICbk2r042016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:37:46 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:37:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:37:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICbjxl110081;
	Fri, 18 Mar 2022 07:37:45 -0500
Date: Fri, 18 Mar 2022 07:37:45 -0500
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
Subject: Re: [meta-arago] [dunfell/master PATCH 5/6] recipes-bsp: Create a
 k3-bootstrap-initrd package
Message-ID: <20220318123745.xghtlsrrc4tox5ye@quality>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-6-nm@ti.com>
 <20220311180606.GE1766@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311180606.GE1766@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13633

On 13:06-20220311, Denys Dmytriyenko wrote:
> On Tue, Mar 08, 2022 at 08:13:15PM -0600, Nishanth Menon via lists.yoctoproject.org wrote:
> > Lets create an k3-bootstrap-initrd package that installs the cpio
> > generated in the correct locations.
> 
> This has k3 in the name - is it really k3-specific? Do you want to set 
> COMPATIBLE_MACHINE accordingly?

It was a mistake. We should'nt tie this to k3 specific - there is
nothing k3 specific in this.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

