Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 64D0D529E5
	for <meta-arago@arago-project.org>;
	Wed,  8 Jul 2020 14:43:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 068EeiWu025573
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2020 09:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594219244;
	bh=cwHi0bPfPPAKifvT9Bni914+ZHZBs5ABcBJtGBk6HMw=;
	h=From:To:CC:Subject:Date;
	b=X/h7VB/jMFsXDdi0XH/NQB1zWBo3BUlbluF65rc5IA+SO9phEdnmxoXDkYD2rdI/B
	F+bXr5orYaWOxX0/9CqhiG5KHV+3bdRZ6EX6qECCjLQReEZIGUZtqLsOj88Qf/GdUc
	kqY0tESu1RJAsU2ieCrG3dkIvLab6mnREwqxY8BU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 068Eei3h048695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2020 09:40:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 8 Jul 2020 09:40:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 8 Jul 2020 09:40:44 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 068EeiNd011476;
	Wed, 8 Jul 2020 09:40:44 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Jul 2020 10:40:38 -0400
Message-ID: <1594219239-532-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH 1/2] tisdk-uenv: deploy for wic images
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
X-List-Received-Date: Wed, 08 Jul 2020 14:43:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index a08f24b..442e067 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -20,3 +20,11 @@ do_install () {
 }
 
 FILES_${PN} += "board-support/*"
+
+# deploy files for wic image
+inherit deploy
+do_deploy() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 ${S}/uEnv.txt ${DEPLOYDIR}
+}
+addtask deploy before do_build after do_unpack
-- 
2.7.4


