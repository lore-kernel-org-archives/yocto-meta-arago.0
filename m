Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016EFCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:08:36 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.36461.1758146907327495695
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v8GItPAE;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HM8QE51708556
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 17:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758146906;
	bh=f2lteHbjYglqbtVhSVuLMd/r6w+Zl5L4nHmoTdnIPO4=;
	h=From:To:Subject:Date;
	b=v8GItPAE8glwNI2l07JXx00SIb8ha76rQMd0eDZ5ZJEBwAnMOZ4swyJP/uuwmN6/G
	 C3a9Ol0k4UFIwyHB8Wk4cCJPQgvzSZofbD1HlllAUS2TIe6Strw9D6ApylLFOOFE7w
	 w2dJA+yl0moIYADoOM1TuWuVgLirJ9MKZ8XCZ6bY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HM8QBB1637671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 17:08:26 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 17:08:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 17:08:26 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HM8Qo94055207;
	Wed, 17 Sep 2025 17:08:26 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 0/2] Add libsdl2 test support
Date: Wed, 17 Sep 2025 17:08:24 -0500
Message-ID: <20250917220826.2078836-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16587

From: Antonios Christidis <a-christidis@ti.com>

Build and package libsdl2 tests.

Working on merging similar changes to oe-core master, but in the
meantime the tests are needed in scarthgap. The oe-core patch
will not be back-ported to oe-core scarthgap due to LTS process.

Kind Regards,
Antonios

Antonios Christidis (2):
  libsdl2: Add tests package
  ti-test: Add libsdl2-tests to packagegroup

 meta-arago-test/recipes-core/packagegroups/ti-test.bb       | 1 +
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 5 +++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 3 files changed, 10 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend

-- 
2.34.1


