Return-Path: <x0038811@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7E6F652A02
	for <meta-arago@arago-project.org>;
	Tue,  5 Jun 2018 11:21:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w55BKvVM028209
	for <meta-arago@arago-project.org>; Tue, 5 Jun 2018 06:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528197657;
	bh=SufY9CsRmQDe7U1VdRs+rhswJkrgiq3Bf0HlwGd1cGI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SEFqpR4TI4UJJIJDIacUP9tg0le46Kc5+o1YX3APPgLo6QdR7VYsuYYEflA+S8MT4
	cGsqeuSA8TPQdRmCTyCctJ6E7tXpPFjGEEomjaQlc3mMg1MklEyZh2yHe2craVBWeU
	Mk4nN6zhUXo+afOJXN5BhQ9VLT658LYHBzwvk8JQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w55BKvYr006806
	for <meta-arago@arago-project.org>; Tue, 5 Jun 2018 06:20:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 5 Jun 2018 06:20:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 5 Jun 2018 06:20:57 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w55BKsZd013661;
	Tue, 5 Jun 2018 06:20:56 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Jun 2018 16:50:52 +0530
Message-ID: <1528197652-4249-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528197652-4249-1-git-send-email-x0038811@ti.com>
References: <1528197652-4249-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko] example-applications: Bump SRCREV with latest commit
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
X-List-Received-Date: Tue, 05 Jun 2018 11:21:04 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 3ce8a76..e44bee9 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -14,9 +14,9 @@ inherit autotools pkgconfig
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 "
 
-SRCREV="491b3129a5c5267d72aba8878b50731f27356d3a"
+SRCREV="6197386b99383849fbf7c1017d2420742860a88c"
 
-PR = "r50"
+PR = "r51"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
1.9.1


