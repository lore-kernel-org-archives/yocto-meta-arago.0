Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2061C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 09:40:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.11119.1714470010805295748
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 02:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AOOFPsne;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43U9e5dv101158;
	Tue, 30 Apr 2024 04:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714470005;
	bh=JiyuwDsuwLc/rMntKX8+3v4n1PhhQtCxQ+Iw3uBKezI=;
	h=From:To:CC:Subject:Date;
	b=AOOFPsneKVj12m2amTekTMBumf0fZC1q1oXyM0W+282jfR9gW8njFDJiduipjSDAV
	 v6YXL/1bOL4EY917iSjUa6t9ucCMaBYPNTmQzG0uqiWwYNjtCqPZscfHQoTAEG/YhF
	 iZryCiw+JVLAphgnQJXIVHiNc1JqBCO1lPU0TWKI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43U9e5qS108066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 04:40:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 04:40:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 04:40:04 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43U9e4Ps026045;
	Tue, 30 Apr 2024 04:40:04 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
CC: <devarsht@ti.com>, <tomi.valkeinen@ideasonboard.com>, <a-limaye@ti.com>,
        <j-choudhary@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] kms++: update to the latest and bump version
Date: Tue, 30 Apr 2024 15:10:03 +0530
Message-ID: <20240430094003.196209-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Apr 2024 09:40:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15313

ltp-ddt scripts are using latest dmabuf utilities but the current
source code does not have that support in kms++.
Bump up the SRCREV to take into account the latest dmabuf changes.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index 2c0abaa7..bae03683 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://github.com/tomba/kmsxx"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-PV = "2.1"
+PV = "2.2"
 PR = "r1"
 
 BRANCH = "master"
 SRC_URI = "git://github.com/tomba/kmsxx.git;protocol=https;branch=${BRANCH}"
-SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
+SRCREV = "9ae90ce75478e49844cf984562db0dc1a074462f"
 
 DEPENDS = "drm fmt"
 
-- 
2.25.1


