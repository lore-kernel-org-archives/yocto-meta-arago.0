Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9699352A78
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:17:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LHjMb020025
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300665;
	bh=o+1DlEVnrxZqmIdE2iNADnGsR1JfQwNzwJx6k6B6SrI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s/TmLpgksGZifzIDRHYYJoXhtkPoGA4AtEMIn1uGwiju63a0nWcivbBgTOWFeO+x/
	iem/Ro2NILnr+OuYYyc08zhMPIQtKWm6MgC1v33fNoB/EDXrm5RtQX/m/IGouvaDta
	dfQ/gz2Lsyn/XOdMWX4LJLgqQ40eDfdwxBSX0Fx8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjTN021207
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:17:45 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjvS009985;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntJx-0006tV-6Z; Fri, 01 Sep 2017 16:17:45 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:17:38 -0500
Message-ID: <20170901211741.26451-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901211741.26451-1-manisha.agrawal@ti.com>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 4/7] matrix-gui-hmi-demos : hmi demo descriptions for matrix
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
X-List-Received-Date: Fri, 01 Sep 2017 21:17:46 -0000
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


