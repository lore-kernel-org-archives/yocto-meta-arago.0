Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id 4295652A8F
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:09 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id l10so4445232oag.30
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TObQZtmss+DHJg61nm57nwlP3sZBhQM8lsGTpNtczdE=;
	b=xZ4IIr3SY/S1K0LoUQo68K8YPdU59X5x2IH9KchbYCBV/AONbjiuB5ssWxFroBRajQ
	j++tBY/mpWkMpws+407McGoHlXnTXpNlxQqqagmiSLEJeZ16IZ4FX8A2REeBQCijmO3a
	bxUGNCmBRA8mx9R16OdION+grh2ma044fmiLh/QMuu4uQPy2OJKd7nvYIFmGctxvIR0Y
	Xj2uQUdShv3cibSWgCesHtumozA8DA/oUgI5ZEJqY0BvNI9SPeboHiDncuXm47xMEiJD
	Odd5qKHfyZUxVqYS8NPcKy87ksgXo5BQ6jmstycLyWirUoxvhDPj9T+u6mlbLRK8gmXf
	G+1w==
X-Received: by 10.60.172.108 with SMTP id bb12mr86043oec.110.1361849588781;
	Mon, 25 Feb 2013 19:33:08 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.06
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:07 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:49 -0600
Message-Id: <1361849574-7710-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/10] ti-pru-sw-examples: Port PRU SW example from Arago
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:09 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add PRU SW example recipe
* Ti-pru-sw-example recipe builds examples that demonstrate the use of the
  am180x-evm PRU.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-pru-sw-examples_1.00.00.bb                  |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb

diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
new file mode 100644
index 0000000..ee62d89
--- /dev/null
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-examples_1.00.00.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "PRU sw example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=c4fd8ee7443c1b2b6238b4b5df796481"
+DEPENDS = "ti-pru-sw-app-loader ti-pru-sw-edma-library"
+RDEPENDS_${PN} = "ti-pru-sw-edma-driver"
+PR = "r0+svnr${SRCPV}"
+
+COMPATIBLE_MACHINE = "am180x-evm"
+
+SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+SRCREV = "33"
+S = "${WORKDIR}/trunk"
+
+do_compile () {
+        make -C ${S}/example_apps \
+          CCTOOLS="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"\
+          BINDIR_APPLICATIONS="${S}/example_apps/bin" \
+          BINDIR_FW="${S}/example_apps/bin" \
+          UTILS_DIR="${S}/utils"
+}
+
+do_install () {
+        install -d ${D}/usr/share/ti/ti-pru-eg/
+        install -m 0755 ${S}/example_apps/bin/* ${D}/usr/share/ti/ti-pru-eg/
+}
+
+FILES_${PN} += "${datadir}/ti/ti-pru-eg/*"
+FILES_${PN}-dbg += "${datadir}/ti/ti-pru-eg/.debug/*"
-- 
1.7.0.4


