Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F73C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:29:42 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.78894.1705940972252955873
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 08:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SzJ636ej;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-ravikumar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40MGTVEP098318
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 10:29:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705940971;
	bh=HTTJlzGtYgVWaVDtgPFgmn8b8xKAQgEajKfxoEHviY0=;
	h=From:To:CC:Subject:Date;
	b=SzJ636ejgcXpzNvAJu2Sif+4SyyBeBLxqXCYWaJKrXQCGQy05cCE8DWDW+cpXPMg4
	 GqkDHhyWmRYHRaWNqsUzk/zchtmYrfAZKe5rnx4Ee4n88Ql7jrJCmcNV1XjfME5FT5
	 r3cN0o+xQS/oT4cJ7M+sIn2L9IRlGRcnpwdRo68c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40MGTVmX006696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 10:29:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 10:29:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 10:29:30 -0600
Received: from localhost (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40MGTUgX025435;
	Mon, 22 Jan 2024 10:29:30 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <j-luthra@ti.com>, <denys@ti.com>,
        <r-ravikumar@ti.com>, <b-brnich@ti.com>, <p-mantena@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 0/2] Increase min buffers or CSI capture
Date: Mon, 22 Jan 2024 21:59:15 +0530
Message-ID: <20240122162917.822825-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Jan 2024 16:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15077

While at it, add same set of gstreamer patches across the Machines
to make it easier to maintain

Rahul T R (2):
  gstreamer1.0-plugins-good: Maintain same set of patches for all
    machines
  gstreamer1.0-plugins-good: Add patch to increase min buffers for CSI
    capture

 ...1-gstv4l2object-Increase-min-buffers.patch | 29 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.%.bbappend | 20 ++-----------
 2 files changed, 31 insertions(+), 18 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstv4l2object-Increase-min-buffers.patch

-- 
2.34.1


