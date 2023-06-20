Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67957EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 18:44:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2220.1687286683946658675
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 11:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k7aYtGna;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KIieb9088881;
	Tue, 20 Jun 2023 13:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687286680;
	bh=CRAgguVYvaun5bu7DrjWBVK8YGVzJD4v5glrJ4SZnHo=;
	h=Date:To:CC:From:Subject;
	b=k7aYtGnazTXszlI7ePkJ90GlhGaJHEBTBYagRXsaBcOIb+sQeNJTxHly1Y2MFDaU0
	 A9WJhFuyAOYk1k7DKwXScK/ezTdyrpBx+8M9evFQqELHCce7bT9/XCGhpMRJ7oJ00c
	 QrgPk5mS3p44+IBF5YqcAUbb9JYo7kWL8JY83+WE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KIieMV056142
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 13:44:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 13:44:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 13:44:39 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KIidWR115762;
	Tue, 20 Jun 2023 13:44:39 -0500
Message-ID: <937ef202-c3dc-6e5b-963f-def28a4d130b@ti.com>
Date: Tue, 20 Jun 2023 13:44:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        Andrew
 Davis <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
Subject: [DISCUSSION] Flutter Enablement - Meta-Arago vs PSDK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 18:44:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14659

Hey,

People keep asking about flutter and I know there has been effort to 
explicitly enable it for 9.0.

Should it belong in meta-arago or meta-processor-sdk?

I can see an argument for both, it essentially being another widget 
based UI toolkit, it should belong in the same layer that enables and 
adds dependencies for Qt. On the other hand, it's a higher level tool 
with some interesting dependencies that not every SDK may want to inherit.

What do we think?

Regards,
Randolph Sapp

