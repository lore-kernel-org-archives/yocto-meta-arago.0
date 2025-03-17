Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2F9C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 21:10:25 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2428.1742245822292687636
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 14:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=K6rCsjPZ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HLAKSG2925241
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 16:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742245820;
	bh=rIhnViEGA2kX4NP552k4xVEHTnCjnUgUl60iGS0/yw4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K6rCsjPZV2+4gK1eNCknyyjW2YY85uLZp8kYbxl6o67OXfhgXC5Ly24FetEmqFhh6
	 Hi80FLcXuaaHB1dUYjakuS+7FbHcZUjrZ0R5LBDnFVNtfa0TkQj1bY+S2quqgg8ImU
	 p2Kxb45J/bvyiGlIVaWnR78sxckzTpdwHQyohAsM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HLAKi5030466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 16:10:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 16:10:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 16:10:20 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HLAKcT071998;
	Mon, 17 Mar 2025 16:10:20 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <a-christidis@ti.com>, <afd@ti.com>
Subject: [meta-arago][master][PATCH 1/2] timesyncd: remove invalid character
Date: Mon, 17 Mar 2025 16:10:10 -0500
Message-ID: <20250317211015.4052273-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317211015.4052273-1-rs@ti.com>
References: <20250317211015.4052273-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 52HLAKSG2925241
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 21:10:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16077

From: Randolph Sapp <rs@ti.com>

This config file has an invalid character causing systemd-timesyncd to
report an issue with the default config. Replace the invalid character
with a newline like the original config uses.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/timesyncd.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.con=
f b/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.conf
index a9f762b7..2de49281 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.conf
+++ b/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.conf
@@ -11,7 +11,7 @@
 # Defaults can be restored by simply deleting this file and all drop-ins.
 #
 # See timesyncd.conf(5) for details.
-=E2=80=8B
+
 [Time]
 NTP=3D0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
 FallbackNTP=3Dntp.ubuntu.com
--=20
2.48.1


