Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3244D52ABF
	for <meta-arago@arago-project.org>;
	Tue, 18 Dec 2018 22:21:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIML3Nh035078
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545171663;
	bh=BFEuCdRrooAz8d/br60iQxAvXbsio2Fa8Mw53kmMpnc=;
	h=From:To:Subject:Date;
	b=s3ZZe4pOKpMs41g6kOl5y38cpyf5ytRBAaAFGJ7t8/Dag8aS6TrKCanJk9boffQmx
	cStW1owxMEh8dOyvhA8qs1imP6UztVASSmOtzMRUWR6oXu8xxHewPWnuQTBpyzfguZ
	FiB2rd8YL3CDMaQC2oHP/g/SPOb/iMMM6nBYJLk0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIML2ne070373
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:03 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:21:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:21:01 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIML1R8018057
	for <meta-arago@arago-project.org>; Tue, 18 Dec 2018 16:21:01 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Dec 2018 17:20:52 -0500
Message-ID: <1545171658-17410-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 0/6] RTOS 5.2 Patchset 2
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
X-List-Received-Date: Tue, 18 Dec 2018 22:21:16 -0000
Content-Type: text/plain

This is the patchset-2 for RTOS 5.2 release

Mahesh Radhakrishnan (6):
  board-rtos: SRCREV update to 01.00.10.03A
  common-csl-ip: SRCREV update to 03.03.00.13A
  osal: SRCREV update to 01.00.00.13A
  emac-lld-rtos: SRCREV update to 01.00.03.13C
  spi-lld-rtos: SRCREV update to 01.00.00.13A
  udma-lld-rtos: SRCREV update to 01.00.00.01A

 recipes-bsp/board-rtos/board-rtos_git.bbappend            | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc  | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 +
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 +
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend           | 5 +++++
 recipes-bsp/osal/osal-01_00_00_13A.inc                    | 6 ++++++
 recipes-bsp/osal/osal-rtos_git.bbappend                   | 1 +
 recipes-bsp/osal/osal-test_git.bbappend                   | 1 +
 recipes-bsp/osal/osal_git.bbappend                        | 1 +
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend             | 6 ++++++
 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend           | 5 +++++
 11 files changed, 37 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-01_00_00_13A.inc
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 create mode 100644 recipes-bsp/osal/osal_git.bbappend
 create mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend

-- 
1.9.1


