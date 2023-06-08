Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCB8C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 13:05:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8445.1686229509083505679
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 06:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XctO7GQC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358D54le112201;
	Thu, 8 Jun 2023 08:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686229504;
	bh=fkrzFhNIrXzfwCZ8zFISv5MWUWnSW+zghSFij/Phg9s=;
	h=From:To:CC:Subject:Date;
	b=XctO7GQCoSoJgRCiO/4F+ZZku5r2yxbejhL1gCSk2xSUQVPWvfcZpFcVOyd9m9nfn
	 2djnPHrWNG58tof3rBqmBxnbcOIPg3J5DhnOFYLd0Ry8eHjZ8FcSt6QL6D/q33MEFH
	 QCgvyOoQFjRc2XvqNbzd73tMU5ALllQg2P2TF19g=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358D53gU016533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 08:05:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 08:05:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 08:05:03 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358D52CW065869;
	Thu, 8 Jun 2023 08:05:03 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][kirkstone/master][RFC] Enable sudo in meta-arago
Date: Thu, 8 Jun 2023 18:33:56 +0530
Message-ID: <20230608130356.341469-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 13:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14537

We plan to add sudo in meta-arago as weston will now launch with normal user. sudo is required for
Demo Store which runs on top of weston and will need sudo to set some docker proxies before actually starting the
application.

I see openembedded-core provides sudo under meta/recipes-extended but needed comments/opinion
regarding this topic to add "sudo" before actually starting to work on it.

--
Chirag Shilwant

