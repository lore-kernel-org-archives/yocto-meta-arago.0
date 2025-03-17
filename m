Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0A5C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 21:10:25 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2429.1742245822550954244
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 14:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=utsEO5ST;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HLAKQL2880562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 16:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742245820;
	bh=IY8YBcbNa/fWMqdY10SKeiH6w9v4AXzNimwk80Pt3wQ=;
	h=From:To:CC:Subject:Date;
	b=utsEO5ST1ZWHj43sA3toc0hGV/sJ6jm16bcNXb6lXURapkqk7ylOrMpKy6xIY9q+r
	 t99tCKvbncdGCvLg2GlDzlVvNV1goJ803lfUtgC8bJBLHXk0mZ4UlBhnRVd1+N3EQg
	 7aTyYrmdkE+p+9O3VsWL7GETH9i3xnUl/greMXtA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HLAKrW058698;
	Mon, 17 Mar 2025 16:10:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 16:10:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 16:10:20 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HLAKcS071998;
	Mon, 17 Mar 2025 16:10:20 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <a-christidis@ti.com>, <afd@ti.com>
Subject: [meta-arago][master][PATCH 0/2] Time deamon headaches
Date: Mon, 17 Mar 2025 16:10:09 -0500
Message-ID: <20250317211015.4052273-1-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:10:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16078

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


