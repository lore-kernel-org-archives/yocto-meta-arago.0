Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1407F52987
	for <meta-arago@arago-project.org>;
	Wed, 18 Jul 2018 15:36:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6IFZsKm066210
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 10:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531928154;
	bh=VlhDKNSBtxyb3BlYWftUycO4ycVJn7RjO8DE1ImTCuE=;
	h=From:To:CC:Subject:Date;
	b=dv3Kn478YxCIrkycsEot1J5RDRPZCcdga/P25cyanvxjz2+sQlzAqpNtBfkz1IYFA
	HQAcY2RWXNHPqL9SnpmWKNbMbnA9EMYzqc6REqEvsHzCA17RrGgD7N5tiRLL/TJ9p1
	J9bH9Z73xyru+crsbIqDTR0i9ebLKhw8Y9GtpNcs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6IFZsDY010309
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 10:35:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 18 Jul 2018 10:35:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 18 Jul 2018 10:35:53 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6IFZrs7010030;
	Wed, 18 Jul 2018 10:35:53 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Jul 2018 11:35:51 -0400
Message-ID: <1531928151-22070-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] tidl-utils: add import and simulation binary utilities needed by tidl stack
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
X-List-Received-Date: Wed, 18 Jul 2018 15:36:01 -0000
Content-Type: text/plain

* Three executables are added to the filesystem (along with sample configuration files), used for Caffe/TF model conversion and bit-exact emulation.

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-ti/tidl-utils/tidl-utils.bb            | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb
new file mode 100644
index 0000000..d675a6b
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
+SRC_URI = "git://git@bitbucket.itg.ti.com/processor-sdk/tidl-utils.git;protocol=ssh;branch=master"
+SRCREV = "6273d8b7a38e09cfcf88b2616209a47115729869"
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


