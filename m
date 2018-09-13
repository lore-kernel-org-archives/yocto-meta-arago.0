Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A16A152993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 18:11:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DIBSU0001105
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536862288;
	bh=QsZqTkOx10bPG4CgxcvMUKNnIcyKW5ywUr1wQhhdc8Y=;
	h=From:To:CC:Subject:Date;
	b=IZiiyFo4wlHqTCTge0VM4XANuPMrKrVDtMB3UAp4YZspX6XNCSmsNkIqCRvz3cugY
	0N6i/dhXaso1dZzq/a1gCfrU5IBBqoPy0tQTNx6AuBpDfDtiMvMSn5sAtbVtTo3Ai9
	yhRQGZwXQHAmslRX+FfNd+8ox8TWUhKx/Cmj7cR0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIBSNb030541
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 13:11:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 13:11:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 13:11:28 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DIBR6f025581;
	Thu, 13 Sep 2018 13:11:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 13:56:22 -0400
Message-ID: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v6 0/5] Add ARMNN
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
X-List-Received-Date: Thu, 13 Sep 2018 18:11:37 -0000
Content-Type: text/plain

Add ARMNN and required dependencies.

Qin Su (5):
  stb: C/C++ libraries used to build armnn test examples.
  arm-compute-library: Machine Learning library for ARM.
  armnn-caffe: caffe protobuf files used in building caffe models in
    armnn.
  armnn-tensorflow: tensorflow protobuf files for building tensorflow
    models in armnn
  armnn: ARM NN machine learning SDK.

 .../arm-compute-library/arm-compute-library_git.bb | 44 +++++++++++++++++
 .../recipes-support/armnn-caffe/armnn-caffe_git.bb | 22 +++++++++
 .../armnn-tensorflow/armnn-tensorflow_git.bb       | 25 ++++++++++
 .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++++++++
 .../0002-enable-use-of-boost-shared-library.patch  | 33 +++++++++++++
 .../recipes-support/armnn/armnn_git.bb             | 45 ++++++++++++++++++
 meta-arago-extras/recipes-support/stb/stb_git.bb   | 22 +++++++++
 7 files changed, 246 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
 create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn_git.bb
 create mode 100644 meta-arago-extras/recipes-support/stb/stb_git.bb

-- 
2.7.4


