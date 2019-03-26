Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 80128529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT1T9079685
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639341;
	bh=cWJ/l+GffwH3rt3kTgir0EWxVQDnn83FSzlgEmyNasE=;
	h=From:To:Subject:Date;
	b=I4lRYRV5BQo7zBQOiVB2Lz6g07kP+KrMpStTacn34Sk5Wz3g1wd5BIeMj8j1kWWMf
	Gan0X37SnifQgMkjEXq0INfME1uM8fWMOvIpWtkZ5PPeRpJzVy6SxL5KOEuT4YTfpr
	UjOrJDt6GNMSKFW3VGpKlQ+Ovz4uWunazW5wTVnw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT0dm117974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:00 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:00 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tE116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:00 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:50 -0400
Message-ID: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 0/7] Patchset-2 for RTOS 5.3
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
X-List-Received-Date: Tue, 26 Mar 2019 22:29:17 -0000
Content-Type: text/plain

RTOS Patchset-2 for 5.3

Mahesh Radhakrishnan (7):
  common-csl-ip: SRCREV bump to 03.03.00.14C
  emac-lld-rtos: SRCREV bump to 01.00.03.14B
  mmcsd-lld-rtos: SRCREV bump to 01.00.00.15A
  transport-rtos: SRCREV bump to version 01.00.00.15A
  ti-pdk-build-rtos: SRCREV bump to version 01.00.00.12A
  icss-emac-lld: SRCREV bump to 01.00.00.15
  sciclient-rtos: SRCREV bump to 01.00.00.02B

 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc  | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 2 ++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 +
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend           | 5 +++++
 recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc  | 5 +++++
 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend | 2 ++
 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend  | 1 +
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend      | 1 +
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend         | 5 +++++
 recipes-bsp/sciclient/sciclient-rtos_git.bbappend         | 6 ++++++
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend     | 1 +
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend    | 1 +
 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend         | 1 +
 recipes-bsp/transport-rtos/transport-01_00_00_15A.inc     | 5 +++++
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend    | 5 +++++
 15 files changed, 46 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bbappend
 create mode 100644 recipes-bsp/transport-rtos/transport-01_00_00_15A.inc
 create mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend

-- 
1.9.1


