Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 07151529AE
	for <meta-arago@arago-project.org>;
	Fri, 31 Aug 2018 18:50:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7VIoewK104102
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535741440;
	bh=J1twSBtSUKqCjKl3sBj2F7SlwD2Ia/zg3t1XTXXkSJc=;
	h=From:To:Subject:Date;
	b=nSw7HNqxqvrrElAjYw87cAkGYxc+5cJHOs6L/5jrf6Xewmd4IhC29FQ31Mw+E8uJ/
	pvvscPUvRTTczPafd194ldr1RiEsD53cELRNjvMD5S4j9ytS9WxaoM8ebEdpODTXmv
	x9M7ur7nlkvP5E2I7bssMfu3c7uaWv8oSvTtQvj8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIoevd005616
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:40 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 31 Aug 2018 13:50:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 31 Aug 2018 13:50:39 -0500
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VIodna009985
	for <meta-arago@arago-project.org>; Fri, 31 Aug 2018 13:50:39 -0500
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Aug 2018 14:50:30 -0400
Message-ID: <1535741433-30388-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 0/3] armnn-caffe: reduced recipe size
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
X-List-Received-Date: Fri, 31 Aug 2018 18:50:48 -0000
Content-Type: text/plain

Removed local files and fetch them from GIT.

Qin Su (3):
  armnn-caffe: caffe protobuf files used in building caffe models in
    armnn.
  armnn-tensorflow: tensorflow protobuf files used in building
    tensorflow models in armnn.
  armnn: ARM NN machine learning SDK.

 .../recipes-support/armnn-caffe/armnn-caffe.bb     | 18 ++++++
 .../armnn-tensorflow/armnn-tensorflow.bb           | 29 +++++++++
 .../generate_tensorflow_protobuf.sh                | 73 ++++++++++++++++++++++
 meta-arago-extras/recipes-support/armnn/armnn.bb   | 47 ++++++++++++++
 .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++
 5 files changed, 222 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow/generate_tensorflow_protobuf.sh
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn.bb
 create mode 100644 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch

-- 
1.9.1


