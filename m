Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 658CF52092
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 15:21:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VFLK7Q037322
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559316080;
	bh=dT6PoMVnmXg/rHK9Uss+YpxuR2Lx3u4iCYCy81XdAKY=;
	h=From:To:Subject:Date;
	b=kcP1AOfxGsmP3O1VhMyaOa45h1HMfb3f1Iat6MLPBL+pdAtX94uw7EsgjXC39GyIM
	++CS+vHUbcA5VnIL2/dj917TBz10wNHPo6EsJZnU7vclxm7pwhENLTJfjMTwbcwfyB
	k2bnLmTrVUMSMVRmHGRlyTdPHNsroyniJrLe9eP4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VFLKjC120386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 10:21:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 10:21:20 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VFLJUp034955
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 10:21:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 11:20:56 -0400
Message-ID: <20190531152100.19757-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/4] add MACHINE FEATURES condition sgx for additional modules and demos
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
X-List-Received-Date: Fri, 31 May 2019 15:21:57 -0000
Content-Type: text/plain

There are more modules and demos should not be included for non-sgx build
and therefore MACHINE FATURES condition (sgx) is added.

Eric Ruei (4):
  packagegroup-arago-tisdk-addons:add MACHINE FEATURES condition sgx for
    certain modules
  packagegroup-arago-tisdk-graphics: add MACHINE FEATURES condition sgx
    for certain modules
  packagegroup-arago-tisdk-matrix: add MACHINE FEATURES condition sgx
    for certain demos
  matrix-gui-machinevision-demos: add MACHINE FEATURES condition sgx for
    certain demos

 .../packagegroups/packagegroup-arago-tisdk-addons.bb |  4 ++--
 .../packagegroup-arago-tisdk-graphics.bb             | 12 ++++++------
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb |  6 +++---
 .../matrix/matrix-gui-machinevision-demos_2.0.bb     |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.17.1


