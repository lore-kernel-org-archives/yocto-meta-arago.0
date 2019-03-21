Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 872C552976
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:28:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDRmCY073615
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174868;
	bh=LD1QiK6M2OFnzxU+qLmewsUp+Tqrwy6KYn9mg3q+xQU=;
	h=From:To:Subject:Date;
	b=JqI4WQg4RkZTpDpZBqpWKDIRCo5U86GzTZm+XFFHW/SupgtqqrEe/FoEg2YGV6FaO
	R/KO82zEBT+/Ismd58yBoVpTUl7hDhuPV+3XFLLbcDOtEKorObe21VyUnWT62EFdX4
	k11pekz8Y406gF/is6hWY4Bw2/ENp6EevrvlZSLQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDRmVs076739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:48 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:27:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:27:48 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDRl3M009221
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:27:48 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 09:27:38 -0400
Message-ID: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 0/7] RTOS patches for 5.3 release
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
X-List-Received-Date: Thu, 21 Mar 2019 13:28:02 -0000
Content-Type: text/plain

Please apply these patches after the meta-ti patches for RTOS are upstreamed.
These patches removes the now-redundant updates made towards the end of the previous RTOS release

Mahesh Radhakrishnan (7):
  board-rtos: Superseded by meta-ti update
  common-csl-ip:Superseded by a higher version
  emac-lld-rtos:Superseeded by a more recent version
  mmcsd-lld-rtos:Superseeded by a more recent version
  osal:Superseeded by a more recent version
  spi-lld-rtos:Superseeded by a more recent version
  udma-lld-rtos:Superseeded by a more recent version

 recipes-bsp/board-rtos/board-rtos_git.bbappend            | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc  | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 -
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 -
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend           | 5 -----
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend         | 5 -----
 recipes-bsp/osal/osal-01_00_00_13A.inc                    | 6 ------
 recipes-bsp/osal/osal-rtos_git.bbappend                   | 1 -
 recipes-bsp/osal/osal-test_git.bbappend                   | 1 -
 recipes-bsp/osal/osal_git.bbappend                        | 1 -
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend             | 6 ------
 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend           | 5 -----
 12 files changed, 42 deletions(-)
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_13A.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
 delete mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal-01_00_00_13A.inc
 delete mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal_git.bbappend
 delete mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/udma-lld/udma-lld-rtos_git.bbappend

-- 
1.9.1


