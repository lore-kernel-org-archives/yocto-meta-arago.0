Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 52D29520E2
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2019 20:32:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7MKVWpk073662
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566505892;
	bh=4rrSx10X5TZHa+bELT4uL6ey2Jn3yMbnwHO3+sgL7dk=;
	h=From:To:CC:Subject:Date;
	b=JRh3OviKW3nNCEbugjN+xHQzslwcD0hTx8Tj6/PaU+16w8LO7v4Cbgnp0fyszxpgt
	9bibnekiLJ1vRptxpNpGEHQpjvv+K8rpbyfwDv+auUCxWfjuPcm6ZjrMZ1+kS/Rv/T
	amU9fxQUcZ08RBVovjyaXzsmZFszABkW74xYfjj4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7MKVWI8101537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2019 15:31:32 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 22 Aug 2019 15:31:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 22 Aug 2019 15:31:31 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7MKVVqE015899;
	Thu, 22 Aug 2019 15:31:31 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2019 16:31:23 -0400
Message-ID: <20190822203126.4155-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH v2 0/3] Add tensorflow-lite
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
X-List-Received-Date: Thu, 22 Aug 2019 20:32:34 -0000
Content-Type: text/plain

This patch set starts from the baseline recipe at
https://github.com/nnsuite/meta-neural-network/tree/master/recipes-tensorflow/tensorflow-lite,

The major changes are listed below:

1. Made some cleanup for the baseline recipes, such as updating NEON2SSE and replacing AUTOREV

2. Installed minimal and benchmark_model binaries which have been built with the original Makefile

3. Patched Makefile to add label_image and installed the example binary and files
   (model/image/labels.txt) needed to run the example

v2 change:
Keep the dependencies in the original single recipe, instead of creating separate recipes
for all the dependencies

Hongmei Gou (3):
  tensorflow-lite: add version 1.12
  tensorflow-lite: install minimal and benchmark_model examples, and all
    .a files
  tensorflow-lite: add label_image example and install the files to run
    the example

 ...001-Makefile-add-label_image-example.patch |  89 ++++++++++++
 ...odification-for-tflite-1.12-to-eigen.patch |  13 ++
 .../files/tensorflow-lite.pc.in               |   6 +
 .../tensorflow-lite/tensorflow-lite_1.12.bb   | 136 ++++++++++++++++++
 4 files changed, 244 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-add-label_image-example.patch
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb

-- 
2.17.1


