Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A4205529EF
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwL1C112288
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428301;
	bh=abX0YYU34wKxLmcKne5EE0oDeK/inwq5ft+PiUo9Ncs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zJVsgAwRtsSDMT7t3+Al1zqe+bM0sAPs2/f1LipNZtbgczhLIktGOz3Rx3OVyhEWz
	BfH3pd4sqXFGx4z0Y+5mANej8mZHwPHdW9H28mpBjBt4YaRLLRSsWK7ZPWBHqwCjhR
	mQ+VS3MVI19cRfs47L9dk8SkH28VS3F5tFSK1ug4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwKxi053798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:20 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCe074536;
	Wed, 21 Aug 2019 17:58:20 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:03 -0400
Message-ID: <20190821225807.22947-4-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821225807.22947-1-a0271529@ti.com>
References: <20190821225807.22947-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 3/7] tensorflow-lite-libeigen: add the version for commit fd6845384b86
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
X-List-Received-Date: Wed, 21 Aug 2019 22:59:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* This commit is required by tensorflow-lite version 1.12, which cannot
  be built with either libeigen_3.3.5.bb or libeigen_3.3.7.bb in meta-oe

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../tensorflow-lite-libeigen_git.bb           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-libeigen_git.bb

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-libeigen_git.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-libeigen_git.bb
new file mode 100644
index 00000000..a4bcb76f
--- /dev/null
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-libeigen_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
+AUTHOR = "BenoîJacob and GaëGuennebaud and others"
+HOMEPAGE = "http://eigen.tuxfamily.org/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = "http://bitbucket.org/eigen/eigen/get/fd6845384b86.tar.gz;downloadfilename=${BP}.tar.gz"
+SRC_URI[md5sum] = "4c884968ede816a84c70e2cd2c81de8d"
+SRC_URI[sha256sum] = "d956415d784fa4e42b6a2a45c32556d6aec9d0a3d8ef48baee2522ab762556a9"
+
+S = "${WORKDIR}/eigen-eigen-fd6845384b86"
+
+inherit cmake
+
+FILES_${PN} = "${libdir}"
+FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+
+# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.17.1


