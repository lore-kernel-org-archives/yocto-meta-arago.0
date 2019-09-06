Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id ACD91520DE
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 09:04:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86938iD091192
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 04:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567760588;
	bh=UN1pul2cnOHOFrtqsNRFQMDAZJ7X/1sXjpOwIdiolwE=;
	h=From:To:CC:Subject:Date;
	b=l4jRuYGofSAUIao7Vy39X/utZBWnAnC2yV/T3fbkv1Ms7/GvrzhhtA2/U/hez2lay
	c4RYLLt/8K1Ngs+MWo6FmPBj+tXsxQHz6Qw0ca4jrJz5Q1WOesIAmHiReZtdIeMZ9i
	SR3gmhsuc7TVVridQ+3+2SxDXpzCoRxwKIkW1NtM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86938vO008789
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 04:03:08 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 04:03:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 04:03:08 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86935Vn095402; 
	Fri, 6 Sep 2019 04:03:06 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Fri, 6 Sep 2019 14:33:04 +0530
Message-ID: <1567760584-24235-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ [thud/master] PATCH v1] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Fri, 06 Sep 2019 09:04:13 -0000
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 meta-arago-extras/recipes-devtools/ion/libion_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ion/libion_git.bb

diff --git a/meta-arago-extras/recipes-devtools/ion/libion_git.bb b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
new file mode 100644
index 0000000..7c93ed3
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "ION Userspace Memory Allocator Library"
+HOMEPAGE = "https://github.com/glneo/libion"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+PV = "1.0.0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
+SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
-- 
1.9.1


