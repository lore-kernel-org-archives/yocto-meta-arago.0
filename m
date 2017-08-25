Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B48AD529CD
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 16:02:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PG2wrp025473
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 11:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503676978;
	bh=OFFOKjixmgOYI/3oaBNYcyTn6c+561uH4/v/ZukPqOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z+JtbZqdNo0ojeKtHldM9ruQwQXiqjhQ8C5U0j0KLAnO5pL8+vxNo1+YTtmsTljm7
	PA6tNzXgq0Uk1blM2//xUBXzDtwohBtCjHwnxU1en8ukA2ZM6v3CboSWm06nff5UR1
	L9TPv6qzSY6V+Il9cm8Gus0/iloQIhE47uCbphQo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PG2wMw005736
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 11:02:58 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 11:02:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 11:02:58 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PG2wMd025515;
	Fri, 25 Aug 2017 11:02:58 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dlH4U-00037u-2P; Fri, 25 Aug 2017 11:02:58 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>, <j-stiffler@ti.com>, <denys@ti.com>
Date: Fri, 25 Aug 2017 11:02:45 -0500
Message-ID: <20170825160245.11812-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170825160245.11812-1-manisha.agrawal@ti.com>
References: <20170825160245.11812-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty]PATCH 3/3] meta-arago-extras : recipe-apps : evse-hmi : new demo
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
X-List-Received-Date: Fri, 25 Aug 2017 16:02:59 -0000
Content-Type: text/plain

Recipe to build EVSE HMI demo

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb

diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
new file mode 100755
index 0000000..07e83dc
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
+
+inherit qt-provider
+
+PV = "01.00.00"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 evse_hmi ${D}${bindir}
+}
-- 
2.13.0


