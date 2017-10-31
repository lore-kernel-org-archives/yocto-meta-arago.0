Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 1DE59529D3
	for <meta-arago@arago-project.org>;
	Tue, 31 Oct 2017 11:25:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9VBPdh6031682
	for <meta-arago@arago-project.org>; Tue, 31 Oct 2017 06:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509449139;
	bh=OjE9pA6nsTxmMfATz3dkMaMqU+QJ0uBIql6iqTUMeKM=;
	h=From:To:CC:Subject:Date;
	b=xJaJUaO+4XxJQyVjPuMk+cW3/iwk58M64wMMTHojEuOJLaM5RMijOqbXcNNTurBCt
	VKSO6HvIbRwJQFk6ICZHa0Nmz/tFLyNYJRIXXMQEUn+HltBjik4e8ij9EFKv1v6UxS
	fpkAPfwotkkNjqMZ9fih4+GCkLv8J1gRpjZjquw0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VBPdFQ027770
	for <meta-arago@arago-project.org>; Tue, 31 Oct 2017 06:25:39 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 31 Oct 2017 06:25:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 31 Oct 2017 06:25:39 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VBPb9m024933;
	Tue, 31 Oct 2017 06:25:38 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Oct 2017 16:55:36 +0530
Message-ID: <1509449136-2444-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty] kmscube: Update SRCREV for jitter fix
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
X-List-Received-Date: Tue, 31 Oct 2017 11:25:41 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 14973b9..51a4adf 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -10,8 +10,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r8"
-SRCREV = "24e94f583119896b3ab8ecc7b35c7de3160dcb1f"
+PR = "r9"
+SRCREV = "3e9807ddcf2b4e8ccf711cdaf851752ec40d7904"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
-- 
1.9.1


