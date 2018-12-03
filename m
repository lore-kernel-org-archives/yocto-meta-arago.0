Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 93B2A529B2
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:25:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3KOmj6089272
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543868688;
	bh=CMJYFnZPhhRFsAbBP8iwuomviT3iioG2QGdMxSDwfjs=;
	h=From:To:CC:Subject:Date;
	b=icQcvLqbD60fUNUoQKGzCdGJUjjVMu6dm2bW6EuTQxWiyQaV0sNV/BWmQ0NkBSlNQ
	E/IDVzyXWQpBe4aHEERfzAV1uGx5s0wUSz4cmjZww96HFvdLETaHeJuMGLtoZvz08f
	h1Wg6A9qHcYhmnQNGDxuyNXJ15BfVysQX1npwGN4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KOmHZ097919
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:48 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:24:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 14:24:48 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3KOm7f014560;
	Mon, 3 Dec 2018 14:24:48 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTuls-0007AM-Cf; Mon, 03 Dec 2018 14:24:48 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 14:24:36 -0600
Message-ID: <20181203202440.27508-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 1/5] mmwavegesture-hmi : create recipe to build mmwavegesture-hmi application
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
X-List-Received-Date: Mon, 03 Dec 2018 20:25:04 -0000
Content-Type: text/plain

New recipe added to build mmwavegesture-hmi application

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../mmwavegesture-hmi/mmwavegesture-hmi_git.bb     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb

diff --git a/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-extras/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
new file mode 100644
index 00000000..bece51f5
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
+SRCREV = "e8ca95ca63d891442d55aba95a01342f0b7bdd63"
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


