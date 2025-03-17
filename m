Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B312DC35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 21:01:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2335.1742245270826774728
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 14:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vv7r5RhO;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HL16GM2923814
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 16:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742245267;
	bh=IY8YBcbNa/fWMqdY10SKeiH6w9v4AXzNimwk80Pt3wQ=;
	h=From:To:CC:Subject:Date;
	b=Vv7r5RhOr4j8qlAEN9+Ld6+FQMZHAo+KEOa/F8Dhd1Yf8O09zkHsBBCNIVnOv6FWM
	 nckmic2sh+V/P8TCFCYQd6o1DWHg61Sexa4WTELI8PorTJGq8hDvEspf4T06a3n00y
	 Yo/3l2r1+rqdOYCHaxWVvkmYB5eDFMQ+/5TZZFX8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HL16bJ037371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 16:01:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 16:01:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 16:01:06 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HL16JY061285;
	Mon, 17 Mar 2025 16:01:06 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <a-christidis@ti.com>, <afd@ti.com>
Subject: [meta-arago][scarthgap][PATCH 0/2] Time sync headaches
Date: Mon, 17 Mar 2025 16:00:27 -0500
Message-ID: <20250317210038.3983636-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16075

From: Randolph Sapp <rs@ti.com>

These are patches fixing generic issues I found when debugging a system auth
problem related to device time being set prior to rootfs generation time.

These patches do not the fix to the issue described above and are not strictly
necessary, they are just useful little fixes to restore default behavior and fix
other warnings.

Randolph Sapp (2):
  timesyncd: remove invalid character
  systemd: remove sync-clocks service

 .../systemd/systemd/sync-clocks.service            | 14 --------------
 .../recipes-core/systemd/systemd/timesyncd.conf    |  2 +-
 .../recipes-core/systemd/systemd_%.bbappend        |  5 -----
 3 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/sync-clocks.service

-- 
2.48.1


