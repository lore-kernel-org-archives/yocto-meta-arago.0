Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 75EA05297E
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 15:07:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIF6owM024355
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 09:06:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545145610;
	bh=1CxE5d5Zp+QL294nFR9evYfBoEOplIa3Rdmib3cbmfM=;
	h=From:To:CC:Subject:Date;
	b=diFpyuY95nQAiY0200FyUqtdtS9PXcFi82ADXz9hehuc4oaFulZ8w+bxfvw/EIMbQ
	Pq+gLEhSRF7sW/6F+OfEXal9eoqlLKYMOGXLSFK1c99mgVRvWuw0lXU+Z1d7oGDcf0
	LJocM3AVUXInkVuYzCVagm7yLJwhwqBAJIjP+wzI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIF6owc014843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 09:06:50 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 09:06:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 09:06:50 -0600
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIF6okd016226;
	Tue, 18 Dec 2018 09:06:50 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 10:06:45 -0500
Message-ID: <1545145605-14789-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] [PATCH] Add tidl-import to TIDL_PKGS.
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
X-List-Received-Date: Tue, 18 Dec 2018 15:07:02 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
index b1b74a9..9bbb4e1 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
@@ -1,6 +1,6 @@
 PR_append = ".tisdk1"
 
-TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils"
+TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils tidl-import"
 
 EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
 EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"
-- 
1.9.1


