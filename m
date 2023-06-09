Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E353EC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 19:24:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3398.1686338665388925830
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 12:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ow5HGZxP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359JOLGW081935;
	Fri, 9 Jun 2023 14:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686338661;
	bh=u1c0tJsIi5i5Wf7SZR9RXkdQOGPmJNAwyv5T865Y/s0=;
	h=From:To:CC:Subject:Date;
	b=ow5HGZxPjU195mUUEbnPhG0SCpyOwtrKoG4Y9ZJjlQhDX7sJO2ZUFuKbqrwhlUzE+
	 4ught/5nBDvl1fazJU9+k+Ezq0MYrq2WJyUxoh7S9FxI93jTsL5MCU3LGZd1HisIc/
	 iHT50Ee9fCFBN3Bi021YCD74pw+E8AHCAGCliTn0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359JOL5J058484
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 14:24:21 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 14:24:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 14:24:21 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359JOLEP060690;
	Fri, 9 Jun 2023 14:24:21 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCHv2 0/3] Fix some configuration options for systemd
Date: Fri, 9 Jun 2023 14:24:12 -0500
Message-ID: <20230609192415.3210941-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 19:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14584

From: Randolph Sapp <rs@ti.com>

Fixing up some systemd stuff. Using the auto getty generator built into
systemd instead of the external oe-core getty service.

Also drop the duplicate/invalid useradd entries in the systemd append.

This should be all that's required to squelch the endless serial getty
start/stop logs for systemd. There's probably some work required for
sysvinit as well. Should just be setting SERIAL_CONSOLES_CHECK =
$SERIAL_CONSOLES or something along those lines.

Still not sure how I feel about having inactive serial console
definitions in a bsp layer but if we don't define it at all then oe-core
will just blindly assume we wanted a console on ttyS0. That's especially
problematic for the init systems unable to generate getty scripts
automatically. SERIAL_CONSOLES_CHECK at least fixes the sysvinit
behavior.

Randolph Sapp (3):
  systemd: drop the useradd params
  arago.conf: add serial-getty-generator to systemd
  systemd: move packageconfig appends to distro config

 meta-arago-distro/conf/distro/arago.conf                  | 2 +-
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.41.0


