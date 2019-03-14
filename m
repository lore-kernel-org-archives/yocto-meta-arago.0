Return-Path: <xuj@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 43E49520EA
	for <meta-arago@arago-project.org>;
	Thu, 14 Mar 2019 16:40:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EGeiIW030699
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 11:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552581644;
	bh=yXH5QOHC2vCsEy3r9oWebuETzhOrK4LRujutd3pBpZU=;
	h=From:To:CC:Subject:Date;
	b=ZNrdG9izcrnoyjjhyg42UlF/rKoXJxR8n8GanPn7MbR5YXgM2wIJjExE6g7ZZVab8
	LfOhOw8FGZZRvMjIrnBne3u0KtN9zYSAHJRmOXO72OY3hAwavl9lhZo0ghU3BeiG3K
	8rww5WfQZmirolZTQxe3qbIdXOSPPkb8iR3D4FKM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EGeih5089806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 11:40:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Mar 2019 11:40:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Mar 2019 11:40:44 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EGehJr016738;
	Thu, 14 Mar 2019 11:40:43 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Mar 2019 12:40:37 -0400
Message-ID: <1552581637-39270-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] nativesdk-packagegroup-arago-sdk-host.bbappend: removed
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
X-List-Received-Date: Thu, 14 Mar 2019 16:40:56 -0000
Content-Type: text/plain

Moved tidl-viewer and tidl-utils to meta-arago-extras/recipes-core/packagegroups/
nativesdk-packagegroup-arago-tisdk-host.bb.

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend       | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend

diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
deleted file mode 100644
index b0fafee..0000000
--- a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = ".tisdk1"
-
-EXTRA_TI_TOOLS_append = " nativesdk-tidl-viewer nativesdk-tidl-utils "
-- 
1.9.1


