Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 10B5C529BC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 20:34:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIKWXt5123501
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:32:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576701153;
	bh=+oqUkr/FKmGDYrY50HhzeaOg7UAxNN8rK30jBDZTRFo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PLvoB0d43EyRJ7vYSbHsU2/KcAbbKGzoKvCzwI8E0uNF++ROBm7+a3aX4B86Z/713
	7hjrPZvF+BN2ccoMevtzXotasDn1BYX6IbrsKrVE/o/5e4tQiR6yFgSM2dcbaQVBz7
	vuFl7VgzaE+zTkZyJQNgu7B3EILX58dswv48WgT8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIKWXPX014862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:32:33 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 14:32:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 14:32:33 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIKWWtU007037;
	Wed, 18 Dec 2019 14:32:32 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Dec 2019 20:13:51 +0000
Message-ID: <20191218201351.15055-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218201351.15055-1-denys@ti.com>
References: <20191218201351.15055-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 2/2] tisdk-rootfs-image: do not install opencl-extra packagegroup by default
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
X-List-Received-Date: Wed, 18 Dec 2019 20:34:11 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 81e6631f..48756243 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -14,7 +14,6 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-gtk','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte','',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
-- 
2.17.1


