Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EDD5D529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:09:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85H9XC1018946
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504631374;
	bh=o+1DlEVnrxZqmIdE2iNADnGsR1JfQwNzwJx6k6B6SrI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PCe+XTapaPWB14t9ZAZBUFobV4Gxsc0wfzdJw8nkuPrURcce/dp+Y3fj5tQy+sMdL
	vi4NbAFzDZ6MKBKVibAZp7qgbxNKAkqJcYdz37P6BzJCEO2+kH8HesjqLYvHNSfat9
	Ea2cYGVHBI9fnwhji9MhrjM700dOTDxF5UH5mlf0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9SWP031154
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:09:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9S8A019024;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpHLs-0003Xn-Hj; Tue, 05 Sep 2017 12:09:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Sep 2017 12:09:22 -0500
Message-ID: <20170905170926.13566-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170905170926.13566-1-manisha.agrawal@ti.com>
References: <20170905170926.13566-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v4 4/8] matrix-gui-hmi-demos : hmi demo descriptions for matrix
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
X-List-Received-Date: Tue, 05 Sep 2017 17:09:44 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100755 recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb

diff --git a/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
new file mode 100755
index 0000000..1ed5a5e
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "HMI demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require recipes-core/matrix/matrix-gui-apps-git.inc
+SRCREV = "094736065e1a15a49da19ef4c5a100aa763c41d1"
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/hmi_apps"
+
+# Make sure machinevision submenu and app images has been installed
+HMI_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-hmi"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+
+PACKAGES = "matrix-hmi-demo-evse \
+	    matrix-hmi-demo-protection-relays\
+"
+
+RDEPENDS_matrix-hmi-demo-evse = " \
+    ${HMI_RDEPENDS} \
+    evse-hmi \
+"
+
+RDEPENDS_matrix-hmi-demo-protection-relays = " \
+    ${HMI_RDEPENDS} \
+    protection-relays-hmi \
+"
+
+FILES_matrix-hmi-demo-evse    = "${MATRIX_APP_DIR}/hmi_evse/*"
+FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
+
+FILES_matrix-hmi-demo-protection-relays   = "${MATRIX_APP_DIR}/hmi_protection_relays/*"
+FILES_matrix-hmi-demo-protection-relays  += "${bindir}/runHmiProtectionRelays.sh"
-- 
2.13.0


