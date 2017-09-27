Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 57185529F8
	for <meta-arago@arago-project.org>;
	Wed, 27 Sep 2017 16:51:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8RGpjxc020484
	for <meta-arago@arago-project.org>; Wed, 27 Sep 2017 11:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506531105;
	bh=sXbHkERiPWqXh1E/lJgZJZRkdKwM7TdIIEiSTVlZY7w=;
	h=From:To:CC:Subject:Date;
	b=N3zhpgO9LvIijZZUaGcHrSGGvp67KZBMJmIOxd3otnhfvyyUtnb01p5XQOnTQSt2t
	76iqJKjqHXNtWL2iEAQDp94wqF2dHDoedFQ3qtJ11eRg4QO1DKhUee3XxUjzL0yDXT
	T2wu7B7wIMAbQDraQ3YFNQadMP8wpKxvs6wCllnw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8RGpjob011209
	for <meta-arago@arago-project.org>; Wed, 27 Sep 2017 11:51:45 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 27 Sep 2017 11:51:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 27 Sep 2017 11:51:44 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8RGpihn018857;
	Wed, 27 Sep 2017 11:51:44 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Sep 2017 12:51:41 -0400
Message-ID: <1506531101-1619-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 1/2 v2] ccief-basic: add CCLINK IEF Basic for Linux
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
X-List-Received-Date: Wed, 27 Sep 2017 16:51:45 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 changes:
* replace DESCRIPTION with SUMMARY
* avoid using INSANE_SKIP_${PN} = "ldflags"

 .../recipes-support/cclink/ccief-basic_git.bb      | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb

diff --git a/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
new file mode 100644
index 0000000..3447f63
--- /dev/null
+++ b/meta-arago-extras/recipes-support/cclink/ccief-basic_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "CC-Link Industrial Ethernet Field Basic Master and Slave Implementation"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://CCIEF-BASIC_Master/library/include/SLMP.h;beginline=1;endline=34;md5=9bcca1b46fb3c83966c242e5afa3c352"
+
+PV = "1.0"
+PR = "r0"
+
+CCIEF-BASIC_GIT_URI = "git://git.ti.com/processor-sdk/cclink.git"
+CCIEF-BASIC_GIT_PROTOCOL = "git"
+CCIEF-BASIC_GIT_BRANCH = "master"
+
+CCIEF-BASIC_SRCREV = "8b4f9aea6550ff563d21ff3979aa6e7cdc708998"
+
+BRANCH = "${CCIEF-BASIC_GIT_BRANCH}"
+SRC_URI = "${CCIEF-BASIC_GIT_URI};protocol=${CCIEF-BASIC_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${CCIEF-BASIC_SRCREV}"
+
+S = "${WORKDIR}/git"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile() {
+# build Master sample application
+    cd ${S}/CCIEF-BASIC_Master/build/linux
+    oe_runmake
+# build Slave sample application
+    cd ${S}/CCIEF-BASIC_Slave/build/linux
+    oe_runmake
+}
+
+do_install() {
+# install CCIEF BASIC binaries
+    install -d ${D}${bindir}
+    install -m 755 ${S}/CCIEF-BASIC_Master/build/linux/Master_sample ${D}${bindir}
+    install -m 755 ${S}/CCIEF-BASIC_Slave/build/linux/Slave_sample ${D}${bindir}
+
+# install CCIEF BASIC configuration files
+    install -d ${D}${datadir}/cclink
+    install -m 644 ${S}/CCIEF-BASIC_Master/sample/MasterParameter.csv ${D}${datadir}/cclink
+    install -m 644 ${S}/CCIEF-BASIC_Slave/sample/SlaveParameter.csv ${D}${datadir}/cclink
+}
+
+FILES_${PN} += "${datadir}/cclink"
-- 
1.9.1


