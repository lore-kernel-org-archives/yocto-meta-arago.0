Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2189.1643826393438505828
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wDQd5sFH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVL3102059;
	Wed, 2 Feb 2022 12:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826391;
	bh=k7Kg3oOL6j/43dns0YdBiL/Q/5nJbZieb3dhvuRPbD8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wDQd5sFHq3TKCVpN2Rv0PWOEJEm51IW2Ag23kuHiVTdBHXweZ+sKnmGcI+ofisTYW
	 OvzFuuF1VActZWkTIJwtxHZIis0dsFjzt2gH+3qcaUQMXctuM9C8nMRUs4w7uNNIkX
	 kcq+gYtR8lV0K498QHdWaJMUc/ib1IeTL1M6gW5s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQVFV122831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:31 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQUqF117262;
	Wed, 2 Feb 2022 12:26:30 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKs-0007Xd-Lp; Wed, 02 Feb 2022 12:26:30 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 02/12] optee-os: Add support for alternate console
Date: Wed, 2 Feb 2022 12:26:20 -0600
Message-ID: <20220202182630.28943-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Actual systems may choose to use a different console from the default
Allow the machine configurations to describe the same.

Since the option provided is custom to TI K3, make this a k3 product
override capability.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-security/optee/optee-os_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 9bd0b933..4e01ea74 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -10,6 +10,8 @@ SRC_URI_ti-soc = " \
     file://0007-allow-setting-sysroot-for-clang.patch \
 "
 
+EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
+
 do_compile_prepend_ti-soc() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 }
-- 
2.17.1

