Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382F6C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 17:41:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.108717.1680630104181680017
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 10:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EdNeZEsE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 334HfetI018495;
	Tue, 4 Apr 2023 12:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680630100;
	bh=a6EabqblYkfu9+tIpLWqmtrPVzwpoZyTIT7PzmSw7YM=;
	h=From:To:CC:Subject:Date;
	b=EdNeZEsEuIF+45cfUbrCr5yG95fZEJeq1MUf9f70CMBxrZatH6hmZt9e5kB/9/eRn
	 faotuC7J4Kud90HKe5kYdDIbf9hx+XmFdQHFFc8kcvXxu9dyA0DQTjULTmM0mgv/1c
	 UhjLUu61N76DhFqZK6eNBX/T1Pbe9Iy6q8pxlLI8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 334HfeLG077075
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Apr 2023 12:41:40 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 4
 Apr 2023 12:41:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 4 Apr 2023 12:41:40 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 334HfeZl043917;
	Tue, 4 Apr 2023 12:41:40 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <andrewd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH] meta-arago-distro: linux-firmware: remove cadence firmware
Date: Tue, 4 Apr 2023 12:41:38 -0500
Message-ID: <20230404174138.2060859-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Apr 2023 17:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14295

Cadence firmware is already being conditionally packaged in meta-ti
as cadence-mhdp-fw. Remove cadence firmware from this package.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Sending this for dunfell as well because it's still relevant I guess.

 .../recipes-kernel/linux-firmware/linux-firmware_%.bbappend      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
index 3472f267..8c0af066 100644
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -14,4 +14,5 @@ RDEPENDS_${PN}-ibt-18 += "${PN}-ibt-license"
 
 do_install_append() {
 	rm -rf  ${D}/lib/firmware/ti-connectivity/
+	rm -rf  ${D}/lib/firmware/cadence
 }
-- 
2.39.2


