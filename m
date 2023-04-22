Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5189CC77B78
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:07:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.17436.1682201243696116685
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 15:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LYGdH0QQ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33MM7Mio016019;
	Sat, 22 Apr 2023 17:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682201242;
	bh=MEAH9Wv9AUai6FHc55lcvCuU2fBk/Xdtss+C4IHy6Pw=;
	h=From:To:Subject:Date;
	b=LYGdH0QQ/uzwOZ8xpBOe2SdeRZUo+HO5FEwsx+WBS5sO+17qso54a1dka9iauygql
	 HEec31bG7VkFnRL5NbqzdcmfZO/kxAJxCDS9HpfmI3tPtfsB4CL7tSdl6HmazeRYGD
	 G1h3Fcinixkc9ASFe62DoKtIn9G5Zg6EImyb2MhQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33MM7MtT111488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Apr 2023 17:07:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 22
 Apr 2023 17:07:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 22 Apr 2023 17:07:22 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33MM7MTN009489;
	Sat, 22 Apr 2023 17:07:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pqLO6-0002hp-7y; Sat, 22 Apr 2023 17:07:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2 0/2] Add support for ltp-ddt_20230127
Date: Sat, 22 Apr 2023 17:07:20 -0500
Message-ID: <20230422220722.10360-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 22:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14332

The internal testing team would like to move to this version as the
basis for our internal ltp-ddt.  So we need to capture the recipe
settings for this version from oe-core master and provide a new version
for us to overload.

v2: Add missing space to :append line in ltp-ddt_20230127.bb

Ryan Eatmon (2):
  ltp: Add version 20230127 from oe_core master
  ltp-ddt: Add support for version 20230127

 .../ltp-ddt/ltp-ddt_20230127.bb               |  47 ++++++
 ...002-Remove-OOM-tests-from-runtest-mm.patch |  35 +++++
 .../ltp/ltp/disable_hanging_tests.patch       |  27 ++++
 .../recipes-extended/ltp/ltp_20230127.bb      | 140 ++++++++++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb

-- 
2.17.1


