Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D856E7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 19:50:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13137.1734810610791978995
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 21 Dec 2024 11:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S1275Fnc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLJo8jN631521
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Dec 2024 13:50:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734810608;
	bh=CLCVN63d8j+ISnsOCMOUyeAK3wNca8PuT9of1Bkf2DU=;
	h=From:To:CC:Subject:Date;
	b=S1275FncCjfN6sXHN6Q2Rr9CW8WQ6ymDNwWEljuyfgvW4IfcX62e0eTZat5bw3WT5
	 RVJPGtfUiyaUWFH7CuhQTwZ61LtoLe5EpwUeKEJ7BfOVsS+ExX5Bn1zG2pUENXxPVU
	 BIPqgAdQJ5X2YZkYZYOXNBEj0jt9w9leooM7i+2U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BLJo8EP053784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 21 Dec 2024 13:50:08 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 21
 Dec 2024 13:50:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 21 Dec 2024 13:50:08 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BLJo79L125173;
	Sat, 21 Dec 2024 13:50:07 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 0/1] Add Arm NN
Date: Sat, 21 Dec 2024 13:50:05 -0600
Message-ID: <20241221195006.395991-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 21 Dec 2024 19:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15681

Hello all,

This builds on ARM Compute Library to add an API for building and
running neural networks. This will be an intermederay for higher
level libraries such as ONNX Runtime and a TFLite Delegate.
These will be posted next.

Like the ACL recipe this really belongs in meta-arm, but will
live here as we work that, they can be dropped out when they
land in meta-arm.

Thanks,
Andrew

Andrew Davis (1):
  meta-arago-extras: Add recipe for Arm NN

 .../recipes-devtools/armnn/armnn_24.11.bb     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb

-- 
2.39.2


