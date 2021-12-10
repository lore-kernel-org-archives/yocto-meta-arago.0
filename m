Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.805.1639097003778207517
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 16:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dyFqF375;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BA0hLeJ015208;
	Thu, 9 Dec 2021 18:43:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639097001;
	bh=LhKudirOgSwqjFo9o7Js+8z9eNnrLAE/lJEBLJ+yNDU=;
	h=From:To:Subject:Date;
	b=dyFqF375Waf10JpPTesXeNa6yC7uJcJ1WcFYvsrOuv/abHK1b9rJHk9g/a8xm5QKo
	 WorFkXKDlcZo0TkpRs3dXWLFPxMwXOff2rpNhpKk/G8asWhM/rp31dCvxKYy8g2u8v
	 2epWYmkcdG2IDwRFPciMRJudxa9lD60hY222Qg5Q=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BA0hLsr069020
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 18:43:21 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 18:43:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 18:43:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BA0hLqU123631;
	Thu, 9 Dec 2021 18:43:21 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] conf: j7200-hs: fix the wrong machine configuration included
Date: Fri, 10 Dec 2021 00:43:21 +0000
Message-ID: <20211210004321.23793-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

j7-evm instead of j7200-evm was included causing boot failure

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/j7200-hs-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
index c55be005..a5bd637e 100644
--- a/conf/machine/j7200-hs-evm.conf
+++ b/conf/machine/j7200-hs-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: J7200 HS EVM
 #@DESCRIPTION: Machine configuration for the TI J7200 HS EVM
 
-require conf/machine/j7-evm.conf
+require conf/machine/j7200-evm.conf
 
 UBOOT_MACHINE = "j7200_hs_evm_a72_defconfig"
 
-- 
2.17.1

