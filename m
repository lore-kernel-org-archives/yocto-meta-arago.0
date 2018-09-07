Return-Path: <qsu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4DC4652A1F
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 19:24:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87JO2iY102874
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536348242;
	bh=iUPz5CvImIpBVmGPvYrsM44AFmw5P0sQpSk6gPYlgiQ=;
	h=From:To:Subject:Date;
	b=yYs/gsptfj/+Fed3QDlTiQZTbav5iOagtQX/N1GnoR5F7hKZeggPBKTwNru1PsKCQ
	XULX8HfyCdvAIdizfsFR/E3NBWbkZcpyz7NXUM3fe48SPDaQfH/hweqW2igfORzH5b
	ERBzhWfPOb2hT9J2entbWk6nlio2rmE6vS4rTAQ0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JO2Dw020189
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:24:02 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 14:24:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 14:24:02 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JO1SL013805
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:24:02 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Sep 2018 15:23:46 -0400
Message-ID: <1536348229-1012-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4 0/3] changes to use up-streamed protobuf
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
X-List-Received-Date: Fri, 07 Sep 2018 19:24:15 -0000
Content-Type: text/plain

Changes are made in armnn, armnn-caffe and armnn-tensorflow to use the same version of up-streamed protobuf.

Qin Su (3):
  armnn-caffe: caffe protobuf files used in building caffe models in
    armnn.
  armnn-tensorflow: tensorflow protobuf files used in building
    tensorflow models in armnn.
  armnn: ARM NN machine learning SDK.

 .../recipes-support/armnn-caffe/armnn-caffe.bb     | 18 ++++++
 .../armnn-tensorflow/armnn-tensorflow.bb           | 22 +++++++
 .../generate_tensorflow_protobuf.sh                | 73 ++++++++++++++++++++++
 meta-arago-extras/recipes-support/armnn/armnn.bb   | 47 ++++++++++++++
 .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++
 5 files changed, 215 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch

-- 
1.9.1


