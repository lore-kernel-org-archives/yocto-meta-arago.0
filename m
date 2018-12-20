Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8095952968
	for <meta-arago@arago-project.org>;
	Thu, 20 Dec 2018 20:58:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBKKvmJR006487
	for <meta-arago@arago-project.org>; Thu, 20 Dec 2018 14:57:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545339468;
	bh=jubsSXVV7UhBE/ps50yyS00FI/aYZy7IzN9RKT49ym4=;
	h=From:To:Subject:Date;
	b=gyJlPP0xBW7roOPRqfghW9remItNbRjz+7JeI4j6w/25F/zX7ffb+fP0M4rCxdGSv
	sw+73Mx6ULaxuYM2TJ73fTeyX6C6q+lfUZAxr8Eo8VPywlm5+RLBCTWYTm/wRn1sH5
	9EydEkWr6LvwSnIRjzwahuMB+e5rGIa4W2At+5E8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBKKvmWL102304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Dec 2018 14:57:48 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 20 Dec 2018 14:57:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 20 Dec 2018 14:57:48 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBKKvk6k010288
	for <meta-arago@arago-project.org>; Thu, 20 Dec 2018 14:57:47 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Dec 2018 15:57:43 -0500
Message-ID: <1545339464-27102-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] RTOS patch update to EMAC
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
X-List-Received-Date: Thu, 20 Dec 2018 20:58:01 -0000
Content-Type: text/plain

RTOS patch update to address the firmware packet corruption issue (CRC)

Mahesh Radhakrishnan (1):
  emac-lld-rtos: SRCREV update to 01.00.03.13D

 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1


