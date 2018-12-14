Return-Path: <manishalocal@uda0393239>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B0D7052991
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 20:19:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEKJFTM113536
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 14:19:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544818755;
	bh=GUcaxUmDQZo9VdwFV7R3vVROPDvJ9ThSk6s179BIBTg=;
	h=From:To:CC:Subject:Date;
	b=GIEOqMKiOa9fHBtVC+C6TFiokvkwtFmgcJOiBvJq5ZgF1CLkdiRDipljGe7UD0guZ
	PeF283kZuPBylS0Xq/JI4ReUmw6JncSDR5AcVdjCNVP1K56BIMXz7fjvHAgRZ0EV6P
	O3aeUVt28btihKwraJpKgG3KBDVzOMDQkdRW3nB0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEKJFGo004057
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 14:19:15 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 14:19:15 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 14:19:14 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEKJEZ2028447;
	Fri, 14 Dec 2018 14:19:14 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXtvW-000436-OY; Fri, 14 Dec 2018 14:19:14 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 14:19:11 -0600
Message-ID: <20181214201912.15528-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v1 1/2] mmwavegesture-hmi : create recipe to build mmwavegesture-hmi application
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
X-List-Received-Date: Fri, 14 Dec 2018 20:19:27 -0000
Content-Type: text/plain

New recipe added to build mmwavegesture-hmi application

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../mmwavegesture-hmi/mmwavegesture-hmi_git.bb     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb

diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
new file mode 100644
index 00000000..e4ccba48
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Gesture baed HMI demo using mmWave IWR1642 chip and Sitara AM device"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=e7e749ff1989b18db836e5d9910a37e9"
+
+inherit qt-provider
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/sitara-linux/mmwavegesture-hmi.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "c6052e1cd1079b09bef78cdcd8e5151133c3b4e1"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "qtbase qtquick1 qtserialport"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 mmwavegesture_hmi ${D}${bindir}
+}
-- 
2.13.0


