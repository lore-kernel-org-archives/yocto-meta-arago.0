Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 423B152A8F
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:07 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so4340645oag.4
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9kxN31uIzPJj+bZoqauWFTJp34uaKFdN78w9tq1XeBU=;
	b=QmM6uixTBt7u5ZtjL25nOLI6kdt6fOqFvc1GVFSpXCDzk2II6gVrZJbfzAWoWDSN4K
	zKCFgxRpmZRXXq3bjJXU4ddV8wn76AR38eT4jd+RjvJENb/U/5SJdl+upfuAGiaIiDLD
	ZVqxxc68hvj79jrFdLOpbeiBk2vCaHdC88/T0Bat8Et5EPBtmby6Ty9dC1uiNlfY+20M
	Rysxq9w1ZPlPhn4q+vty2niN81tztVvOlMZ1sibKPTYguiRqzs31dZr1HRrT0qee6kCJ
	NSUdgq99UxXkdbN447Dap/G5/U+QzWyVcTuqrk3YqSDPs1NV2tqiAFeCac+gEzJaqH4W
	gt4A==
X-Received: by 10.60.22.69 with SMTP id b5mr145282oef.38.1361849586778;
	Mon, 25 Feb 2013 19:33:06 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.04
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:05 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:48 -0600
Message-Id: <1361849574-7710-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/10] ti-pru-sw-edma-library: Port recipe from Arago
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:08 -0000

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


