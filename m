Return-Path: <manishalocal@uda0393239>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5CC8F52A3E
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:17:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LHj0Q025451
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300665;
	bh=W90ZCWqC6cwoptWrs6qH2xyjGnRFfDcrotsiQMDyeMI=;
	h=From:To:CC:Subject:Date;
	b=VxuY0PkJY8A/XabBEPfiGKmDOo4I3mvtQCUDUsCtkQpNumsgZhHpN03mOQax13IAl
	KZdZhd7UjGPS7WW4p2V0XRCfo9XnzIGcLKYEzpTZDbLkhSwkvufEESjcSR7yudg0dn
	UlCyiCdmZjH/SfRe96ms6RpPS3m5e2uRZ5wGtzy0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjIp004604
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:17:45 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHiAA004658;
	Fri, 1 Sep 2017 16:17:44 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntJw-0006tH-Rj; Fri, 01 Sep 2017 16:17:44 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:17:35 -0500
Message-ID: <20170901211741.26451-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 1/7] recipes-apps : add evse-hmi demo
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
X-List-Received-Date: Fri, 01 Sep 2017 21:17:45 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-apps/evse-hmi/evse-hmi_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb

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
-- 
2.13.0


