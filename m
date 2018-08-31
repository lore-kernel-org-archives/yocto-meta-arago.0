Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id DA608529AE
	for <meta-arago@arago-project.org>;
	Fri, 31 Aug 2018 18:50:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7VIoemH111570
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535741440;
	bh=EshMe9mVstamccRCmStU2IOrJmj+ll6vela+uv2Tzwc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Tpo09HTpZD55aT+Re0T5D8kabp51uergEs8no2eUkR2nH3tXxo1InbPGMxdUQodHc
	OrPnN2bW0JUHhOM9boImF7dslLuKN5jNQa53FLhQC95Bey540cgXD0Rtga2jT8XvJM
	ivMhOUu3lbm1NFSd3542co+yoGT0OGvvZhRM+od8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIoeVv005634
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 31 Aug 2018 13:50:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 31 Aug 2018 13:50:40 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIodnb009985
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:40 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Aug 2018 14:50:31 -0400
Message-ID: <1535741433-30388-2-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535741433-30388-1-git-send-email-qsu@ti.com>
References: <1535741433-30388-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 1/3] armnn-caffe: caffe protobuf files used in building caffe models in armnn.
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
X-List-Received-Date: Fri, 31 Aug 2018 18:50:49 -0000
Content-Type: text/plain

Caffe protobuf files built with protobuf version 3.2.0 and used in
building caffe network models in armnn.

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../recipes-support/armnn-caffe/armnn-caffe.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb

diff --git a/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
new file mode 100644
index 0000000..6234474
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Caffe protobuf files - used in ARMNN for Caffe network models"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README.md;md5=01b8fd7c1b9506378a45200f64d6e0d7"
+
+SRC_URI = " \
+    git://git@bitbucket.itg.ti.com/processor-sdk/tidl-utils.git;protocol=ssh; \
+"
+
+SRCREV = "9ae62427ad233597bf345e9572c252eedf8cc2b3"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${datadir}/${PN}/caffe/proto/
+	cp ${S}/caffeImport/* ${D}${datadir}/${PN}/caffe/proto/.
+}
+
+
-- 
1.9.1


