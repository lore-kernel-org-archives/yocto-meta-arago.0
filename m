Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gh0-f172.google.com (mail-gh0-f172.google.com
	[209.85.160.172])
	by arago-project.org (Postfix) with ESMTPS id 0374252A4C
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:26 +0000 (UTC)
Received: by mail-gh0-f172.google.com with SMTP id z22so473532ghb.31
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=TObQZtmss+DHJg61nm57nwlP3sZBhQM8lsGTpNtczdE=;
	b=Kgt5axhTTthaotZlFYeaZ4Csh/SvslJ4REISc0VdFF4yEkhW1I6nOcB+2JLwJeYVLK
	FH//rPDu46wNH5L899d1WKwQQtpg7g57DzzoGQYWELieQacd3nTyQzGdJ4CYk+ScD4Ra
	Qaxf+BzDmkOAsscOmitJcQTFbVt78pxFn1dcezXeDI7qab4I/YjT5i9sX1m2yWBWxNxj
	Vm/v2Zg0sWCRL7Lkn0iV6qNmL2UlPcZZXdVtzToxV30bwwMVor7CXa6iZ1Ab8xe0nfh9
	Su3RPgSl21ClssMiSGkObq4aKzIvFAkIb8to3oLuVVMNkNOCfquvAjb7J+x0RmP6E901
	feEA==
X-Received: by 10.236.133.147 with SMTP id q19mr16996476yhi.41.1361141606540; 
	Sun, 17 Feb 2013 14:53:26 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:25 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:52:58 -0600
Message-Id: <1361141595-1687-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/20] ti-pru-sw-examples: Port PRU SW example from Arago
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:27 -0000

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


