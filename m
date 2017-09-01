Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 7A61C52A3E
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:19:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LJ3wI020139
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300743;
	bh=2ggzPY2DPrZ0ufMD9uTOoGfOVe8XzH+Y8gNopBfrQHc=;
	h=From:To:CC:Subject:Date;
	b=eZUjzZqUjPpZIL2g8qZrwHGBLEGvDpmUpQaCiV0yq7HyS110wnKFQGd06rv6qOlaB
	7IrYqykF4P7gE7zjkMBn4/Zpktpx+Mtcy+Oju+cKxjU5KlLZGRUX/mmWzRE+60BlqB
	99EQgZCmyeuibdtRm2qp21zrVBsOILLZHRkPx4RA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LJ3qO022692
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:19:03 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:19:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:19:03 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LJ3JI028348;
	Fri, 1 Sep 2017 16:19:03 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntLD-0006ub-5f; Fri, 01 Sep 2017 16:19:03 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:19:01 -0500
Message-ID: <20170901211901.26533-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1] arago-core-tisdk-image : add hmi specific packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 21:19:03 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/arago-core-tisdk-image.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-image.bbappend
index 2857178..2c804f0 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -1,5 +1,9 @@
 PR_append = ".tisdk13"
 
+IMAGE_INSTALL_append = " \                                                                                                                   
+      packagegroup-arago-tisdk-hmi-sdk-host \ 
+ "
+
 # The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
 #
 # We need to get these into the prebuilt-images. We don't want to inherit the
-- 
2.13.0


