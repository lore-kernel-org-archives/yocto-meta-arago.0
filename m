Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6FB1252ACA
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 17:56:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UHuok9017559
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504115810;
	bh=y2O/LY+sGJxgkNLoF0M5LuYMMaRzKZoYfL0NKjK5Jfs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a1jUsUDfW242B4WY7pfyogMbic+jVT2lADx4JpKrfH6j1va8b3Mj8D9mlGnsP9H3l
	blqbXfdFbXf0CJsK5yQpB8lUabnkcVSfIGJ3oNDCoMn/XyrhHstn2HNwIvuVpU3qAZ
	M7ldJzF/t6XaqX5bWdPU7JJJmIc7aKQHPOLzEq+c=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuoxG020583
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 12:56:50 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuoeQ022456;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dn7EQ-0002z6-00; Wed, 30 Aug 2017 12:56:50 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Aug 2017 12:56:43 -0500
Message-ID: <20170830175647.11427-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v3 3/7] matrix-gui-hmi-demos : hmi demo descriptions for matrix
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
X-List-Received-Date: Wed, 30 Aug 2017 17:56:52 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../matrix/matrix-gui-hmi-demos_2.0.bb             | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
new file mode 100755
index 00000000..f751f8f8
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "HMI demo descriptions for Matrix v2"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
+
+require recipes-core/matrix/matrix-gui-apps-git.inc
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
+"
+
+RDEPENDS_matrix-hmi-demo-evse = " \
+    ${HMI_RDEPENDS} \
+    evse-hmi \
+"
+
+FILES_matrix-hmi-demo-evse    = "${MATRIX_APP_DIR}/hmi_evse/*"
+FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
-- 
2.13.0


