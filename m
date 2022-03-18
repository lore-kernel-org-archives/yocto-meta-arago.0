Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDA8C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 17:48:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.13039.1647625702987255857
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 10:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SGkY1WKN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IHmJde074684;
	Fri, 18 Mar 2022 12:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647625699;
	bh=l12ta4uLbkd1US3TipmAQk0w3+XF5ZEueOv6c598/4g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SGkY1WKNFMiPgRlEBcx0/Fzda0swdEvR1PtrToJsGnoOTMagfjhBxrAEK+0fNFsgc
	 fQwUwvif2b/6YCKcGvPByT6eUVf6+U4xYJg7XixOGj9NBdFT0daLHXSvKeKnBYFHbh
	 uOgnUfII5/OXCCyeS0Dr9308xoV4gPZK20YtSWzs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IHmJXv027561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 12:48:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 12:48:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 12:48:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IHmHLH019678;
	Fri, 18 Mar 2022 12:48:18 -0500
Date: Fri, 18 Mar 2022 12:48:17 -0500
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [oe-layersetup PATCH] configs: Switch github repos from git to
 https
Message-ID: <20220318174817.uosngm5oo2ppbyau@quotable>
References: <20220318172714.17656-1-nm@ti.com>
 <0ef8a8f1-cfd3-7e60-8922-fd271ae255b0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0ef8a8f1-cfd3-7e60-8922-fd271ae255b0@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 17:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13658

On 12:37-20220318, Ryan Eatmon wrote:
> 
> What about all of the other configs?

Did'nt want to touch the baseline configs. I am assuming folks will
probably need to do the following in ~/.gitconfig

[url "https://github.com"]
        insteadOf = git://github.com

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

