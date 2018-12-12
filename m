Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 533945297E
	for <meta-arago@arago-project.org>;
	Wed, 12 Dec 2018 23:47:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBCNlgBu023811
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 17:47:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544658462;
	bh=DL+ZLwUMS7/nwWpbTdwseZTuVoL2DoNzMAxZJZBijok=;
	h=From:To:CC:Subject:Date;
	b=xaDMYGOFVDWXm7hhMekQeIO9EOZsZW6kp+YCGtZmjC4RnREfw4IyeCI0mGlHdmIK+
	nhhICPesrtQiL2aynEKha6iHg+vg7qhQIn0pODasUVmYTg8Z0q8TJITCv53sgT0k+S
	Wrk1jgstoYvioFtADEUn1kmxeDAW6OOB8gTHUCls=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBCNlgLJ052177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 17:47:42 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 12 Dec 2018 17:47:42 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 12 Dec 2018 17:47:42 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBCNlgew017666;
	Wed, 12 Dec 2018 17:47:42 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Dec 2018 23:41:06 +0000
Message-ID: <20181212234106.13436-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] layer.conf: add machinevision-demos and point-cloud-viewer to siggen safe deps
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
X-List-Received-Date: Wed, 12 Dec 2018 23:47:55 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 83ac107d..ded66673 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -32,6 +32,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     matrix-gui-armbenchmarks-demos->lmbench \
     matrix-gui-armbenchmarks-demos->nbench-byte \
     matrix-gui-settings-demos->am-sysinfo \
+    matrix-gui-machinevision-demos->point-cloud-viewer \
     matrix-lighttpd-config->lighttpd \
 "
 
-- 
2.17.1


