Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9693852978
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 23:30:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25NUPju106959
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 17:30:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551828625;
	bh=JcizdJ4wi8pBjtHtfACJtTqr2By6pSPdSOLiRJr6s8E=;
	h=From:To:CC:Subject:Date;
	b=Q8QStsh30JqGqL2tlo9ULWSxi7EIderGgAXvr+IzIAqcpHdgd48zfskWHf3wbTBjP
	1o2nL3g9ATK+oTJh/c33VWyCVbKZzRNXxAcCZl3SWoZAEbykKQYhaRHPGJV78ul5Gg
	1IKFeSbb4nuj/ZB62K4JrHtsscokm2hqrKte8cvs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25NUPxf040530
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 17:30:25 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 17:30:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 17:30:25 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25NUP8C013267;
	Tue, 5 Mar 2019 17:30:25 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Mar 2019 13:24:09 -0500
Message-ID: <20190305182409.23651-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] packagegroup:matrix-gui: Add 4 new demos
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
X-List-Received-Date: Tue, 05 Mar 2019 23:30:41 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 76fecf1d..b74ed6b0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -183,6 +183,10 @@ MATRIX_APPS_append_dra7xx += " \
     matrix-tidl-demo-livecam-lg2 \
     matrix-tidl-demo-staticimg-lg2 \
     matrix-tidl-demo-staticimg-dsponly \
+    matrix-tidl-demo-objdet \
+    matrix-tidl-demo-objdet-livecam \
+    matrix-tidl-demo-segment \
+    matrix-tidl-demo-dogbreeds \
 "
 
 MATRIX_APPS_append_keystone = " \
-- 
2.17.1


