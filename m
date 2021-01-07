Return-Path: <aparnab@aparnab-office>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 2886052962
	for <meta-arago@arago-project.org>;
	Thu,  7 Jan 2021 19:49:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107JnNVU010449
	for <meta-arago@arago-project.org>; Thu, 7 Jan 2021 13:49:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610048963;
	bh=VFBZb2v6IFHf5gjPBFNa14Yv+9sjkKbyM9GHAPIsowg=;
	h=From:To:CC:Subject:Date;
	b=rh/TfYsB4OqUTsRWKeJmPBx39KSmA/NhqffjYuv0SXoFUxhAehduTpNWZpkMmVfN+
	sz2oLft0dvnKA4BsK0bgURdz0dhgj4BVTlRrYG1toWpo8aFtqO8W341jx6UrS4YXW8
	CShp+sJAa1VMfMrPD5tRrC0fH0ze+/hDBqfHPYa4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107JnNtG121923
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 7 Jan 2021 13:49:23 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 7 Jan 2021 13:49:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 7 Jan 2021 13:49:23 -0600
Received: from aparnab-office (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107JnNfU117143;
	Thu, 7 Jan 2021 13:49:23 -0600
Received: from aparnab by aparnab-office with local (Exim 4.90_1)
	(envelope-from <aparnab@aparnab-office>)
	id 1kxbHe-0005hC-UE; Thu, 07 Jan 2021 13:49:22 -0600
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <dmurphy@ti.com>
Date: Thu, 7 Jan 2021 13:49:17 -0600
Message-ID: <20210107194917.21851-1-aparnab@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Aparna Balasubramanian <aparnab@ti.com>
Subject: [master/dunfell PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Thu, 07 Jan 2021 19:49:22 -0000
Content-Type: text/plain

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index fbb671cc..f0824a94 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -11,10 +11,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r9"
+PR = "r10"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "ff608b6191a03ff7c0a9a350a017466a5f2bbf01"
+SRCREV = "b0459d9aa364d07699ae6f273280358aae509d56"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1


