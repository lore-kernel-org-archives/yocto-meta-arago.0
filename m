Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4A42B52991
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 21:43:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBELh2Ax087696
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 15:43:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544823782;
	bh=mLkDbdSjwzcLGsB/FREvFNqkaxjeTTP4wp5WAbRtjEs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uoHfE8txPftyBjfHGqcdyxnB23lxwVD6z302qZJDSncWS7EMfwKzlnZTo0MpyBSXo
	k19go0Im1p6n2k9jmCNycGPdtbIrzrer6nqxcHXg3NRZZy7YjLndcniEscAAT67Bbr
	rqRfOGfy2+c0tX/SsxZoIgy01WsiTj+tq2FE15Ec=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBELh2YY085738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 15:43:02 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 15:43:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 15:43:02 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBELh2dh020616;
	Fri, 14 Dec 2018 15:43:02 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXvEc-0004d8-7H; Fri, 14 Dec 2018 15:43:02 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 15:42:58 -0600
Message-ID: <20181214214258.17757-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181214214258.17757-1-manisha.agrawal@ti.com>
References: <20181214214258.17757-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH v1 2/2] Makefile_mmwavegesture-hmi : add mmwavegesture-hmi demo to SDK makefile
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
X-List-Received-Date: Fri, 14 Dec 2018 21:43:14 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../ti-tisdk-makefile/Makefile_mmwavegesture-hmi   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
new file mode 100644
index 00000000..f5756251
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
@@ -0,0 +1,24 @@
+# mmWave Gesture HMI build targets
+mmwavegesture-hmi:
+	@echo ================================
+	@echo    Building mmWave Gesture HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build
+
+mmwavegesture-hmi_clean:
+	@echo ================================
+	@echo    Building mmWave Gesture HMI Demo
+	@echo ================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build clean
+
+mmwavegesture-hmi_install:
+	@echo ===================================================
+	@echo   Installing mmWave Gesture HMI Demo - Release version
+	@echo ===================================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build install
+
+mmwavegesture-hmi_install_debug:
+	@echo =================================================
+	@echo   Installing mmWave Gesture HMI Demo - Debug version
+	@echo =================================================
+	@cd example-applications; cd `find . -name "*mmwavegesture-hmi*"`; make -f Makefile.build install_debug
-- 
2.13.0


