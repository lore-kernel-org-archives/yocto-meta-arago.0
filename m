Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C443EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:35:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.19196.1686764119554063992
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tzBq+473;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ6Vg025012;
	Wed, 14 Jun 2023 12:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686764106;
	bh=VLWh963+Qi9Dalq0YtoJ+6ryDZOD9Fy+ySl/eP7u6x0=;
	h=From:To:CC:Subject:Date;
	b=tzBq+473mSPDViDQyiWAZVtAn7jAsH1K+/QVUuBPUAfwO92Zc7Ivl1tKcSLkEbPL2
	 r7PNp1CHYmRmW9H53yl3fDeHLH0+lZ8H7/B2ExCdlQeZXqPrOPqPGTJD1Ci+OvQJ1u
	 uPBGzB7vqbEQb+80M1XCB6WlJP6qV+o9FSjoJus0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EHZ6XR061264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:35:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:35:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:35:06 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EHZ6S5032184;
	Wed, 14 Jun 2023 12:35:06 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv3 0/4] Fix some configuration options for systemd
Date: Wed, 14 Jun 2023 12:34:58 -0500
Message-ID: <20230614173502.4007809-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 17:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14629

From: Randolph Sapp <rs@ti.com>

Fixing up some systemd stuff. Using the auto getty generator built into
systemd instead of the external oe-core getty service.

Also drop the duplicate (now invalid) useradd entries in the systemd
append.

This should be all that's required to squelch the endless serial getty
start/stop logs for systemd. There's probably some work required for
sysvinit as well. Should just be setting SERIAL_CONSOLES_CHECK =
$SERIAL_CONSOLES or something along those lines if the sysvinit getty
service even cares.

Still not sure how I feel about having inactive serial console
definitions in a bsp layer but if we don't define it at all then oe-core
will just blindly assume we wanted a console on ttyS0. That's especially
problematic for the init systems unable to generate getty scripts
automatically. SERIAL_CONSOLES_CHECK at least fixes the sysvinit
behavior.

This revision also drops some of the bite from the previous version. We
will not drop the sysvinit distro feature conditionally because the
other image targets using sysvinit do not currently signal that they
need sysvinit in a way that works nicely with this config.

Fix spelling.

Randolph Sapp (4):
  arago.conf: make things more readable and fix the virtuals
  systemd: drop the useradd params
  arago.conf: add serial-getty-generator to systemd
  systemd: move packageconfig appends to distro config

 meta-arago-distro/conf/distro/arago.conf           | 14 +++++++-------
 .../recipes-core/systemd/systemd_%.bbappend        |  4 ----
 2 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.41.0


