Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 97C04529AE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 14:00:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SE0Sfo028538
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 09:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535464828;
	bh=LXjJKCYp/KOvsltyr5p4r4X0C6Il2un2z2aA6Hs18sY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=D54NfOsuqPZpaCB2t5Krre0yKfFv764hmYzvtJrICdrYNgMEaUArKIGiVzk+tVdk3
	fET0UyvLnqTVVROdDqNDM/CsOXh2q+4wiT/Ftem0s5ek4zqP8gXyiJB6N8OWRtUQdJ
	UQSFUxPN0+IrHyK8P05500MbfZXaxcbfAgpGsGBY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SE0SJ0009078
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 09:00:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 09:00:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 09:00:28 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SE0R4c023645
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 09:00:28 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 10:00:12 -0400
Message-ID: <1535464813-10876-3-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535464813-10876-1-git-send-email-qsu@ti.com>
References: <1535464813-10876-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 2/3] armnn-tensorflow: tensorflow protobuf files used in building tensorflow models in armnn.
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
X-List-Received-Date: Tue, 28 Aug 2018 14:00:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Tensorflow protobuf files built with protobuf version 3.2.0 and used in
building tensorflow network models in armnn.

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../armnn-tensorflow/armnn-tensorflow.bb           | 29 +++++++++
 .../generate_tensorflow_protobuf.sh                | 73 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh

diff --git a/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb
new file mode 100644
index 0000000..1787819
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Tensorflow protobuf files - used in ARMNN for Tensorflow network models"
+LICENSE = "Apache"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01e86893010a1b87e69a213faa753ebd"
+
+SRC_URI = " \
+    git://github.com/tensorflow/tensorflow.git \
+    file://generate_tensorflow_protobuf.sh;subdir=${S} \
+"
+
+SRC_URI += " \
+	https://github.com/protocolbuffers/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip;name=protoc;subdir=${WORKDIR}/protoc;destsuffix=protoc \
+"
+
+SRCREV = "aed8f42bafabf11c5d92ce4109a5e0408b31f9c5"
+
+SRC_URI[protoc.md5sum] = "f0b567f781665f47afd6b5afa53cee3d"
+SRC_URI[protoc.sha256sum] = "9cf9a8661d649b8477fe0ad32a8b28d351a170a62e210bf848d90a29f1f4df9d"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${datadir}/${PN}
+        chmod +x ${S}/generate_tensorflow_protobuf.sh
+	${S}/generate_tensorflow_protobuf.sh ${D}${datadir}/${PN} ${WORKDIR}/protoc 
+}
+
+PACKAGES =+ "${PN}-source"
+FILES_${PN}-source = "${datadir}/${PN}"
+
diff --git a/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh
new file mode 100644
index 0000000..52c1827
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh
@@ -0,0 +1,73 @@
+#!/bin/sh
+#
+# Copyright © 2017 Arm Ltd. All rights reserved.
+# See LICENSE file in the project root for full license information.
+#
+
+THIS_SCRIPT=$0
+OUTPUT_DIR=$1
+PROTOBUF_INSTALL_DIR=$2
+
+usage()
+{
+  echo
+  echo "Usage: ${THIS_SCRIPT} <OUTPUT_DIR> [PROTOBUF_INSTALL_DIR]"
+  echo
+  echo "  <OUTPUT_DIR> is the location where the generated files will be placed"
+  echo "  [PROTOBUF_INSTALL_DIR] the location of the protobuf installation"
+  echo
+}
+
+if [ "x$OUTPUT_DIR" = "x" ]
+then
+  usage
+  exit 1
+fi
+
+mkdir -p ${OUTPUT_DIR}
+ERR=$?
+if [ $ERR -ne 0 ]
+then
+  echo
+  echo "Cannot create output dir: ${OUTPUT_DIR}"
+  echo "mkdir returned: $ERR"
+  echo
+  usage
+  exit 1
+fi
+
+
+if [ "x${PROTOBUF_INSTALL_DIR}" = "x" ]
+then
+  PROTOBUF_INSTALL_DIR=/usr/local
+fi
+
+if [ ! -x "${PROTOBUF_INSTALL_DIR}/bin/protoc" ]
+then
+  echo
+  echo "No usable protocol buffer (protoc) compiler found in ${PROTOBUF_INSTALL_DIR}/bin/"
+  echo "You can specify the location of the protobuf installation as the second"
+  echo "argument of ${THIS_SCRIPT}."
+  usage
+  exit 1
+fi
+
+
+TF_PROTO_FILES=tensorflow/contrib/makefile/tf_proto_files.txt
+if [ -r $TF_PROTO_FILES ]
+then
+  OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
+  for i in `cat $TF_PROTO_FILES`
+  do
+    LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH:${PROTOBUF_INSTALL_DIR}/lib \
+    $PROTOBUF_INSTALL_DIR/bin/protoc $i \
+      --proto_path=. \
+      --proto_path=${PROTOBUF_INSTALL_DIR}/include \
+      --cpp_out $OUTPUT_DIR
+  done
+else
+  echo "Couldn't find $TF_PROTO_FILES. This script should be run from the"
+  echo "tensorflow source directory."
+  exit 1
+fi
+
-- 
1.9.1


