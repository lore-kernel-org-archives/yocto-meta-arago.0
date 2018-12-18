Return-Path: <xuj@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0150E5297E
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 16:37:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIGaoj4008329
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 10:36:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545151010;
	bh=1CxE5d5Zp+QL294nFR9evYfBoEOplIa3Rdmib3cbmfM=;
	h=From:To:CC:Subject:Date;
	b=lzrrSnalVVUfHti7x68x8Kdkj32Nkrc9eFD+hUxbWA6lwyfoiyL89/axm/+P/9yoo
	nRmQ50r9Nqxb6ILOQeKkMZ0cnGX/is850UsxVg44eNyPiK6rjYKH/DWs6YARdPJFcE
	aDgM9cNeZ68RFL3wiNpO0jy5RTkRH7LhkkQv8zVc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIGaocR098037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 10:36:50 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 10:36:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 10:36:50 -0600
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIGanwV019658;
	Tue, 18 Dec 2018 10:36:49 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 11:36:47 -0500
Message-ID: <1545151007-23149-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] [PATCH v2] tidl: add tidl-import to TIDL_PKGS.
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
X-List-Received-Date: Tue, 18 Dec 2018 16:37:02 -0000
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


