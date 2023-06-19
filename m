Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E2BEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 15:12:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9993.1687187564014897886
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 08:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oLH+v2iN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35JFCgtd090084;
	Mon, 19 Jun 2023 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687187562;
	bh=KI/2ZobrQ5PaMIufEVPXDKN4AvsbtZwQZglShar8coI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oLH+v2iNKZD3gJVZ84o9ue/c9vzgm0Use5DcQLj+pibHxGWIIFEO/U36SDqfiTByC
	 Dh+bcB8581T9ACm2Y2Q2rxmMdgJhLjgi8ClxWEXYsFGzX+tsg5Il+o5rZyhjG2/QDw
	 3f58tFMR3NIyw7ya+uEuRzLEQq1GPen0EOK6Flu0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35JFCgNB022487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 10:12:42 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 10:12:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 10:12:41 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35JFCgPV128973;
	Mon, 19 Jun 2023 10:12:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qBGYb-0004dJ-Qa; Mon, 19 Jun 2023 10:12:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH v2 2/3] kms++: Restore pybind11 support
Date: Mon, 19 Jun 2023 10:12:40 -0500
Message-ID: <20230619151241.17763-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230619151241.17763-1-reatmon@ti.com>
References: <20230619151241.17763-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Jun 2023 15:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14652

With the inclusion of the later pybind11 recipe we can now turn pybind11
support back on and build cleanly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Split this patch into two commits and reword commit message to
    match the same patch in master.

 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index eb39736c..2c0abaa7 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
 
 DEPENDS = "drm fmt"
 
-# New meson build system fails to find pybind11 in sysroot, disable for now
-#DEPENDS += "python3-pybind11"
-#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
+DEPENDS += "libevdev python3-pybind11"
+EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
 
 PACKAGES =+ "${PN}-python"
 
-- 
2.17.1


