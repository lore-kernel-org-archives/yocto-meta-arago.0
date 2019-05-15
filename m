Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6469A529AB
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2019 07:58:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4F7vTaG069353
	for <meta-arago@arago-project.org>; Wed, 15 May 2019 02:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557907049;
	bh=aHHhwSCnaAd0AYLMOIcpjvDg+dMfhZ86JLg9zg0xH2w=;
	h=From:To:CC:Subject:Date;
	b=aOQoaO2MqgHNBaEZ7p946iTDGjblIFT1qMOy6eLMFCJB9GaMej3V6No246U8L8wnk
	QxfdyhxmNKIuFsLazfkf+i/srwpdyn+As5FG+mp8TIhb2zJI1h2NbopkTO5bkfSqYf
	6kd0sFomIRpV7Y8xoAsvVeP261otKhZjXc6aH5SA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4F7vTYB063171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 15 May 2019 02:57:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 15 May 2019 02:57:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 15 May 2019 02:57:29 -0500
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4F7vRiF067587;
	Wed, 15 May 2019 02:57:28 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 May 2019 13:27:24 +0530
Message-ID: <1557907045-23765-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master 0/1] Update SRCREV for the fixes
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
X-List-Received-Date: Wed, 15 May 2019 07:58:00 -0000
Content-Type: text/plain

This patch address following issues with gst-ducati plugin
* Issue with interlaced streams playback
* Repeated video issue with trick-play

Ramprasad N (1):
  gstreamer1.0-plugins-ducati: Update SRCREV with fixes

 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


