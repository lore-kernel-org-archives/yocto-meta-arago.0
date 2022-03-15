Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EC7C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 20:55:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.16618.1647377706783913096
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Mar 2022 13:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VL8ByKNp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22FKt5oF099525
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647377705;
	bh=JQYRYi7M2v82TT1CdU6DUQ1E0N0Z7vJA1zrkkBRdCAU=;
	h=Date:To:From:Subject;
	b=VL8ByKNpjSVUbtz/zuW7JLHzjtR/q5K+ppD8ePxHRrZgmp5AycpND38g5gecDv984
	 ib9mp2ZKzlYE4/AQ/61XJfzcUw0B7exnjjJPjeLTo8XQ4LY7Nkyo/qn8UTGSZ8Qsmx
	 n9NJXXPGjTW7/7TpBI8qqRrAt4fVYLjxVkekaf4U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22FKt5ts098573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:55:05 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Mar 2022 15:55:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Mar 2022 15:55:05 -0500
Received: from [10.250.35.106] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22FKt53m097598
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Mar 2022 15:55:05 -0500
Message-ID: <edd449b5-0ca9-e984-05fb-2e52615b962f@ti.com>
Date: Tue, 15 Mar 2022 15:55:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: Patchwork
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Mar 2022 20:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13629


All,

We are using the new Yocto Project Patchwork server to track the state 
of patches sent to this mailing list.  If you would like to know the 
status of a given patch, you may query the project at:

https://patchwork.yoctoproject.org/project/arago/list/


-- 
Ryan Eatmon
reatmon@ti.com

