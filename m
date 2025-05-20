Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8278C54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 21:46:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2925.1747777572050893399
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 May 2025 14:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tU3Id7Qs;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54KLkAMX1289544;
	Tue, 20 May 2025 16:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747777570;
	bh=wtK+a/PvIXVgwS0OL4ZFv/vctrQ1CfSdLM3vxa039dE=;
	h=From:To:Subject:Date;
	b=tU3Id7QsJftDCvF0wpgT4L8rai6fcvfBikRjDh8MpqtFYt93J9co2q/K38RYAoS1I
	 OSc95ifw8bJca4MDSLno4mg3L11eHEPdoL0rxYiGNW6k7N5VkkTjBnK5o+iFU9jUbU
	 HP0twyvwTAI0FotXiyXWRMGjhIBUg5sZxFCbJY/c=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54KLkAmN2250582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 20 May 2025 16:46:10 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 May 2025 16:46:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 May 2025 16:46:10 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54KLkAxj071517;
	Tue, 20 May 2025 16:46:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uHUmo-0004Ur-33; Tue, 20 May 2025 16:46:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] conf: arago.conf: Set DEFAULTTUNE for armv7a to fix qtbase build issue
Date: Tue, 20 May 2025 16:46:10 -0500
Message-ID: <20250520214610.17242-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 May 2025 21:46:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16231

There is a build issue with qtbase on armv7a platforms.  It looks like
th compiler is trying to create assembly calls that are missing ARM
registers:

{standard input}: Assembler messages:
{standard input}:7280: Error: ARM register expected -- `ldrex r1,[s16]'
{standard input}:7282: Error: ARM register expected -- `strex r2,r1,[s16]'

Changing the DEFAULTUNE to not use the neon extensions seems to fix the
issue.  We are going to temporarily carry an override for the amv7a
platforms to lower the tune.  We are working to recreate this issue on
poky so that we can submit bug reports to try and get this fixed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6287cc44..f74d13ad 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -142,3 +142,8 @@ SKIP_META_VIRT_SANITY_CHECK = "1"
 # included by default. If you enable any of those codecs you should check
 # if the below acceptance flags still work for your software distribution
 LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
+
+# Temporary hack to fix a compile issue on Armv7 platforms with qtbase.
+# We are working to reproduce this error and submit bug reports for this
+# issue.
+DEFAULTTUNE:armv7a = "armv7athf"
-- 
2.17.1


