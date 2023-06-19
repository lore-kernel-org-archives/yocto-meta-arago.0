Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C98EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 15:12:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.10096.1687187564115616166
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 08:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fWFu6WNz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35JFCgfq099355;
	Mon, 19 Jun 2023 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687187562;
	bh=DHtEN66JOGrX26bJ+UEngpZ39NTDpxZx1m3/K4iHbRQ=;
	h=From:To:Subject:Date;
	b=fWFu6WNzTb7mySPaihifkDQbxS4O8DuqGkLWOKbwfGB7QoPdDtD8F0ktls0DU5TH2
	 vEbhcoRnibE3SSOpYcuLQMOrFze+y2Q+Xo3ZQF9qlwNWxTfnjdpZ4soM7w3q1+FpX7
	 HpeYsicp57FNnXG58gpNTdA+phgZFmsUDiHX6sw8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35JFCgB0013240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 10:12:42 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 10:12:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 10:12:41 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35JFCfAO128963;
	Mon, 19 Jun 2023 10:12:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qBGYb-0004dH-LK; Mon, 19 Jun 2023 10:12:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH v2 1/3] python3-pybind11: Backport from meta-openembedded master
Date: Mon, 19 Jun 2023 10:12:39 -0500
Message-ID: <20230619151241.17763-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Jun 2023 15:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14654

The version of pybind11 in kirkstone seems to have an issue when
configuring the kms++ package.  Backporting the 2.10.3 verison from
master fixes that issue.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../python/python3-pybind11_2.10.3.bb         | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python3-pybind11_2.10.3.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.10.3.bb b/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.10.3.bb
new file mode 100644
index 00000000..bb604982
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.10.3.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Seamless operability between C++11 and Python"
+HOMEPAGE = "https://github.com/wjakob/pybind11"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=774f65abd8a7fe3124be2cdf766cd06f"
+
+DEPENDS = "boost"
+
+SRC_URI = "git://github.com/pybind/pybind11.git;branch=stable;protocol=https"
+
+SRCREV = "0bd8896a4010f2d91b2340570c24fa08606ec406"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
+
+inherit cmake setuptools3 python3native
+
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+PIP_INSTALL_PACKAGE = "pybind11"
+
+do_configure() {
+   cmake_do_configure
+}
+
+do_compile() {
+   setuptools3_do_compile
+   cmake_do_compile
+}
+
+do_install() {
+   setuptools3_do_install
+   cmake_do_install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


