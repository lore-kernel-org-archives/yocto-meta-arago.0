Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9121C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 20:48:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5234.1686257277499571143
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 13:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c2MhlvvI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358KlrHC085962;
	Thu, 8 Jun 2023 15:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686257273;
	bh=diclRLQ+I2kntlGYSqYmSjaDPCT+bZRmridW+WhJqIo=;
	h=From:To:CC:Subject:Date;
	b=c2MhlvvIWMRLvimfZy90ZyWvXF1ninUNZXKYQRHFsNXaSS7XNa2NbNTpcMwVMROQr
	 G+dPLDXXMUbYdDBK9IJRUnaZFZEBJftb9vGWi2GraQCsaeQSt7+ef5g24iebs+W/Zv
	 jLy7GiRnBYH2TaO5VtduCTCmgssb/1bzBPJ4qG4U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Klruf016402
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 15:47:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 15:47:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 15:47:53 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358KlrJw007568;
	Thu, 8 Jun 2023 15:47:53 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 0/2] Fix some configuration options for systemd
Date: Thu, 8 Jun 2023 15:47:50 -0500
Message-ID: <20230608204752.2060719-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 20:48:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14556

From: Randolph Sapp <rs@ti.com>

Fixing up some systemd stuff. Using the auto getty generator built into
systemd instead of the external oe-core getty service.

Also drop the incorrect useradd entries in the systemd append.

This should be all that's required to squelch the endless serial getty
start/stop logs for systemd. There's probably some work required for
sysvinit as well. Should just be setting SERIAL_CONSOLES_CHECK =
$SERIAL_CONSOLES or something along those lines.

Still not sure how I feel about having "incorrect" serial console
definitions in a bsp layer but if we don't define it at all then oe-core
will just blindly assume we wanted a console on ttyS0. That's especially
problematic for the init systems unable to generate getty scripts
automatically. SERIAL_CONSOLES_CHECK at least fixes the sysvinit
behavior.

Randolph Sapp (2):
  systemd: drop the useradd params
  arago.conf: add serial-getty-generator to systemd

 meta-arago-distro/conf/distro/arago.conf                  | 1 +
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.41.0


