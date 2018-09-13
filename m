Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BF8B852A9E
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:00:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DIxtfs104841
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536865195;
	bh=+5tSpJNqvA8SwdlJvx6FhY8KPiDe0YJtJDKxRgeT7c0=;
	h=From:To:CC:Subject:Date;
	b=r10mu6Xa6a5L1n6hRqyN717jfOQ8ne/cGZh/i5Mbt/wDLbFCYBP9DzzUukTRkCrQn
	RZUnoI8Pdp7IpLkaemnB+YLcJX/VjqRX/+pYEKILbNgnn/QwFQddwtACA0Qfr+HLgl
	vNwncUSH5j1Z3tdRUoeAM83kr3MNWyK1YCBcnU70=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIxt8B010745
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:59:55 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:59:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:59:55 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIxsk5001439;
	Thu, 13 Sep 2018 13:59:55 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 14:47:11 -0400
Message-ID: <1536864433-24251-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v7 3/5] armnn-caffe: caffe protobuf files used in building caffe models in armnn.
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
X-List-Received-Date: Thu, 13 Sep 2018 19:00:04 -0000
Content-Type: text/plain

From: Qin Su <qsu@ti.com>

Signed-off-by: Qin Su <qsu@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Changes from v6:
* fix path in LIC_CHKSUM_FILES

Changes from previous versions:
* Add "_git" suffix to recipe name.
* Add version.
* DESCRIPTION --> SUMMARY.
* Add branch option for SRC_URI.
* For installation, use install by looping over files.
* Update license information.
  - Use BSD-2-Clause license from caffee sources which were used to
    generate these files.

 .../recipes-support/armnn-caffe/armnn-caffe_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb

diff --git a/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
new file mode 100644
index 0000000..509324b
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Caffe protobuf files - used in ARMNN for Caffe network models"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://caffeImport/LICENSE;md5=91d560803ea3d191c457b12834553991"
+
+SRC_URI = " \
+    git://git.ti.com/tidl/tidl-utils;branch=${BRANCH} \
+"
+
+PV = "1.0"
+
+BRANCH = "master"
+SRCREV = "16030b2e43de6143f371072d54760737ddda0645"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${datadir}/${BPN}/caffe/proto/
+        for file in ${S}/caffeImport/*
+        do
+            install -m 0644 $file ${D}${datadir}/${BPN}/caffe/proto/
+        done
+}
-- 
2.7.4


