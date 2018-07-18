Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4B97C52987
	for <meta-arago@arago-project.org>;
	Wed, 18 Jul 2018 18:17:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6IIHS5w051276
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 13:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531937848;
	bh=mJQTFX70GWo/igDghe4uVk7PsKrD7Rdk21CVUcjOBpc=;
	h=From:To:CC:Subject:Date;
	b=dWyeRtwdvER8sycSOmB+HWueH+pvcFEyQxblUc8JNdprZ7KLV8JAVUo1qFzVcj4dl
	UnKvfUFJPDMcvFzUYZ8cTV4v3FxzLoU9h7M0T698VyzaxOHK1TzJHXaHduuGctnv2m
	IXx95BCrsZHJ5UDA+CdboiWi52EEA0H6re90Nbtc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6IIHSDZ022880
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 13:17:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 18 Jul 2018 13:17:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 18 Jul 2018 13:17:27 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6IIHRtg028371;
	Wed, 18 Jul 2018 13:17:27 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Jul 2018 14:17:24 -0400
Message-ID: <1531937844-15959-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCHv2] tidl-utils: add import and simulation binary utilities needed by tidl stack
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
X-List-Received-Date: Wed, 18 Jul 2018 18:17:35 -0000
Content-Type: text/plain

* Three executables are added to the filesystem (along with sample configuration files), used for Caffe/TF model conversion and bit-exact emulation.

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-ti/tidl-utils/tidl-utils.bb            | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
new file mode 100644
index 0000000..264b030
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
@@ -0,0 +1,40 @@
+SUMMARY = "TIDL Utilities and configuration files"
+DESCRIPTION = "TIDL Utilities for standalone simulation and importing / translation of Caffe and TF-Slim models"
+HOMEPAGE = "http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Foundational_Components.html#tidl"
+LICENSE = "TI-TFL"
+
+PV = "1.0.0.0"
+INC_PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/LICENSE.txt;md5=a93aa5af7a3bbbb6fb34c8df59efaa5c"
+
+RDEPENDS_${PN} += " tidl-api tidl-examples "
+
+SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
+SRCREV = "93f66d2c53960b13b7e7f20208ee205f727aaf28"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/git"
+
+TARGET_class-target = "arm"
+TARGET_class-native = "x86"
+TARGET_class-nativesdk = "x86"
+
+CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+
+do_install() {
+  install -d ${D}${bindir}
+  install -d ${D}${datadir}/ti/tidl/utils/test
+  install -d ${D}${datadir}/ti/tidl/utils/docs
+  install -m 755 ${S}/${TARGET}/bin/* ${D}${bindir}
+  cp ${CP_ARGS} ${S}/test/* ${D}${datadir}/ti/tidl/utils/test/.
+  cp ${CP_ARGS} ${S}/docs/* ${D}${datadir}/ti/tidl/utils/docs/.
+}
+
+FILES_${PN} += " ${datadir}/ti/tidl/utils \
+                 ${bindir} "
+
+BBCLASSEXTEND = "native nativesdk"
+
+INSANE_SKIP_${PN} += "build-deps ldflags already-stripped "
-- 
1.9.1


