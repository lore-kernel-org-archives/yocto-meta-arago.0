Return-Path: <sam.nelson@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1A4A052982
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 18:12:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87ICk6B059356
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 13:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536343966;
	bh=IX31H8NaTGB583Q0ZN1g3LkpFSp/LZ/cCyOaHcLtka0=;
	h=From:To:CC:Subject:Date;
	b=qH/99yBkWohXbQgDUmaYeJVGDzJkkEz9yCzcXMZVAdDRlzw9d5wQEJ0aKZ39owF9E
	B+1AsSeDZWPw4ti1tBzMKXp9pqS88qcWv04l87O2TdnFPS98/+9b3Lx/fd1Xtx2Mab
	fd6+pHzR0B0sLESGzmB2GYfQc/qxTXjz07zxOhMM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87ICjBL029101
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 13:12:45 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 13:12:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 13:12:45 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87ICjuJ029760;
	Fri, 7 Sep 2018 13:12:45 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>, <s-anna@ti.com>
Date: Fri, 7 Sep 2018 14:12:44 -0400
Message-ID: <1536343964-14487-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko-next][PATCH] packagegroup-arago-test: Add ti-ipc-test for k3
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
X-List-Received-Date: Fri, 07 Sep 2018 18:12:54 -0000
Content-Type: text/plain

ti-ipc-test provides ipc test images

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb             | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index ed26227..5b45597 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -62,6 +62,10 @@ ARAGO_TI_TEST_append_omap-a15 = " \
     ti-ipc-test \
     "
 
+ARAGO_TI_TEST_append_k3 = " \
+    ti-ipc-test \
+    "
+
 ARAGO_TI_TEST_append_keystone = " \
     ti-ipc-test \
     "
-- 
1.9.1


