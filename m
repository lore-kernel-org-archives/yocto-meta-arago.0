Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5E5AF52AB8
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 16:38:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TGcYhb010286
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504024714;
	bh=7tMQq6Cc9NxqGUoH/iZLrRjzfgp0vNRtko8Lv4rM+4A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gIM6YUHkzsdvbYrYebRaYPLgqAZFw1Cy7euqxIoAt3sjzy8dfo/7rbfmZzeD2dt5h
	6C1Ts4sMLk+ELGzQHHilTf7lrFWI4vgs7YHidTwkMcyVCfth7rlaMnGMx/63x4mwgA
	634VZ7wxMPzjF128oc3SZCjM5qmAvlyyprouC10E=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGcTlw003059
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:38:29 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 11:38:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 11:38:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGcSr8027377;
	Tue, 29 Aug 2017 11:38:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dmjX2-00047Q-RN; Tue, 29 Aug 2017 11:38:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 11:38:25 -0500
Message-ID: <20170829163826.15777-5-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170829163826.15777-1-manisha.agrawal@ti.com>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 5/6] meta-arago-distro: conf : arago-source-ipk.inc
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
X-List-Received-Date: Tue, 29 Aug 2017 16:38:44 -0000
Content-Type: text/plain

 Add the source code for evse-hmi demo in example-applications of PLSDK.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index c598d5d..5dd1ca6 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-dual-camera-demo = "1"
 SRCIPK_INSTALL_DIR_pn-dual-camera-demo = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-evse-hmi = "1"
+SRCIPK_INSTALL_DIR_pn-evse-hmi = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-image-gallery = "1"
 SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
 
-- 
2.13.0


