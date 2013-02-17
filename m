Return-Path: <fcooperjr27@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by arago-project.org (Postfix) with ESMTPS id 2FA4B52A50
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:25 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id 24so901586yhr.4
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9kxN31uIzPJj+bZoqauWFTJp34uaKFdN78w9tq1XeBU=;
	b=sqRVW4aD79bA40zRhV+WT5mSkIH5U18vgkcWI9rr+FH9VKCP41NCM4ChrUjhjMt9pN
	Su7gvpXQUIB+uEfzz1SmD3h5MZRWYbq5/vHRt6BrLGhI4fNpt0CYQ1iPtpupRgGu2Q1s
	KxTtC10c9HjzdU8hp3sN1I32dF7g0OWIqCil9XxFXosYlOEGN4fusizRnSpo72kbjJtG
	DgCC585FZTxbGx40qFOORIsmESIvDk9e3tdjgfXeumejwVp+Chn4K/FsNiiItfA8tqdH
	beTtfiNRef5FmBTsMvtUOB6T/N0mn9kSgmTFN0tvxnXqSG3Q01SO1eYtpLyksb1EQrgq
	OjVQ==
X-Received: by 10.236.155.7 with SMTP id i7mr6818372yhk.16.1361141604831;
	Sun, 17 Feb 2013 14:53:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:23 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:52:57 -0600
Message-Id: <1361141595-1687-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/20] ti-pru-sw-edma-library: Port recipe from Arago
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:25 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add PRU sw edma library recipe from Arago
* This recipe builds and stages the edma user space libraries for use by the
  PRU software.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-pru-sw-edma-library_1.00.00.bb              |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb

diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
new file mode 100644
index 0000000..613962e
--- /dev/null
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edma-library_1.00.00.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "eDMA library for use by PRU sw example applications"
+HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://edma.c;beginline=1;endline=46;md5=f6bde95a8e2277050e36b257ca9214a6"
+
+DEPENDS += "virtual/kernel"
+
+RDEPENDS_${PN} += "ti-pru-sw-edma-driver"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "omapl138"
+
+MACHINE_KERNEL_PR_append = "a+svnr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+SRCREV = "33"
+S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
+
+do_compile () {
+	oe_runmake KERNEL_DIR="${STAGING_KERNEL_DIR}" CCTOOL_PREFIX=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
+}
+
+do_install () {
+	install -d ${D}/${libdir}
+	install -m 0755 ${S}/../lib/libedmautils.a ${D}/${libdir}/
+}
-- 
1.7.0.4


