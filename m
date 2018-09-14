Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2D4BD52993
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 18:40:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EIdxR4096140
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 13:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536950399;
	bh=HMKKLAgcm+BTa1J21knd5t23MOAu5qKDsrkd6oUUQNk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B1Xrvdf8/JtbY/P5q9xua08ZMXXBatZLjMC4Bwiex+JlMFtzIaW96qU440GG44rN0
	Tdf9uQtCS8cFHKyQ0j0BA2Pd2BDCgZMO4YRhcqtEoIE7BVuo/AxdgBcmIjZ+rzyvBA
	9RvyNT3Matil/IEDla8tqyRVn+O2wUGfrsSxzUzU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EIdxFo014385
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 13:39:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 13:39:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 13:39:58 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EIdqpX009776;
	Fri, 14 Sep 2018 13:39:58 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Sep 2018 14:26:57 -0400
Message-ID: <1536949618-21293-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536949618-21293-2-git-send-email-j-stiffler@ti.com>
References: <1536949618-21293-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v8 4/5] armnn-tensorflow: tensorflow protobuf files for building tensorflow models in armnn
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
X-List-Received-Date: Fri, 14 Sep 2018 18:40:07 -0000
Content-Type: text/plain

From: Qin Su <qsu@ti.com>

Signed-off-by: Qin Su <qsu@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Changes from v6:
* Use only "tensorflow" in SRCREV_FORMAT
* Install files to ${datadir}/${BPN}
* Add comment explaining what generate_tensorflow_protobuf.sh is doing
  in do_install()
* Remove source package and allow files to populate main package

Changes from previous versions:
* Add "_git" suffix to recipe name.
* Add version.
* DESCRIPTION --> SUMMARY.
* Add branch option for SRC_URI.
* Add dependency on protobuf-native
* Add Apache license version (Apache-2.0)

 .../armnn-tensorflow/armnn-tensorflow_git.bb       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb

diff --git a/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
new file mode 100644
index 0000000..0b0f148
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Tensorflow protobuf files - used in ARMNN for Tensorflow network models"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
+
+SRC_URI = " \
+    git://github.com/tensorflow/tensorflow.git;name=tensorflow; \
+    git://github.com/ARM-software/armnn.git;name=armnn;subdir=${WORKDIR}/armnn;destsuffix=armnn \
+"
+
+PV = "1.10.0"
+
+SRCREV_tensorflow = "aed8f42bafabf11c5d92ce4109a5e0408b31f9c5"
+SRCREV_armnn = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
+SRCREV_FORMAT = "tensorflow"
+
+DEPENDS = "protobuf-native"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    # Install sources + build artifacts as reuired by ARMNN
+    install -d ${D}${datadir}/${BPN}
+
+    # Convert protobuf sources to C sources and install
+    ${WORKDIR}/armnn/scripts/generate_tensorflow_protobuf.sh ${D}${datadir}/${BPN} ${STAGING_DIR_NATIVE}${prefix}
+}
-- 
2.7.4


