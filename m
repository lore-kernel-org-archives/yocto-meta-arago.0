Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 95C9352997
	for <meta-arago@arago-project.org>;
	Mon,  3 Jun 2019 21:36:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x53La0FM127723
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559597760;
	bh=oNChFyBvsXzq4vPGqPZIcVz2k7cG92lZISRNWbCREpU=;
	h=From:To:CC:Subject:Date;
	b=sUBdv6GPWikxTxFeBe1rhs4LI9h4Pg1iXF05/induhZIuPR5cUfBn+Rcr4k04Ni/d
	gu7BU70YFpn66W2xuD5AUZrltu+YvmYFXWGk4KccYpokuL2CDx+DD9IFU/AUZS0lFU
	wtjgn4cDbyiWjLfKN/G8nmQqrM3IkTWo2V5xzzsk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x53La0l9099775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Jun 2019 16:36:00 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 3 Jun 2019 16:36:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 3 Jun 2019 16:36:00 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x53La0V5022105;
	Mon, 3 Jun 2019 16:36:00 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Jun 2019 17:34:41 -0400
Message-ID: <20190603213445.13887-1-h-gou@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH 0/4] Add PdM anomaly detection demo to Matrix GUI
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
X-List-Received-Date: Mon, 03 Jun 2019 21:36:39 -0000
Content-Type: text/plain

Add analytics submenu and place the PdM anomaly detection demo under it

Hongmei Gou (4):
  matrix-gui-apps-git.inc: bump SRCREV to add analytics submenu and
    analytics-pdm-anomaly-detection demo
  matrix-gui-submenus: add analytics submenu
  matrix-gui-analytics-demos: add predictive maintenance demo for
    anomaly detection
  packagegroup-arago-tisdk-matrix: add
    matrix-analytics-pdm-anomaly-detection demo

 .../packagegroup-arago-tisdk-matrix.bb        |  6 ++++-
 .../matrix/matrix-gui-analytics-demos_2.0.bb  | 27 +++++++++++++++++++
 .../matrix/matrix-gui-apps-git.inc            |  4 +--
 .../matrix/matrix-gui-submenus_2.0.bb         |  5 +++-
 4 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-analytics-demos_2.0.bb

-- 
2.17.1


