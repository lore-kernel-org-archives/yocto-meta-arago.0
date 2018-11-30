Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CA3EA529C8
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2018 22:37:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAUMapGU055934
	for <meta-arago@arago-project.org>; Fri, 30 Nov 2018 16:36:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543617411;
	bh=gDh3GjCtsHnfhElXOd1QDxyLgpQ2fQmOYEWSod7Bxp0=;
	h=From:To:CC:Subject:Date;
	b=hPP5twUQ3oJ347OTD2J/U08K6amEfXzTLWXmpIXUG7+dkHAiyJa7YXpAheQJXnfPu
	351w316SHXWfokEmeeE7OUtBjmIAoHHmaSlRqF7CkZfwjdsZXTAYm3+gmzwbDW+7OI
	VJBo7eS1kK2Ofi5ZtqybjECh/0kyHhCHHBLTr8RU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAUMapxq039076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Nov 2018 16:36:51 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 30 Nov 2018 16:36:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 30 Nov 2018 16:36:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAUMapOs031568;
	Fri, 30 Nov 2018 16:36:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gSrP1-0004au-Fi; Fri, 30 Nov 2018 16:36:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Nov 2018 16:36:47 -0600
Message-ID: <20181130223649.17624-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 1/3] packagegroup-*-qte-toolchain-* : Add qtserailport to QT5_DEV
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
X-List-Received-Date: Fri, 30 Nov 2018 22:37:03 -0000
Content-Type: text/plain

Add qtserialport to QT5_DEV group. This is needed by mmwavegesture-hmi
application.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroups/packagegroup-arago-qte-toolchain-target.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index d9c47d5f..e6eceec2 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -63,6 +63,8 @@ QT5_DEV = " \
         qtxmlpatterns-dev \
         qtwebengine-mkspecs \
         qtwebengine-dev \
+        qtserialport-mkspecs \
+        qtserialport-dev  \
 "
 
 QT5_DEV_append_k3 = " \
-- 
2.13.0


