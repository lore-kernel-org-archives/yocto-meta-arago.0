Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 745E7529CD
	for <meta-arago@arago-project.org>;
	Fri, 25 Aug 2017 15:55:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PFtjwY011403
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 10:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503676545;
	bh=OFFOKjixmgOYI/3oaBNYcyTn6c+561uH4/v/ZukPqOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vcVDbKdMAvjIRcOJOsQFdfvZeOliSukS7P1YLRGCYcwsW2buwjJadPXkSm4PVNH+K
	X2TO6pa1NptSHbBk1vMJrBsZ2VfI/zVCNmFSO4Efn0B0vfqvW5cggX5M6XeD/2SoLs
	PO0jVxU4xUjGOV8aoSlHH9mKYKuZlcaQsp0eRC2o=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PFtjx7024834
	for <meta-arago@arago-project.org>; Fri, 25 Aug 2017 10:55:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 10:55:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 10:55:44 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PFtiFQ016712;
	Fri, 25 Aug 2017 10:55:44 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dlGxU-0001yT-Kb; Fri, 25 Aug 2017 10:55:44 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>, <manisha.agrawal@ti.com>
Date: Fri, 25 Aug 2017 10:55:35 -0500
Message-ID: <20170825155535.7543-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170825155535.7543-1-manisha.agrawal@ti.com>
References: <20170825155535.7543-1-manisha.agrawal@ti.com>
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
X-List-Received-Date: Fri, 25 Aug 2017 15:55:46 -0000
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


