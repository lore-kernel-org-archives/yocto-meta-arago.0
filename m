Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0FA125299E
	for <meta-arago@arago-project.org>;
	Wed, 19 Dec 2018 20:40:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBJKeaBO028077
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545252036;
	bh=HrrJvLr2mgrFK3VQ3x5l1dg8p/SA0NOfSxNDSYg9ufQ=;
	h=From:To:Subject:Date;
	b=XQcTaCr70SYH2Zp3x5iY47bunBCnqQDfY4Q0rB0XOY36H0C0KEGJQ1qdYqf8gZ6q2
	rHQ2iUgIBq1tW9m/VbEfBxBMV4dC6U6OQi9GO0R5jVViHE2sNpTLJm3lHTEXIUeaRy
	BImUlgyzIvH9Ynw61ygFoBjOmWTd2y5N+U6j9vDY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBJKeaiQ026762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 19 Dec 2018 14:40:35 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 19 Dec 2018 14:40:36 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBJKeZmT020008
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:35 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Dec 2018 15:40:29 -0500
Message-ID: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 0/3] RTOS Patchset-3
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
X-List-Received-Date: Wed, 19 Dec 2018 20:40:48 -0000
Content-Type: text/plain

This is the RTOS patchset which addresses the release blocker issues.

Mahesh Radhakrishnan (3):
  board-rtos: Correcting the commit id corresponding to 01.00.10.03A
  spi-lld-rtos: SRCREV update to 01.00.00.13B
  mmcsd-lld-rtos: SRCREV update to 01.00.00.14B

 recipes-bsp/board-rtos/board-rtos_git.bbappend                      | 4 ++--
 .../mmcsd-lld-rtos_git.bbappend}                                    | 6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend                       | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)
 copy recipes-bsp/{board-rtos/board-rtos_git.bbappend => mmcsd-lld/mmcsd-lld-rtos_git.bbappend} (7%)

-- 
1.9.1


