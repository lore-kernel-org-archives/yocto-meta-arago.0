Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F1155529D3
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:30:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMURXW110323
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639427;
	bh=VZ3JPGkzRidqHQTVAOYBRwLJKeIOdh1IE9zHlEuGcps=;
	h=From:To:Subject:Date;
	b=HCZzLdkA+ynYXgY++4+V8r8yzcYF6zMoxpFsHEhfzWwqFw/9YC7j7Bc5mHUGIpd/0
	3jjCBLK1WytFVRj9Z3zTPKbsroNwWvcVQqXBxjuZHaIB+RHs6MqLpCYnndl2WCh6SM
	9SmqhAnUV+Cmozr6DxWbNxEPGywro6aXIT7bp5lE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMURGv120526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:30:27 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:30:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:30:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMUQBa009318
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:30:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:30:21 -0400
Message-ID: <1553639422-36425-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] RTOS Patchset -3
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
X-List-Received-Date: Tue, 26 Mar 2019 22:30:42 -0000
Content-Type: text/plain

RTOS Patch set 3 for 5.3

Mahesh Radhakrishnan (1):
  board-rtos: SRCREV bump to version 01.00.10.04A

 recipes-bsp/board-rtos/board-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

-- 
1.9.1


