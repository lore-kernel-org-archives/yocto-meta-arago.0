Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9B8F952A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:28:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KSXDK013467
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297713;
	bh=dOT+ARE2FhmpUM5sV5i8HpyQIQUYcCH4WT3ZfkHLiEo=;
	h=From:To:CC:Subject:Date;
	b=MCVvYlsdQPv9q2Gj94ZuKHlsGORvPzTxNkmdQ7blRtwGqg2/4S/0DssoPH+zSyQNx
	Ktw9k+bqeBHySanYKiJYkbZ0CUKi1vZiDGp1dWQmkVEW1s4BP6sPow6k9+Bt6PuhWg
	oNTJ9DuA4L5UZQPDEt7xZ7wBXKUf+VDtrl1rmEIo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXek028823
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:28:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:28:32 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSWRt024776;
	Fri, 1 Sep 2017 15:28:32 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsYK-0006Ts-QD; Fri, 01 Sep 2017 15:28:32 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:28:24 -0500
Message-ID: <20170901202830.24876-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1 1/7] recipe-apps : add evse and protection-relays hmi demo recipe
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
X-List-Received-Date: Fri, 01 Sep 2017 20:28:34 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-apps/evse-hmi/evse-hmi_git.bb              | 23 ++++++++++++++++++++++
 .../protection-relays-hmi_git.bb                   | 23 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb
 create mode 100755 recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb

diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
new file mode 100755
index 0000000..abd4e90
--- /dev/null
+++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
+
+inherit qt-provider
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
+
+S = "${WORKDIR}/git"
+
+CREATE_SRCIPK_evse-hmi = "1"                                                                               
+SRCIPK_INSTALL_DIR_evse-hmi = "example-applications/${PN}-${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 evse_hmi ${D}${bindir}
+}
diff --git a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
new file mode 100755
index 0000000..a6ece91
--- /dev/null
+++ b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "HMI demo for Prectection Relays using QT QWidget tools"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
+
+inherit qt-provider
+
+PV = "1.0"
+PR = "r0"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "c8764aaba365302090179b6720cbfc994e169842"
+
+S = "${WORKDIR}/git"
+
+CREATE_SRCIPK_protection-relays-hmi = "1"
+SRCIPK_INSTALL_DIR_protection-relays-hmi = "example-applications/${PN}-${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 protection_relays_hmi ${D}${bindir}
+}
-- 
2.13.0


