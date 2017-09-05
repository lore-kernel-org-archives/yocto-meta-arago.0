Return-Path: <manishalocal@uda0393239>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C48B1529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:09:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85H9SjM029090
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504631368;
	bh=K/n5K/4hapu+ZHyKYrpFQ/pd11lV/23Jyoe/HPt6N5Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nGPXJzerNJ2jcZRDWd5OIlzy4svL00Zhy3D5s8fJZ20I+PnzZNq5EUSoO50TdKDWH
	l/zC46A8Lkt79zJvyt0IVSL7WzPwE5PwN2FjgkEoUVAFXQp1BAmm7sAlJ+4eBpCqmg
	34VvauPaK8NAUAS4SXl84NTllxAIRua2FNsAZKl8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9S9P010535
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:28 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:09:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9SXf008057;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpHLs-0003Xd-9e; Tue, 05 Sep 2017 12:09:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Sep 2017 12:09:20 -0500
Message-ID: <20170905170926.13566-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170905170926.13566-1-manisha.agrawal@ti.com>
References: <20170905170926.13566-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v4 2/8] recipes-apps : add protection-relays-hmi demo
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
X-List-Received-Date: Tue, 05 Sep 2017 17:09:29 -0000
Content-Type: text/plain

This demo is developed as part of TI Design on Protection Relaysi HMI.

A protection relay is a smart device that receives inputs, compares
them to set points, and provides outputs. Inputs can be current,
voltage, resistance, or temperature. Outputs can include visual
feedback in the form of indicator lights and/or an alphanumeric
display, communications, control warnings, alarms,  and turning
power off and on.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../protection-relays-hmi_git.bb                   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb

diff --git a/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
new file mode 100755
index 0000000..7ef73e6
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
+CREATE_SRCIPK = "1"
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 protection_relays_hmi ${D}${bindir}
+}
-- 
2.13.0


