Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id CB65C52ABA
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 16:38:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TGcSE6015360
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504024708;
	bh=7BBNI9C7lxRKpX1D6Rz21uoqBxS1lJPQnr9CDhQ+5fg=;
	h=From:To:CC:Subject:Date;
	b=i69O8m3aO4RcLPObXLLV+I66eGNecjpca65s+U8iRy3+CzUBT5c2e6dN7YdSBRno9
	wWHUuvYUbBR5AW3SyhCuI+zt1XTJpU3JTLqRgfqrYApm6gntsgh5Me0fmyXicb2j+w
	5Zn/EzVy2wdUfMY2A5jQxwYeBH8agLqvw2rDHPqM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGcS4h014009
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:38:28 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 11:38:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 11:38:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TGcSAU003648;
	Tue, 29 Aug 2017 11:38:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dmjX2-000477-AS; Tue, 29 Aug 2017 11:38:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 11:38:21 -0500
Message-ID: <20170829163826.15777-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 1/6] meta-arago-extras : recipe-apps : evse-hmi : new demo
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
X-List-Received-Date: Tue, 29 Aug 2017 16:38:31 -0000
Content-Type: text/plain

Recipe to build EVSE HMI demo. EVSE stands for electronic vehicle
supply station.  This demo is created as part of TID on EVSE to
demonsrate drawing the gui for EVSE application using QT QWidget and
rendering on LCD panel using  linuxfb QPA.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-apps/evse-hmi/evse-hmi_git.bb            | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100755 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb

diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
new file mode 100755
index 0000000..4c7c8c6
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
+PR = "r1"
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


