Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5E65752A40
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:17:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LHjKd020021
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300665;
	bh=HjR/NNOYhTVea5ZinVkPQND8NrGGm8m2YWMCCSs3D+s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kb+7gFLJuoUhfbwqmN9H1sM0Kmqy2ehTPYPSPBlGGw9XHxYUjYdLtPJoW760pDPL5
	A904Qu/N3ouSxhLuBwkaHqLYK3fOTxIbi2qxp+0oEs6lAFwL8Ka/YFSj1U+aKRldm4
	RkNW902GG9aMIrwI0K9SJ3xPA4Ajtwxfl4gPCVdI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjqU021196
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:17:45 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjec027460;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntJx-0006tQ-34; Fri, 01 Sep 2017 16:17:45 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:17:37 -0500
Message-ID: <20170901211741.26451-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901211741.26451-1-manisha.agrawal@ti.com>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 3/7] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Fri, 01 Sep 2017 21:17:45 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/matrix/matrix-gui-submenus.bbappend | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-submenus.bbappend

diff --git a/recipes-core/matrix/matrix-gui-submenus.bbappend b/recipes-core/matrix/matrix-gui-submenus.bbappend
new file mode 100644
index 0000000..681f22e
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-submenus.bbappend
@@ -0,0 +1,11 @@
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
-- 
2.13.0


