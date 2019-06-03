Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9CD5152997
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 19:26:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ1vm092585
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559589961;
	bh=g7VwZNxt/0e2vCjKBjp2D+lFl0l8rU8YQ2OdaMlkKtY=;
	h=From:To:CC:Subject:Date;
	b=yPX9qvE6l3wh3OZBLgQlbKgayNnCWq4OrQCEO7QFskn+p7rA+8bbKjDhURC1ZlCl2
	1NxGWYiq+bF28ZlYjRDeZEog6SqQmSz8MOJjvl4wNIwoB79SxY2aR5ODsOLLDawU6X
	k7CB6r1JvYkR36uWDvDVOpRnBL+XZv883DHaUL20=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53JQ1pk103426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 14:26:01 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 14:26:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 14:26:01 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53JQ0c5100439;
	Mon, 3 Jun 2019 14:26:00 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 15:24:18 -0400
Message-ID: <20190603192424.23922-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 0/6] Add PdM anomaly detection demo
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
X-List-Received-Date: Mon, 03 Jun 2019 19:26:42 -0000
Content-Type: text/plain

Add PdM (Predictive Maintenance) demo for anomaly detection, including
building the demo from the top-level Makefile

Hongmei Gou (6):
  packagegroup-arago-tisdk-qte: add qtcharts-examples
  packagegroup-arago-qte-toolchain-target: add qtcharts-mkspecs and
    qtcharts-dev
  pdm-anomaly-detection: predictive maintenance demo for anomaly
    detection
  packagegroup-arago-tisdk-addons*: add pdm-anomaly-detection
  arago-source-ipk: include source for pdm-anomaly-detection
  ti-tisdk-makefile: add pdm-anomaly-detection

 .../conf/distro/include/arago-source-ipk.inc  |  3 +++
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 21 ++++++++++++++-
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  6 ++++-
 .../packagegroup-arago-tisdk-addons.bb        |  6 ++++-
 .../packagegroup-arago-tisdk-qte.bb           |  3 ++-
 .../Makefile_pdm-anomaly-detection            | 24 +++++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  7 ++++-
 .../pdm-anomaly-detection_git.bb              | 26 +++++++++++++++++++
 ...packagegroup-arago-qte-toolchain-target.bb |  4 ++-
 9 files changed, 94 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
 create mode 100644 meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb

-- 
2.17.1


