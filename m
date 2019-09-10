Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 37E4852A14
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDvHZ054599
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139237;
	bh=OAGHLG49uGG3dpSanCBhiT2Q0yfai86H8JZKw1CLjgY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L4ZwIFOmKRX7vKNiShc+Qcjqeox+gsnNmBZ4TYo1z4NE+B88JJRN6Fuz1vlkGSnO+
	bSFsoe5YyCsk0l2zmHilmGBDFrlD5v0pQbQaYK9V9YipyQeZdbtNUBxmT/YtZKt0Ao
	sWIbukLqbHkD21pDDbHEZKJQuTOLsGHw5eRGSQvc=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDvCA046503
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:57 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDunu035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:24 -0400
Message-ID: <20190910181131.8808-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 2/9] HACK: matrix-gui-machinevision-demos: remove point-cloud-viewer
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:04 -0000
Content-Type: text/plain

point-cloud-view build failed with mesa-based egl. Remove it tentatively

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../matrix/matrix-gui-machinevision-demos_2.0.bbappend       | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bbappend
new file mode 100644
index 0000000..8ce44fa
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+RDEPENDS_matrix-machinevision-demo-dlp3dscanner_remove_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
+"
-- 
2.17.1


