Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8FE1E529E5
	for <meta-arago@arago-project.org>;
	Wed, 29 Apr 2020 07:43:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03T7fcfp130329
	for <meta-arago@arago-project.org>; Wed, 29 Apr 2020 02:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588146098;
	bh=VeC6x9KkK9tnIuPpzjMz+X8bEvi82uQ9E1rBc7P8vAo=;
	h=From:To:CC:Subject:Date;
	b=v/NUXDSGf2RMRS/2ARaZrudW+ONPpw1eZDUVjV0SfaTXkGNbP5BIKpiy7kKhqHz0m
	VQ1YMiV+zoa8oJ2DoaQKkz81ufCWj1aZcOKrJ4t7U2S4e9cTpz8dhDqemJPHifsDuf
	mSl5n3CSuBrn05UFf9mIiS883yVyRTS7XZW390mA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03T7fcOf046411
	for <meta-arago@arago-project.org>; Wed, 29 Apr 2020 02:41:38 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 29 Apr 2020 02:41:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 29 Apr 2020 02:41:38 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03T7fa68055004;
	Wed, 29 Apr 2020 02:41:36 -0500
From: <nikhil.nd@ti.com>
To: <denys@ti.com>
Date: Wed, 29 Apr 2020 13:11:33 +0530
Message-ID: <20200429074133.6274-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus PATCH v1] recipes-devtools: Add rpmsg-char-helper recipe
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
X-List-Received-Date: Wed, 29 Apr 2020 07:43:59 -0000
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

rpmsg-char-helper library simplifies the userspace
communication with the remoteproc devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../rpmsg-char-helper/rpmsg-char-helper.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb

diff --git a/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb b/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
new file mode 100644
index 00000000..ca008d7a
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/rpmsg-char-helper/rpmsg-char-helper.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Rpmsg char Helper library recipe"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PROTOCOL = "git"
+BRANCH = "master"
+SRCREV = "fba8b83ea02d978eefbbd65a885daafa9c93b479"
+SRC_URI = "git://git.ti.com/glsdk/rpmsg-char-helper.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF_j7-evm += " \
+	--with-soc=j7 \
+"
-- 
2.17.1


