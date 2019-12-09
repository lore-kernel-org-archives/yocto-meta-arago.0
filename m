Return-Path: <x0038811@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B4D6C520E2
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2019 05:14:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB95Cm6t090767
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2019 23:12:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575868368;
	bh=6O8xKlrp5fjRSoxXQbScWDqj5DYMOaA59NJPc2FTFhs=;
	h=From:To:CC:Subject:Date;
	b=zP6MnycpwPrIE/auzIjGtJLpw2+X5PpkqmkaLzqH4pYnmJX4Ixv8sXsUYR9IEtIbM
	Nh77f3s3Nfi24uoN9BWBMv5yupkLGM9N4q+L2GbeGpzggyISQGdX0PF5BLi+htnP+c
	SYAFBTZMYn4kKnT0m9WZy16kdDCB/pEelH83aqj4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB95CmPl027158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2019 23:12:48 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Sun, 8 Dec 2019 23:12:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Sun, 8 Dec 2019 23:12:47 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB95Cjuu121595;
	Sun, 8 Dec 2019 23:12:46 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Dec 2019 10:42:43 +0530
Message-ID: <1575868364-11275-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master 0/1] kmscube: Update SRCREV
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
X-List-Received-Date: Mon, 09 Dec 2019 05:14:23 -0000
Content-Type: text/plain

Updated SRCREV for kmscube with a fix while using
connector-id as argument, without this fix, segmentation
fault is observed

Ramprasad N (1):
  kmscube: Update SRCREV for connector-ID fix

 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


