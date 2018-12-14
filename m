Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A8871529D0
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 19:35:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJZP6I037032
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 13:35:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544816125;
	bh=h8YZA5jEk/6nIRYnwzvvx4BGK6ntNbZXN0Uh7MKf1Kk=;
	h=From:To:Subject:Date;
	b=K411t4ecFawBr+wsS0vhUJjpyq7vf9v0hs/5Il4cAYEpUv2vMf51xA3xuDsGINdUT
	n6qT0BBGzl4PaaYzXFWQCcTQzFUGpn4A6iJnqWCTcPsSDuey332t5yEqz5PCihq1sI
	nBtkTDf5Q9Scbp2a/C6bcsDZKFoqe6VJly4400zo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJZPD6091006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 13:35:25 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:35:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:35:24 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJZONt014701
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 13:35:24 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 14:35:21 -0500
Message-ID: <1544816122-11310-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] RTOS patches for procsdk 5.2 release
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
X-List-Received-Date: Fri, 14 Dec 2018 19:35:37 -0000
Content-Type: text/plain

Below is the CSL patch (removal of old verison 03.03.00.012A as it is superseeded by 03.03.00.13)
Please merge this only AFTER the meta-ti patch for CSL 03.03.00.13 is submitted

Mahesh Radhakrishnan (1):
  common-csl-ip: Superseeded after update to 03.03.00.13

 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc  | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 -
 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend      | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend

-- 
1.9.1


