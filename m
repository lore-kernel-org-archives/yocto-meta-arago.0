Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 53A79529D5
	for <meta-arago@arago-project.org>;
	Tue, 19 Dec 2017 16:50:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJGoTZ6006953
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 10:50:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513702229;
	bh=M1CvH1QTkG4lKJwccE48N1ZbIwAimQF269o7VPqxBtc=;
	h=From:To:Subject:Date;
	b=e+dNcImjS4rnvVAXIAyXUPg7rghfp6vUq/ojmnFXK+y1Wniblmk7hfFy2kbLXbE5f
	U1pMWRas6J/6gIZua4zvbtoTEyzq/xRI3akhlhXTf0KvmK8UWKiTyldrBD80WzOWYO
	fppM8eWeU3MDuZJ49UsCg7zPY1mF3lpgRe9S58V4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJGoTES024818
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 10:50:29 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 10:50:28 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 10:50:28 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJGoSCi017613
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 10:50:28 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Dec 2017 11:50:27 -0500
Message-ID: <1513702227-14688-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] nimu-rtos: Adding dependent components for c66x , omapl1 & dra7xx targets
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
X-List-Received-Date: Tue, 19 Dec 2017 16:50:31 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
index d51f113..50652f2 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
@@ -1 +1,6 @@
 require recipes-bsp/transport-rtos/transport-1.0.0.9.inc
+
+DEPENDS_append_c665x-evm = " emac-lld-rtos"
+DEPENDS_append_c667x-evm = " pa-lld-rtos"
+DEPENDS_append_omapl1 = " emac-lld-rtos"
+DEPENDS_append_dra7xx-evm = " emac-lld-rtos"
-- 
1.9.1


