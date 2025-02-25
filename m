Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1999EC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:19:15 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2089.1740525550914424864
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 15:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zu2hPmKp;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51PNJ9Gm1363805
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Feb 2025 17:19:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740525549;
	bh=/53ECEPwJQscngaLYmzFkuHdUTUHVsi8SeyNGLZ3sBs=;
	h=From:To:CC:Subject:Date;
	b=Zu2hPmKpp+SSJ7mwWv9DRdeqwFGAP3IZeolK5tp1O1gNI+tweGEKM+Oq81VaWujr6
	 wyglZLxmDwGV2U58QMthCKtOk21uuCA37nmtyKhww40zdIugi8CEdLC15Vz7jF6Psd
	 ZX3uGzljd6HsSVObTq4+luPuPQz+MxuxWLk8IVe0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PNJ9BF107754;
	Tue, 25 Feb 2025 17:19:09 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 17:19:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 17:19:09 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PNJ9OE006100;
	Tue, 25 Feb 2025 17:19:09 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap][PATCH v2] meta-arago-extras: Add recipe for NNStreamer
Date: Tue, 25 Feb 2025 17:19:08 -0600
Message-ID: <20250225231908.75303-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 23:19:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15918

NNStreamer is an efficient and flexible stream pipeline framework for
complex neural network applications.

NNStreamer provides a set of GStreamer plugins so developers may apply
neural networks, attach related frameworks (including ROS, IIO,
FlatBuffers, and Protocol Buffers), and manipulate tensor data streams
in GStreamer pipelines easily and execute such pipelines efficiently.

It was initially developed by Samsung and then transferred to LF AI
Foundation as an incubation project.

Learn more at https://nnstreamer.ai/

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Remove .a files from -dev
 - Disable Arm NN support for now
 - Add QA skip for buildpaths

 .../nnstreamer/nnstreamer_2.4.0.bb            | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
new file mode 100644
index 00000000..50d16d29
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
@@ -0,0 +1,67 @@
+SUMMARY = "NNStreamer, Stream Pipeline Paradigm for Nerual Network Applications"
+DESCRIPTION = "NNStreamer is a set of Gstreamer plugins that allow Gstreamer developers to adopt neural network models easily and efficiently."
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c25e5c1949624d71896127788f1ba590"
+
+SRC_URI = "git://github.com/nnstreamer/nnstreamer.git;branch=main;protocol=https"
+PV = "2.4.0+git"
+SRCREV = "7c57c288250578cad598f065b6fda6c0ff720cf9"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS = " \
+	orc-native \
+	glib-2.0 \
+	gstreamer1.0 \
+	gstreamer1.0-plugins-base \
+	python3 \
+	python3-numpy \
+	json-glib \
+"
+
+PACKAGECONFIG ??= " \
+	protobuf \
+	flatbuffers \
+	tests \
+	onnxruntime \
+	tensorflow-lite \
+"
+
+PACKAGECONFIG[tests] = "-Denable-test=true -Dinstall-test=true, -Denable-test=false, gtest"
+PACKAGECONFIG[protobuf] = "-Dprotobuf-support=enabled, -Dprotobuf-support=disabled, protobuf protobuf-native"
+PACKAGECONFIG[flatbuffers] = "-Dflatbuf-support=enabled, -Dflatbuf-support=disabled, flatbuffers flatbuffers-native"
+PACKAGECONFIG[armnn] = "-Darmnn-support=enabled, -Darmnn-support=disabled, armnn"
+PACKAGECONFIG[onnxruntime] = "-Donnxruntime-support=enabled, -Donnxruntime-support=disabled, onnxruntime"
+PACKAGECONFIG[tensorflow-lite] = "-Dtflite2-support=enabled, -Dtflite2-support=disabled, tensorflow-lite"
+
+do_install:append() {
+	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+	# Install test data
+	install -d ${D}/${bindir}/unittest-nnstreamer/tests
+	cp $CP_ARGS ${S}/tests/test_models ${D}/${bindir}/unittest-nnstreamer/tests
+	rm -f ${D}/${bindir}/unittest-nnstreamer/tests/test_models/models/tvm*
+}
+
+FILES:${PN} += "\
+	${libdir}/*.so \
+	${libdir}/gstreamer-1.0/*.so \
+	${libdir}/nnstreamer/* \
+	${sysconfdir}/nnstreamer.ini \
+"
+INSANE_SKIP:${PN} += "dev-so"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES:${PN}-tests += "\
+	${libdir}/nnstreamer/customfilters/* \
+	${bindir}/unittest-nnstreamer/* \
+"
+INSANE_SKIP:${PN}-tests += "buildpaths"
+
+FILES:${PN}-dev = "\
+	${includedir}/nnstreamer/* \
+	${libdir}/pkgconfig/*.pc \
+"
-- 
2.39.2


