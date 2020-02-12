Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9FC355298B
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2020 20:14:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CKCR3Y067080
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2020 14:12:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581538347;
	bh=WQ0HZuQEkbzUIh0g2cXmsIozkAhdHIOkhkIlk98Rrpo=;
	h=From:To:CC:Subject:Date;
	b=ioxWjxgdcsM3IHlSXYOVyM0KZBKNvlk2mI0g5VofBPIcul9aTflwAvekZdGEh1JBE
	boE59T0T4QiD4cd6ihguo+YprdQwYiKKYR/45za2SXMZtOESGHL+TxtZ0GqMGk7yns
	a9ijjTf6IkqLoVirBNcghAJGRuaKB4ssYSCpXO4E=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01CKCRGM068914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2020 14:12:27 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 12 Feb 2020 14:12:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 12 Feb 2020 14:12:26 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CKCQcK097619;
	Wed, 12 Feb 2020 14:12:26 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Feb 2020 19:51:38 +0000
Message-ID: <20200212195138.15694-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH] ti-sci-fw: update to 2019.12b and switch to k3-image-gen
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
X-List-Received-Date: Wed, 12 Feb 2020 20:14:24 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw_2019.12.bb => ti-sci-fw_2019.12b.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.12.bb => ti-sci-fw_2019.12b.bb} (93%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12b.bb
similarity index 93%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12b.bb
index 74a06971..39ee0a59 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.12b.bb
@@ -15,14 +15,14 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "a692931eba713a099ed9ae41ef4a4f7ba145a706"
+SRCREV = "6a07e130e7dac6b49c9e516ffc84e33a68155260"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "642da4e2a01ea5d8a553ae0d674839cd5e0715b9"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/processor-firmware/system-firmware-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


