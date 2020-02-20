Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C1D84529F7
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG86C056286
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226169;
	bh=XwcOQSqDOvxqOiivO7uvCbEucPV8y5QgfrsnJRfziJk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LfP8l93jLfb9Spkf41RyBKgiyULwtRwSv/+L9pWyO7QSFyeXbe/ch2Z3mp5V4DR95
	8YKhHyIBCnt795NBgwyZpSAiqJQNbhSMoLDGUItQsqcgVxS6NOMJlUhnyZWUGQvfGU
	VbezRQJjsO44GyhFU94F7z/0/0jVo0ZJKepyDjcI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG8mD117832
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:08 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:08 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pe017983;
	Thu, 20 Feb 2020 13:16:08 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:52 +0000
Message-ID: <20200220185458.26926-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 3/9] arago-base-image: drop unused image recipe
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 19:18:09 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-base-image.bb | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-base-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-base-image.bb b/meta-arago-distro/recipes-core/images/arago-base-image.bb
deleted file mode 100644
index 57ca93a5..00000000
--- a/meta-arago-distro/recipes-core/images/arago-base-image.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-# Arago base image
-# gives you a small image with package manager
-
-require arago-image.inc
-
-IMAGE_INSTALL += "packagegroup-arago-base"
-
-export IMAGE_BASENAME = "arago-base-image"
-- 
2.17.1


