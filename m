Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 11E88529A2
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 19:00:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2KIxIfI016125
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 13:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521572358;
	bh=TpfLI+03tLGzrcUm5ZtP8JbRHh9sMj17PrVTzStQo9U=;
	h=From:To:Subject:Date;
	b=FOccuuO9TOqH7Yemo07LWeh0G0vhLlFGshIfS9BDCQEWbgeXhtwu5XAuISjcWES+Y
	zYv6UttHkDrr97nyywt1kE7OuA3Z1yvvmaycu1+1pzpRAHk0RI8uoXUewylCTZgIDX
	i6vz0im6rq7UuENhG6kJjrAxxAdJUqaUI+LGsrDo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KIxI9n009106
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 13:59:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 13:59:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Mar 2018 13:59:17 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KIxHvw022092
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 13:59:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Mar 2018 14:59:13 -0400
Message-ID: <1521572354-30785-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 1/2] qtbase-conf: set eglfs raw as the default QPA EGLFS mode
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
X-List-Received-Date: Tue, 20 Mar 2018 19:00:18 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-qt/qt5/qtbase-conf/qt_env.sh       | 1 +
 recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 1 +
 2 files changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase-conf/qt_env.sh b/recipes-qt/qt5/qtbase-conf/qt_env.sh
index c897da9..6abf5e9 100644
--- a/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -3,3 +3,4 @@
 ### QT Environment Variables ###
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
+export QT_QPA_EGLFS_INTEGRATION=none
diff --git a/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index b35b187..8975458 100644
--- a/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -4,3 +4,4 @@
 export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
+export QT_QPA_EGLFS_INTEGRATION=none
-- 
1.9.1


