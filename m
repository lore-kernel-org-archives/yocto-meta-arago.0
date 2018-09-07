Return-Path: <qsu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4FA5952985
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2018 19:38:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w87JcIw2078275
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536349098;
	bh=L5U5J5FhOqxnh55jvZF/Ma4FpkiRlf6YHlWjPXCC+L0=;
	h=From:To:Subject:Date;
	b=pAhxiZz9233Y5XH2HA6jDjbh2hM1IPN8wfRQSwXVxsKGNdqyQQ1cJC5TIc2oB+Akm
	9XxDeyZPLcoKh9gpPWWAm7zXFpXKgCCnPFt+d7XG9XbgJZ9x6wrp/+QTkmjrDb/zta
	LgNEC9s20/6MGbPNEU1USeBTiPhLNiOUoz4v05w8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JcIQL002648
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:38:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 7 Sep 2018 14:38:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 7 Sep 2018 14:38:18 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w87JcIlN024961
	for <meta-arago@arago-project.org>; Fri, 7 Sep 2018 14:38:18 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Sep 2018 15:38:06 -0400
Message-ID: <1536349089-1659-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v5 0/3] add ARM NN machine learning SDK
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
X-List-Received-Date: Fri, 07 Sep 2018 19:38:28 -0000
Content-Type: text/plain

V5 changes:
Fixed comments in armnn-caffe and armnn-tensorflow.

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


