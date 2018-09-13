Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0FE2152993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 18:12:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DIBqaU118522
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536862312;
	bh=F8Qaoevb1YIsT1vq1aomFq7MXuH9WGsVIzne845CGFA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UKSiB04VyO0T6Qn4mPjvsPWzU4+r49npz7qOyOvu3h6Z/+eR/2xbQGH9su/Ol3EXz
	YqeZiVFsTH5MW6vsOpRemAyBp+OXLaqGdQZn0pPB38TDGWmy98Ct+06TmdDIh9+sUC
	hamZMPCt9VYGYpogwBZa16TiQQxyvV+BpiSCw3EM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIBqB7030819
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:11:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:11:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:11:52 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIBR6j025581;
	Thu, 13 Sep 2018 13:11:51 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 13:56:26 -0400
Message-ID: <1536861387-7418-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v6 4/5] armnn-tensorflow: tensorflow protobuf files for building tensorflow models in armnn
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
X-List-Received-Date: Thu, 13 Sep 2018 18:12:00 -0000
Content-Type: text/plain

From: Qin Su <qsu@ti.com>

Signed-off-by: Qin Su <qsu@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
Changes from previous versions:
* Add "_git" suffix to recipe name.
* Add version.
* DESCRIPTION --> SUMMARY.
* Add branch option for SRC_URI.
* Add dependency on protobuf-native
* Add Apache license version (Apache-2.0)

 .../armnn-tensorflow/armnn-tensorflow_git.bb       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb

diff --git a/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
new file mode 100644
index 0000000..f85c6a8
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
@@ -0,0 +1,25 @@
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
+
+DEPENDS = "protobuf-native"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${datadir}/${PN}
+    ${WORKDIR}/armnn/scripts/generate_tensorflow_protobuf.sh ${D}${datadir}/${PN} ${STAGING_DIR_NATIVE}${prefix}
+}
+
+PACKAGES =+ "${PN}-source"
+FILES_${PN}-source = "${datadir}/${PN}"
-- 
2.7.4


