Return-Path: <afd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3AA41529C3
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 23:02:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025N0W8q002767
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 17:00:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583449232;
	bh=jv6WSqfGApA3qDucKYUKQX21fv6lPDcRYJ/StLboQrI=;
	h=From:To:CC:Subject:Date;
	b=W+kdRHrIx6jahTqwK+V0IFv7A6nb62ZD3X8BFhxFPYPCewdZGCMjem1QwH6twD9Qs
	tcyqQ+OnT8yLUbeUqxy9xdBc9Lafi3eNQnbKQ89Nbq9r8+bgkSlVYoUnGn1W8FYque
	vn+eDmEmjF8bu9ee4c0GTcR1C9vcmYHjOj8FHCBo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025N0W5l053214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 17:00:32 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 17:00:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 17:00:32 -0600
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025N0VNp058094;
	Thu, 5 Mar 2020 17:00:31 -0600
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Thu, 5 Mar 2020 18:00:31 -0500
Message-ID: <20200305230031.5482-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [zeus/master][PATCH] dma-heap-tests: add tests for DMA-Heap framework
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
X-List-Received-Date: Thu, 05 Mar 2020 23:02:36 -0000
Content-Type: text/plain

Add some tests for the DMA-Heap framework. Based on ion-tests.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../recipes-devtools/dma-heap/dma-heap-tests.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb

diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
new file mode 100644
index 00000000..9693fe64
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Test cases for DMA-Heap framework"
+HOMEPAGE = "https://github.com/glneo/dma-heap-tests"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=d16465a9e7dc8f53bfdf997c4bf55540"
+
+PV = "1.0"
+
+BRANCH = "master"
+SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=git;branch=${BRANCH}"
+SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
+
+DEPENDS = "googletest"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
-- 
2.17.1


