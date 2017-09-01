Return-Path: <manishalocal@uda0393239>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C472652A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:06:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81L6EeL024347
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504299974;
	bh=wRYzIWgor9FyRYMIZBbgO3E423aGuxV4hOj0tEpRyoU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GJHfzSMOiQB8x4oTbNcOXi7MwcE2J5qpmzD48QFrVyK1e9gwRjE0XdTAi2CsyuT/s
	RzCXzrUMwuGeBzcf1iiOSsnTvl1WQoXev6n3NnSGi5T8Yj6XGYeA1my1hhUcXNf2i7
	9zF+y+e4ePwMNNWujsmDAKStW5ngfFHgqIKKB2Hk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81L6Edh021919
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:06:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:06:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:06:14 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81L6EZR031794;
	Fri, 1 Sep 2017 16:06:14 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnt8n-0006o3-VG; Fri, 01 Sep 2017 16:06:13 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:06:09 -0500
Message-ID: <20170901210611.26095-6-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901210611.26095-1-manisha.agrawal@ti.com>
References: <20170901210611.26095-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 6/8] packagegroup-arago-tisdk-hmi: add hmi specific packagegroups
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
X-List-Received-Date: Fri, 01 Sep 2017 21:06:15 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb       | 27 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-tisdk-hmi.bb  | 29 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100755 recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
 create mode 100755 recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
new file mode 100755
index 0000000..2aafcd3
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Task to add HMI related sources into the SDK"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+HMI = ""
+
+HMI_append_ti43x = " \
+    evse-hmi-src \
+"
+
+HMI_append_ti33x = " \
+    evse-hmi-src \ 
+    protection-relays-hmi-src \
+"
+
+
+HMI_append_omap-a15 = " \
+    evse-hmi-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${HMI} \
+"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
new file mode 100755
index 0000000..125443a
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Task to add HMI related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+HMI = " \
+"
+
+
+HMI_append_ti33x = " \
+    evse-hmi \
+    protection-relays-hmi \
+"
+
+HMI_append_ti43x = " \
+    evse-hmi \
+"
+
+HMI_append_omap-a15 = " \
+    evse-hmi \
+"
+
+
+RDEPENDS_${PN} = "\
+	${HMI} \
+"
-- 
2.13.0


