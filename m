Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 27294520DF
	for <meta-arago@arago-project.org>;
	Wed, 21 Aug 2019 22:59:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwK83012161
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566428300;
	bh=YTvn6OW2tnIYI/F7BX1h3Ir6RekF2mHsgbOBj5++ss4=;
	h=From:To:CC:Subject:Date;
	b=VmxJm7VFDNOal1pzz/Xbdv6prq9Fb/Z6M6Kh5yvHEHywbHQDi5WfkY55HRrVutsXh
	vpDhW/bPcup6wDDACnYnhLq3iOBlR2S/eD76wBHk84q4dih8ZzWf2YihLr3STFuGBm
	SaZahb4KKqq9HDouKZ99fTt2T64xkW1tKQW+XcOU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7LMwKZu080605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Aug 2019 17:58:20 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 21 Aug 2019 17:58:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 21 Aug 2019 17:58:19 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7LMwJCb074536;
	Wed, 21 Aug 2019 17:58:19 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Aug 2019 18:58:00 -0400
Message-ID: <20190821225807.22947-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 0/7] Add tensorflow-lite
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
X-List-Received-Date: Wed, 21 Aug 2019 22:59:21 -0000
Content-Type: text/plain

This patch set starts from the baseline recipe at
https://github.com/nnsuite/meta-neural-network/tree/master/recipes-tensorflow/tensorflow-lite,

The major changes are listed below:
1. Ported/created recipes for all the dependencies required for tensorflow-lite 1.12
2. Installed minimal and benchmark_model binaries which have been built with the original Makefile
3. Patched Makefile to add label_image and installed the example binary and files
   (model/image/labels.txt) needed to run the example

Hongmei Gou (7):
  tensorflow-lite: add version 1.12
  flatbuffers: add version 1.10.0 needed by tensorflow-lite
  tensorflow-lite-libeigen: add the version for commit fd6845384b86
  tensorflow-lite-*: add other dependencies for tensorflow-lite 1.12
  tensorflow-lite: define dependencies via DEPENDS
  tensorflow-lite: install minimal and benchmark_model examples, and all
    .a files
  tensorflow-lite: add label_image example and install the files to run
    the example

 .../flatbuffers/flatbuffers_1.10.0.bb         | 34 +++++++
 ...the-path-for-the-depedencies-built-v.patch | 50 ++++++++++
 ...002-Makefile-add-label_image-example.patch | 89 ++++++++++++++++++
 ...odification-for-tflite-1.12-to-eigen.patch | 13 +++
 .../files/tensorflow-lite.pc.in               |  6 ++
 .../tensorflow-lite-absl_git.bb               | 16 ++++
 .../tensorflow-lite-farmhash_git.bb           | 14 +++
 .../tensorflow-lite-fft2d_1.0.bb              | 14 +++
 .../tensorflow-lite-gemmlowp_git.bb           | 16 ++++
 .../tensorflow-lite-libeigen_git.bb           | 20 ++++
 .../tensorflow-lite-neon-2-sse_git.bb         | 14 +++
 .../tensorflow-lite/tensorflow-lite_1.12.bb   | 93 +++++++++++++++++++
 12 files changed, 379 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0001-Makefile-update-the-path-for-the-depedencies-built-v.patch
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/0002-Makefile-add-label_image-example.patch
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/apply-modification-for-tflite-1.12-to-eigen.patch
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/files/tensorflow-lite.pc.in
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-absl_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-farmhash_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-fft2d_1.0.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-gemmlowp_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-libeigen_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite-neon-2-sse_git.bb
 create mode 100644 meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.12.bb

-- 
2.17.1


