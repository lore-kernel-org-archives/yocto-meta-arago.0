Return-Path: <qsu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id E3E11529AE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 14:00:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SE0Ssm047397
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 09:00:28 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SE0R83025815
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 09:00:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 09:00:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 09:00:27 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SE0R4a023645
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 09:00:27 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 10:00:10 -0400
Message-ID: <1535464813-10876-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 0/3] add ARM NN machine learning SDK
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
X-List-Received-Date: Tue, 28 Aug 2018 14:00:36 -0000
Content-Type: text/plain

V2 Changes:
In armnn-tensorflow recipe, download needed file instead of local copy.

Qin Su (3):
  armnn-caffe: caffe protobuf files used in building caffe models in
    armnn.
  armnn-tensorflow: tensorflow protobuf files used in building
    tensorflow models in armnn.
  armnn: ARM NN machine learning SDK.

 .../recipes-support/armnn-caffe/armnn-caffe.bb     |    15 +
 .../armnn-caffe/armnn-caffe/LICENSE                |    44 +
 .../armnn-caffe/armnn-caffe/caffe.pb.cc            | 76404 +++++++++++++++++++
 .../armnn-caffe/armnn-caffe/caffe.pb.h             | 42737 +++++++++++
 .../armnn-tensorflow/armnn-tensorflow.bb           |    29 +
 .../generate_tensorflow_protobuf.sh                |    73 +
 meta-arago-extras/recipes-support/armnn/armnn.bb   |    47 +
 .../armnn/0001-stdlib-issue-work-around.patch      |    55 +
 8 files changed, 119404 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe/LICENSE
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe/caffe.pb.cc
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe/caffe.pb.h
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch

-- 
1.9.1


