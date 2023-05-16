Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED6AC7EE25
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:41:03 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.26947.1684255255855879849
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H1lzqTJe;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGesj3066464;
	Tue, 16 May 2023 11:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255254;
	bh=bIMPoPFiTHppYSNJkw2m20a10PaM1P1MGsJfH+uvtc8=;
	h=From:To:Subject:Date;
	b=H1lzqTJe/0+ykDeXlUETxiMOLLFb+pPqNN6X48s5JM9LRrCnhQEef2uLjBtjH2OqM
	 4aT/6U/ZGjpaxPkLJ+f1WijEhcaBq1WBeTLDMhiI3SPNS0s94vw7bW1+W0O6f+DQ2v
	 eE0F8BZIpBOY5BRrX2Matlmj1EVmAuEPMkftO/6U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGesAH004957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:40:54 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:40:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:40:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGesWe044938;
	Tue, 16 May 2023 11:40:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxjK-00037z-8Y; Tue, 16 May 2023 11:40:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 0/6] LTS sync up
Date: Tue, 16 May 2023 11:40:48 -0500
Message-ID: <20230516164054.11978-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 May 2023 16:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14406

This patch series is a repost of a number of patches that we have been
testing as part of our LTS migration to kernel 6.1 and uboot 2023.

LCPD Automation Script (1):
  ltp-ddt: Intial LTS migration version

Ryan Eatmon (5):
  tisdk-core-bundle: Fix am65xx sysfw names
  ltp: Add version 20230127 from oe_core master
  ltp-ddt: Add support for version 20230127
  ltp-ddt: Remove older version.
  branding-core: Temporarily disable GC320 driver

 .../conf/distro/include/branding-core.inc     |   4 +
 .../recipes-core/images/tisdk-core-bundle.bb  |   2 +-
 ...tp-ddt_20210524.bb => ltp-ddt_20230127.bb} |   6 +-
 ...002-Remove-OOM-tests-from-runtest-mm.patch |  35 +++++
 .../ltp/ltp/disable_hanging_tests.patch       |  27 ++++
 .../recipes-extended/ltp/ltp_20230127.bb      | 140 ++++++++++++++++++
 6 files changed, 210 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20210524.bb => ltp-ddt_20230127.bb} (77%)
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/0002-Remove-OOM-tests-from-runtest-mm.patch
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp/disable_hanging_tests.patch
 create mode 100644 meta-arago-extras/recipes-extended/ltp/ltp_20230127.bb

-- 
2.17.1


