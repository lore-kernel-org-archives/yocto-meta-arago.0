Return-Path: <x0038811@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1DB4E52985
	for <meta-arago@arago-project.org>;
	Fri,  3 Aug 2018 05:32:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w735Wn9r104257
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 00:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533274369;
	bh=l97C0VKiebUUws5hkpQ8Ibwpy4Fhbq8QqEOfjODpNzI=;
	h=From:To:CC:Subject:Date;
	b=HVRQkLnWDwhbnD5IS+I5ZoexwRKaj5Vh6yVU0EC9fmEojM+TZ1JjPM8cDGFgniLd0
	IbRdUIIb4hW4kmFKEADnm7eIzkc9dqco47WETarpcc6kxBYH5iVZGC1Bp53lbjdKuf
	oQEV7ys+vgv5BCGYhQMytt1AhKR/ELIa9RS0Tx0I=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w735WnNS031303
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 00:32:49 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 3 Aug 2018 00:32:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 3 Aug 2018 00:32:49 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w735Wm0h014582;
	Fri, 3 Aug 2018 00:32:48 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Aug 2018 11:02:45 +0530
Message-ID: <1533274366-22908-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/1] Update SRCREV for omapdrmtest
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
X-List-Received-Date: Fri, 03 Aug 2018 05:32:57 -0000
Content-Type: text/plain

This updates following
* UYVY buffer support with waylandsink
* New application to read and display raw YUV/RGB files

Ramprasad N (1):
  omapdrmtest: Update SRCREV

 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


