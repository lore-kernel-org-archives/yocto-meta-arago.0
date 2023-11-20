Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA90C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:49:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.16564.1700516980238408071
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 13:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=adU8vzPo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AKLnIcq056269;
	Mon, 20 Nov 2023 15:49:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700516958;
	bh=7b2AYW02D+HB+MMWYv4iiNV3vc815fRCT/UGgWpz/xM=;
	h=From:To:Subject:Date;
	b=adU8vzPodmKYFwl8cfrg6lXdwNcdUySnlI4qKfoEn7EQWoAsozBcO4qCBugUoqA4k
	 qV4VfyabEXhnEu86gLD17u+vn8XQhzRgZ9oxGG6BePmyCxNhxFppMPZN2h8PHEfmmn
	 cYq5kE/vblZwh6N7vPmsupCAxQi0VLK1EImh/uog=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AKLnIZC023357
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Nov 2023 15:49:18 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 Nov 2023 15:49:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 Nov 2023 15:49:17 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AKLnHfF071690;
	Mon, 20 Nov 2023 15:49:17 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1r5C8r-0004lf-Os; Mon, 20 Nov 2023 15:49:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] libdrm: Update patch for v2.4.117
Date: Mon, 20 Nov 2023 15:49:17 -0600
Message-ID: <20231120214917.18288-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Nov 2023 21:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15017

oe-core bumped the version and this patch needs fixing so that it
applies cleanly again.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../libdrm/0001-Add-option-to-run-a-test-indefinitely.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
index 4c62bab8..0172f8a4 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
@@ -44,8 +44,8 @@ index fc75383..8e59acc 100644
  	exit(0);
  }
  
--static char optstr[] = "acdD:efF:M:P:ps:Cvrw:";
-+static char optstr[] = "acdD:efF:M:P:ps:Cvrw:t";
+-static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:";
++static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:t";
  
  int main(int argc, char **argv)
  {
-- 
2.17.1


