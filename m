Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEF7C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:36:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2062.1686249403473251877
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ft2tH79k;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358IagI6038094;
	Thu, 8 Jun 2023 13:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686249402;
	bh=iRxC+oqxs4zQiz+GVIdQwTLv7h9EdLVFQaoa15auocE=;
	h=From:To:Subject:Date;
	b=Ft2tH79kVP4ABR3cZ4WtiAAlfCW0RjwEGDXIQfaSgcbKSquRWsqjdYNKss2GyM+/G
	 pgxw73mvlOkDzRwymbi7cBQSE1tjzkFgaoe+4M/Xy9H+XRaMqlb3BkJf+0nQHxQ38Z
	 f/k0F9DzZuyT8qADaAi6onnPdhW8hHEp04YOPoMs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358IagFO084143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 13:36:42 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 13:36:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 13:36:42 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358IagPd093730;
	Thu, 8 Jun 2023 13:36:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q7KUz-00081z-Va; Thu, 08 Jun 2023 13:36:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] kms++: Restore pybind11 support
Date: Thu, 8 Jun 2023 13:36:41 -0500
Message-ID: <20230608183641.30832-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:36:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14548

Having this turned off is causing build errors and the errors that
disabling pybind11 solved do not appear to be in master any more.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index eb39736c..56b83c7a 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
 
 DEPENDS = "drm fmt"
 
-# New meson build system fails to find pybind11 in sysroot, disable for now
-#DEPENDS += "python3-pybind11"
-#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
+DEPENDS += "python3-pybind11"
+EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
 
 PACKAGES =+ "${PN}-python"
 
-- 
2.17.1


