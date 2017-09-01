Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3C5FB52978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:51:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KpAdF016234
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504299070;
	bh=sbXqqY7RnOcl3NGMNRRxCsWdA6SGouDxH+vCPccRM/I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fIl674pNL2hz/u842Poxramjx6Cy6xtTuBPHDQi/nD0DT9wYHk1Tn5Oyoo5UoSjOA
	3LAFEiPkmZEu+zqeb7CxpJx8DLfix2t+gSGcXmCEafHG1Wm6Jg5nUXa0M5o6+KKx+X
	RAvRr/qwClWaOVsfa0wJSB5q0ovnGaXVqESgzEMs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KpAeI014576
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:10 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:51:09 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Kp9Nu015439;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsuD-0006dd-NW; Fri, 01 Sep 2017 15:51:09 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:51:06 -0500
Message-ID: <20170901205107.25462-5-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901205107.25462-1-manisha.agrawal@ti.com>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v1 5/6] packagegroup-arago-tisdk-hmi: add protection-relays-hmi demo
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
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb  | 1 +
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 735dda8e..4921147c 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -14,6 +14,7 @@ HMI_append_ti43x = " \
 
 HMI_append_ti33x = " \
     evse-hmi-src \
+    protection-relays-hmi-src \
 "
 
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index 38ff06b4..125443ae 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -12,6 +12,7 @@ HMI = " \
 
 HMI_append_ti33x = " \
     evse-hmi \
+    protection-relays-hmi \
 "
 
 HMI_append_ti43x = " \
-- 
2.13.0


