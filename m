Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 696F052A1F
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 19:38:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87JcJIC105692
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536349099;
	bh=ehDnofSK8dkJHSC+7jaZdBUtQeJZYkErALsGw+AXYCM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OYTm0Kn/zE53ZDYi17wf2/Imy+WzeSfv7wIqCEnp7uoRD9o0OwIk5TgCAiRjaEWvC
	h+xicqZAD8qrwsemY8XW7fYpqLjfVQ8Apo3+HCDjpVxmFE995vZnKkmMwWYJ2h38IX
	XyZbMs4aJ4gHKCMUugpq+BYuxL+c0CN87cdALTUo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JcJw8012151
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:38:19 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 14:38:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 14:38:19 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JcIlO024961
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:38:18 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Sep 2018 15:38:07 -0400
Message-ID: <1536349089-1659-2-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536349089-1659-1-git-send-email-qsu@ti.com>
References: <1536349089-1659-1-git-send-email-qsu@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v5 1/3] armnn-caffe: caffe protobuf files used in building caffe models in armnn.
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
X-List-Received-Date: Fri, 07 Sep 2018 19:38:28 -0000
Content-Type: text/plain

Caffe protobuf files used in building caffe network models in armnn.

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../recipes-support/armnn-caffe/armnn-caffe.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb

diff --git a/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
new file mode 100644
index 0000000..7fbd478
--- /dev/null
+++ b/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Caffe protobuf files - used in ARMNN for Caffe network models"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README.md;md5=01b8fd7c1b9506378a45200f64d6e0d7"
+
+SRC_URI = " \
+    git://git.ti.com/tidl/tidl-utils; \
+"
+
+SRCREV = "3af595c1b67f44c22d4ace7374c42842c0e35af5"
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


