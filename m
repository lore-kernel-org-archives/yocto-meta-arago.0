Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F0FBE52995
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2020 23:19:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02BNHmfN024350
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2020 18:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583968668;
	bh=yR8lpspgDW+4OS3Vwfq47En3j6ah6aT7b+5IpHtCvvs=;
	h=From:To:CC:Subject:Date;
	b=QjNPjM2BsT/jpQ1v3kKkgaonCeeD/LMESwQW/m+yVo+iMd1SPdQf+VHNNpMjdBxN1
	HomIRgdbfayuAmVWoe3fcrru45ikGofiN2mMO1Q5kAxgi6HLmkM2xxfSunYGAMiRER
	zT+hjXHId26Cyilqpg49WggZ6rMoM7ECOYiQECR0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02BNHmRR031520
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2020 18:17:48 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 11 Mar 2020 18:17:48 -0500
Received: from localhost.localdomain (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 11 Mar 2020 18:17:48 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 02BNHlWc077375; 
	Wed, 11 Mar 2020 18:17:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2020 22:55:55 +0000
Message-ID: <20200311225555.29941-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH] ti-test: add git package
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
X-List-Received-Date: Wed, 11 Mar 2020 23:19:54 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 500d3a97..60db7de5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -32,6 +32,7 @@ ARAGO_TEST = "\
     pcitest \
     mstpd \
     fio \
+    git \
 "
 
 ARAGO_TEST_append_armv7a = " \
-- 
2.17.1


