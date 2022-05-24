Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B256C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 21:22:09 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.15324.1653427324754866681
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 May 2022 14:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GUhADtJW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24OLM008039739;
	Tue, 24 May 2022 16:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653427320;
	bh=z/ZVrqer8YejiN88idFoHzMhmdBfsBHetCFE8f6qQu4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GUhADtJWc12gAca6srw0OnGdQ4KN0zAizujXT/Asklx0dQNqmr4RBqmG99GZU1w/G
	 1kx3ltbM1OTBKUWZO6H7UsxS7YxuJGCGeFyks09FvDTUCjxeUR/HJ9V5rSjzie1k1K
	 7oHpofqm2+32lPz/Xa7BDd+PtDd0C+3FxPhJQKUY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24OLM0wZ032392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 May 2022 16:22:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 24
 May 2022 16:21:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 24 May 2022 16:22:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24OLLxi3023166;
	Tue, 24 May 2022 16:21:59 -0500
Date: Tue, 24 May 2022 16:21:59 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] [dunfell PATCH] all: Stop using git://git.ti.com
Message-ID: <20220524212159.c3cxplnlacvrjpfz@panorama>
References: <20220524182634.12514-1-nm@ti.com>
 <20220524185847.GR9834@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220524185847.GR9834@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 May 2022 21:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13880

On 14:58-20220524, Denys Dmytriyenko wrote:
> And NAK here as well.


Uggh.. you are right. I did'nt test beyond the basic pull, but i can fix
them up for protocol and test before the next version being posted.


Thanks for calling me out.

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

