Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8786C3DA40
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 16:38:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.17686.1686760719090689546
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 09:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LEJLAWvU;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcQ8E089434;
	Wed, 14 Jun 2023 11:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686760706;
	bh=dbZwUI96uOXJ4+LYG/6TJXFCNVYRzMZNoM3whAPOrSM=;
	h=From:To:CC:Subject:Date;
	b=LEJLAWvURKGsqtKTSP11X9s2JJ3pyF3JdLG9arSTfEqEMtnHM1hGVytPKKNjKLMA1
	 CUt7O37XGKf89ZxhdnBpkVj0vgOQAR4YgyYnEMyeEyMVC2J8Q3/I6ajrbw92V5yxAd
	 eGeU08+JjDiqYYVtyeEmPALy6J4ITysSsjN4EgbM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EGcQOx022789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 11:38:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 11:38:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 11:38:25 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EGcPZV060182;
	Wed, 14 Jun 2023 11:38:25 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 0/4] Fix some configuration options for systemd
Date: Wed, 14 Jun 2023 11:38:10 -0500
Message-ID: <20230614163814.3562779-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 16:38:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14623

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


