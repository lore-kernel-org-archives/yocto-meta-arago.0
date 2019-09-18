Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7A10A5299E
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 21:54:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrUOh001191
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 16:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568843610;
	bh=t5twBpvDgp7oyfOIqwZj8c2rQz7EzY1XEaWaCRhFWm4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kbnk2HaLQQ7f/C97nO1W+3EoxGrLcMLjgXRYGz1Ex0aROqwCE5jROAbUlhxKbLlT1
	DlcTCo1vxrW1aeoqBbhAyU33cC2oIBxNkIPENnmk+UCkLp8nFK0wf6NbUEeNBo57xA
	DE1/kUlnqA66Kv5/oKQeQlraeWaN8FAZR8CyK+mE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ILrUw1124259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 16:53:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 16:53:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 16:53:30 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ILrTcx087816;
	Wed, 18 Sep 2019 16:53:30 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Sep 2019 17:52:11 -0400
Message-ID: <20190918215213.12185-2-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918215213.12185-1-a0271529@ti.com>
References: <20190918215213.12185-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [master/thud/ti2019.03 2/4] tensorflow-lite: install schema.fbs which is required to build armnn with TensorFlow Lite parser
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
X-List-Received-Date: Wed, 18 Sep 2019 21:54:39 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
index b393f7eb..ba9f0d4c 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb
@@ -40,7 +40,7 @@ SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226d
 
 SRCREV = "5b900cfe4b3b848f577315a0dde09a729f770e95"
 
-PR = "r3"
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
@@ -112,6 +112,7 @@ do_install() {
     install -m 0644 ${S}/tensorflow/contrib/lite/profiling/*.h ${D}${includedir}/tensorflow/contrib/lite/profiling/
     install -d ${D}${includedir}/tensorflow/contrib/lite/schema/
     install -m 0644 ${S}/tensorflow/contrib/lite/schema/*.h ${D}${includedir}/tensorflow/contrib/lite/schema/
+    install -m 0644 ${S}/tensorflow/contrib/lite/schema/schema.fbs ${D}${includedir}/tensorflow/contrib/lite/schema/
     install -d ${D}${includedir}/tensorflow/contrib/lite/tools/
     install -m 0644 ${S}/tensorflow/contrib/lite/tools/*.h ${D}${includedir}/tensorflow/contrib/lite/tools/
     install -d ${D}${libdir}/pkgconfig
-- 
2.17.1


