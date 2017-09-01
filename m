Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E7C4652A40
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:28:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KSXrw023916
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297713;
	bh=2eQZ6QMp/0fvK5ZP1VYe6a/8vTCEk0a83mlG0HE0gtQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xNWWnZsaPZ6DJ5elyzvhFHH9Jb4TWmlpdrLPV4vOihAiuvvK7/xqbXeKPERrij+RX
	YjDOK369FvWljEQXXfAUBMLrI/LifZtucMXUnIE0Poh9N2OY0a+9MkG/Hm10P5E1xP
	3E8cz7RPkZqCPAfjc/GCj1r/467ALw6cE22LkUQE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXk1012614
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:28:33 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXqh020283;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsYL-0006UF-D2; Fri, 01 Sep 2017 15:28:33 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:28:29 -0500
Message-ID: <20170901202830.24876-6-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901202830.24876-1-manisha.agrawal@ti.com>
References: <20170901202830.24876-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1 6/7] tisdk-rootfs-image: add evse-hmi packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 20:28:35 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index d4b08cc..e97ce61 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,4 +1,15 @@
 PR_append = ".tisdk4"
 
-IMAGE_INSTALL_append_ti43x = " packagegroup-arago-tisdk-graphics"
-IMAGE_INSTALL_append_ti33x = " packagegroup-arago-tisdk-graphics"
+IMAGE_INSTALL_append_ti43x = " 
+	packagegroup-arago-tisdk-graphics \
+        packagegroup-arago-tisdk-hmi \
+"
+IMAGE_INSTALL_append_ti33x = " 
+  	packagegroup-arago-tisdk-graphics \
+        packagegroup-arago-tisdk-hmi \
+"
+
+
+IMAGE_INSTALL_append_omap-a15 = " 
+  	packagegroup-arago-tisdk-hmi \
+"
-- 
2.13.0


