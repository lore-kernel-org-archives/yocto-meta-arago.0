Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9B4A852978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:28:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KSXgv013471
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297713;
	bh=VU441oajZSTiYKtT/JjhbDAoVLPbuF0v7Lb+D4VDKAc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QeOlpJaxq3rJA04c538H4dPVVmLjl30OF9/DCJBnQyAE/8Ht7CrcELrau7E1pVSXm
	9VKtCMlLVcrTH/kfEGwfCKys+uN/gtmAv5hdzvrCNPDo4M0trqoBml4XXYOFxg97jH
	i2qPflxd45Pqks/KlItiWIxcwfFKGylrMpRPklnc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXve028829
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:28:32 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXgH020276;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsYK-0006Tw-T3; Fri, 01 Sep 2017 15:28:32 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:28:25 -0500
Message-ID: <20170901202830.24876-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901202830.24876-1-manisha.agrawal@ti.com>
References: <20170901202830.24876-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1 2/7] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Fri, 01 Sep 2017 20:28:34 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/matrix/matrix-gui-submenus.bbappend | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-submenus.bbappend

diff --git a/recipes-core/matrix/matrix-gui-submenus.bbappend b/recipes-core/matrix/matrix-gui-submenus.bbappend
new file mode 100644
index 0000000..e30848a
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-submenus.bbappend
@@ -0,0 +1,14 @@
+PR_append = ".tisdk2"
+
+SUBMENUS_append = " \
+    hmi_submenu \
+"
+
+PACKAGES_append = " \
+    ${PN}-hmi \
+"
+
+FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"   
+
+
+
-- 
2.13.0


