Return-Path: <manishalocal@uda0393239>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 56FE952A78
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 22:45:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEMip7w024782
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544827491;
	bh=mLkDbdSjwzcLGsB/FREvFNqkaxjeTTP4wp5WAbRtjEs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ty3wBSlm/gu4rd5GcVV+LQaCaTMAzyn+X0BbHl5Un+MaqYMHO/3MtC2+9ZeZ4StRA
	Kodj+kIf3Gcdnh/91/OFfAAt6DZsB3Oa3Rk2jAbdKoFZJV08/zVDIW0mSL8hCwE/Fa
	aMBMQoprrMyWGgT8JW5HyaR7csdkyyMpZCc05nso=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEMipi4091871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 16:44:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEMipDn024718;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXwCR-0004xP-5P; Fri, 14 Dec 2018 16:44:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 16:44:48 -0600
Message-ID: <20181214224449.19010-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181214224449.19010-1-manisha.agrawal@ti.com>
References: <20181214224449.19010-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko-next-rel][PATCH v2 3/4] Makefile_mmwavegesture-hmi : add mmwavegesture-hmi demo to SDK makefile
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
X-List-Received-Date: Fri, 14 Dec 2018 22:45:04 -0000
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


