Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 91B945299A
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 23:50:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo5x0074187
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560210605;
	bh=I7Dt8R7P7Kb0WFzya6Jq7fTRiXs9cW85ojEaHXYnYOY=;
	h=From:To:CC:Subject:Date;
	b=r0DWe5gkAl72JojQkTd7hkFE8f1zGm+qluBE8VzGTVhD6te1wh/iMKQbWMFJWOejw
	dxcJbQOI6oov+EjjleMDrNS7awOv8DqLdgajTqhIhK7LKEly6mWwGSAl2QBCYybDH4
	P3UlCU01l/eg39r6NQ9bDMxsU0ofyIn6uWGiL0+4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANo5eb009574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Jun 2019 18:50:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:50:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:50:05 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANo4wj077708;
	Mon, 10 Jun 2019 18:50:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Jun 2019 23:37:46 +0000
Message-ID: <20190610233750.31009-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 0/4] Initial support for J7 (J721e SoC) platform
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
X-List-Received-Date: Mon, 10 Jun 2019 23:50:46 -0000
Content-Type: text/plain

Add support for J7 (J721e SoC) to Arago distro and TISDK builds. Requires
corresponding changes in meta-ti BSP layer.

Denys Dmytriyenko (4):
  packagegroups,tisdk-makefile: de-scope some K3 features to AM65 for
    now
  ti-sci-fw: upgrade to 2019.05 and add support for J7 platform
  u-boot-k3-r5: add support for J7 platform
  arago-core-tisdk,matrix: add support for J7 building headless target
    for now

 ...ci-fw_2019.04a.bb => ti-sci-fw_2019.05.bb} | 48 +++++++++++++------
 .../u-boot/u-boot-k3-r5_2019.01.bb            |  1 +
 .../images/arago-core-tisdk-image.inc         |  5 ++
 .../packagegroups/packagegroup-arago-test.bb  |  2 +-
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  4 +-
 ...kagegroup-arago-tisdk-addons-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-addons.bb        |  7 ++-
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  2 +-
 .../packagegroup-arago-tisdk-hmi.bb           |  2 +-
 ...ackagegroup-arago-tisdk-matrix-sdk-host.bb |  1 +
 .../packagegroup-arago-tisdk-matrix.bb        |  5 +-
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb |  2 +-
 ...group-arago-tisdk-multimedia-sdk-target.bb |  2 +-
 ...ckagegroup-arago-toolchain-tisdk-target.bb |  2 +
 .../ti-tisdk-makefile_1.0.bb                  |  8 +++-
 .../recipes-core/matrix/matrix-gui_2.0.bb     |  1 +
 16 files changed, 65 insertions(+), 29 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.04a.bb => ti-sci-fw_2019.05.bb} (61%)

-- 
2.17.1


