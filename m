Return-Path: <manishalocal@uda0393239>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 45A7B52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:51:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KpAjf022251
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504299070;
	bh=ZSvG44eabHsP1Odg4EgAe1GoWPyCp5nXvdjfMf6pxrM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LzRXlVTjRMbDhlWcszyv5c6fGiJ/dXMDVVlTmtLZx58D0ivV70JXyKy+Ira+XgsvX
	qGo5+kARCmDJCl+PEXXcQ8QchQ0HLJVGXknndPDpAhEdgrkfV3OxxVR48ujC5hwmUs
	jAjUzOPC5poctrlQ8oYQSwwbJZoyVMjmUThr5ETA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KpA9F014579
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:10 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:51:10 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Kp9wg010953;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsuD-0006di-RI; Fri, 01 Sep 2017 15:51:09 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:51:07 -0500
Message-ID: <20170901205107.25462-6-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901205107.25462-1-manisha.agrawal@ti.com>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v1 6/6] arago-source-ipk : Add protection-relays-hmi source ipk
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
X-List-Received-Date: Fri, 01 Sep 2017 20:51:10 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 5dd1ca64..5e3de4ef 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -70,6 +70,9 @@ SRCIPK_INSTALL_DIR_pn-dual-camera-demo = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-evse-hmi = "1"
 SRCIPK_INSTALL_DIR_pn-evse-hmi = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-protection-relays-hmi = "1"
+SRCIPK_INSTALL_DIR_pn-protection-relays-hmi = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-image-gallery = "1"
 SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
 
-- 
2.13.0


