Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AF5C55297D
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 17:48:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmCXr072109
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559324892;
	bh=0CbezkrekgQEAP5hT4R08zoi6FiJhHRxDdROOlCHHRE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=f71iiU3pfPyWZVwlK9KI9M4MqwpC2z59r4/Z3MjpZJqbvC0pHcn1qOKNtlQw/RfxM
	d9kfDZpvwD1idX9aY9fbGuYoo87Qcoyax1PUDEJBEuEjVe8mEmokZU1rDdhGANcsAi
	7S6tYzei+rbSAFjLFErbnHdMYEjjoixupDcq33O8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VHmCf3019819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 12:48:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 12:48:11 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmANO118948
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 13:47:54 -0400
Message-ID: <20190531174754.42586-4-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531174754.42586-1-e-ruei1@ti.com>
References: <20190531174754.42586-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 3/3] ti-sgx-ddk-um: remove unused file
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
X-List-Received-Date: Fri, 31 May 2019 17:48:48 -0000
Content-Type: text/plain

ti-sgx-ddk-um_1.14.3699939 is no longer needed

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
deleted file mode 100644
index 0c2dcac..0000000
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-PR_append = ".tisdk8"
-
-BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/rocko/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
-SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bc62c9d0c590dfbc801bf6b10176c3a8b6a39d98','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
-- 
2.17.1


