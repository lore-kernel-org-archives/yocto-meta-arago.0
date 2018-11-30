Return-Path: <manishalocal@uda0393239>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0476A529C8
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2018 22:37:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAUMb2BG116458
	for <meta-arago@arago-project.org>; Fri, 30 Nov 2018 16:37:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543617422;
	bh=0qVXi+KvukGDg1hIkBofC0tN1FBoyEnQ2kFyrtdX7Xc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kL/8/frDwobnCvNd2pdpNtooD1Dl74XmLtA7HWcxqSQ5S5HbaBfgI+Skub0UmZ7tZ
	eSv5pl/qW1B0ul8QHNKzUba1bXJi/ajutpcFRBwFdtfh24Y0cjk4yHYfMt3eaikuQs
	KPN08EmZf/GpsspjaAHAiW+Ra9COn7+KyEnxbf7Q=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAUMb2HU039275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Nov 2018 16:37:02 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 30 Nov 2018 16:37:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 30 Nov 2018 16:37:01 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAUMb1BP017603;
	Fri, 30 Nov 2018 16:37:01 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gSrPB-0004b0-ND; Fri, 30 Nov 2018 16:37:01 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Nov 2018 16:36:48 -0600
Message-ID: <20181130223649.17624-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181130223649.17624-1-manisha.agrawal@ti.com>
References: <20181130223649.17624-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 2/3] packagegroup-arago-tisdk-qte : Add qt5serialport examples
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
X-List-Received-Date: Fri, 30 Nov 2018 22:37:13 -0000
Content-Type: text/plain

qt5serailport build is needed by mmwavegesture-hmi example application.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index e383ef4b..26a976c9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -25,6 +25,7 @@ QT5_DEMOS = "\
     qtwebbrowser \
     qtwebbrowser-examples \
     qtwebengine-examples \
+    qtserialport-examples \
 "
 
 QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
-- 
2.13.0


