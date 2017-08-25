Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 21582529CD
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 16:03:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PG32jN010077
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 11:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503676982;
	bh=WAf0HV6RV9jge/lxNsVA5eI4D2rKh6PgLmr9WSO7cn0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Y08ByASCWhBXoxSBHYgHD44IUFbE3ax8RSiFTIf4MZCReUFgdmau73/jcofZWhQeu
	Z/TIAYS6FcUa7i35ZBrUlIofvyz+toU9YOYTYqbPleCuPXMGUNnUCMFAxF3hmdnYYZ
	yIo3q9J2jb3Nl1N+SYzIjwuIcDcWDG1Za5Q8vU2M=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PG2vQ7005707
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 11:02:57 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 11:02:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 11:02:57 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PG2vrc011702;
	Fri, 25 Aug 2017 11:02:57 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dlH4R-00036h-4s; Fri, 25 Aug 2017 11:02:56 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>, <j-stiffler@ti.com>, <denys@ti.com>
Date: Fri, 25 Aug 2017 11:02:44 -0500
Message-ID: <20170825160245.11812-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170825160245.11812-1-manisha.agrawal@ti.com>
References: <20170825160245.11812-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty]PATCH 2/3] meta-arago-extras : matrix : recipe for evse hmi
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
X-List-Received-Date: Fri, 25 Aug 2017 16:03:13 -0000
Content-Type: text/plain

Recipe to enable adding the evse-hmi demo to the matrix launcher

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../matrix/matrix-gui-hmi-demos_2.0.bb             | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
new file mode 100755
index 0000000..36eaebc
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "HMI demo descriptions for Matrix v2"
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
+FILES_matrix-hmi-demo-evse    = "${MATRIX_APP_DIR}/hmi-evse/*"
+FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
-- 
2.13.0


