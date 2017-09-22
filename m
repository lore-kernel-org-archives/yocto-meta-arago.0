Return-Path: <manishalocal@uda0393239>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5940552A69
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 19:34:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MJYLLn012888
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506108861;
	bh=07XmNEgM/1TZiZ0RdWkxSZOaqj7yL9jU0P642T4I/2U=;
	h=From:To:CC:Subject:Date;
	b=jKj5fl91YQiVtEIfBUkyNP8qCbUWp7VwYWyJr69k/dqkH4pfrL9BmPt6AbtTh95Jt
	824TVT1G7pWVikvsfVa6j3dt61eIPe67MWzh1ftn0/PAi+w7A1LHU4vGrIWnU6ctXE
	80hDF7BOsHbSHK0iggbS/excOLf0tl1kryXRIX7Q=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYLAl029675
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 14:34:21 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYL8f028788;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dvTiO-0000QO-VW; Fri, 22 Sep 2017 14:34:21 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 14:34:12 -0500
Message-ID: <20170922193417.1595-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 1/6] protection-relays-hmi : new demo
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
X-List-Received-Date: Fri, 22 Sep 2017 19:34:21 -0000
Content-Type: text/plain

This demo is developed as part of TI Design on Protection Relays HMI.

A protection relay is a smart device that receives inputs, compares
them to set points, and provides outputs. Inputs can be current,
voltage, resistance, or temperature. Outputs can include visual
feedback in the form of indicator lights and/or an alphanumeric
display, communications, control warnings, alarms, and turning
power off and on.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../protection-relays-hmi_git.bb                     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100755 meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb

diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
new file mode 100755
index 00000000..a0c7321f
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "HMI demo for Protection Relays using QT  tools"
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
+SRCREV = "b116b5628a68ba3b6db88435023cf034504655d3"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 protection_relays_hmi ${D}${bindir}
+}
-- 
2.13.0


