Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52D3CAC5A9
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:18:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.4783.1758309530400234215
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TfeyMIHC;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJInED306869
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758309529;
	bh=7HRKBDHlPt7d2IZX/GfPdn3ZwmGq2UeQ3MqfTahgQYw=;
	h=From:To:Subject:Date;
	b=TfeyMIHCyxTHC7CPaDhyOSvPpYw8KPiDYU9I/8w9peM07V2w0+bYxf6i1uJS0cB9F
	 2LJJbX9dkBNjvSzMO2506jO9A8p+gmoqaLjJqI978ayakYGk0cDxhDduG3IbwlyXfc
	 9pFFU//Zk4kxBw9LQlm/fJxUyKQso3MlB1Zhfq0M=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJInaM2551933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:18:49 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:18:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:18:49 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJInav3063676;
	Fri, 19 Sep 2025 14:18:49 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v2 0/2] Add libsdl2 test support
Date: Fri, 19 Sep 2025 14:18:47 -0500
Message-ID: <20250919191849.2622310-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 19:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16602

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
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 3 files changed, 11 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend

-- 
2.34.1


