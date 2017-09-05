Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id D0AB3529BE
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:09:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85H9SlW014151
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504631368;
	bh=OFe2O3AHjPOoJLBJVfGUZGpr+0ZaWznXHWJE8NIarRI=;
	h=From:To:CC:Subject:Date;
	b=niFPIU9FFweG8LNQbciJK7B59aIEzsffVLi9JM0A9KhdGmbRhUFdjvCQDs0AUgChX
	4kOINgD3o40Q8BRhOuyfCjVEHE9uSWmP8GFBh7HCo+bNKuYLpPMNFQVXLt51wuqA9J
	EFShVIjyC4mF+JqZpOPf1JKOmWMDOf+VqLotWhIQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9S1e031146
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:28 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:09:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9SdX003576;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpHLs-0003XZ-63; Tue, 05 Sep 2017 12:09:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Sep 2017 12:09:19 -0500
Message-ID: <20170905170926.13566-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v4 1/8] recipes-apps : add evse-hmi demo
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

EVSE stands for Electronic Vehicle Supply Station.  This demo is created as part
of TID on EVSE to demonsrate drawing the gui for EVSE application using QT
QWidget and rendering on LCD panel using  linuxfb QPA.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-apps/evse-hmi/evse-hmi_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb

diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
new file mode 100755
index 0000000..1bb66f5
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
+CREATE_SRCIPK = "1"                                                                               
+SRCIPK_INSTALL_DIR = "example-applications/${PN}-${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 evse_hmi ${D}${bindir}
+}
-- 
2.13.0


