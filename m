Return-Path: <x0038811@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9B4DA52987
	for <meta-arago@arago-project.org>;
	Wed, 18 Jul 2018 08:31:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6I8VRMe106573
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 03:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531902687;
	bh=1Q6phRmsocntIIc/xXsrqzCuH23u4SYKN7odnqEV+8k=;
	h=From:To:CC:Subject:Date;
	b=m7yys73xegwk8rKOvjIP8u/PQGyOZ58+/PkKh9ogKyynZzhEb+P//RwBsz2sz/vjc
	2gZnY9/tKLz+G6dZZoPgSZnTxOcqr0U0IB4Ru3lsCH+OvGSwOJj7S0gV5YPYNnRCEL
	1WOnuRjbNjTdLZy28mzluCAtp3imUuS1HpNsXa4I=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6I8VRGG019859
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 03:31:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 18 Jul 2018 03:31:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 18 Jul 2018 03:31:27 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6I8VPtG002026;
	Wed, 18 Jul 2018 03:31:26 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Jul 2018 14:01:22 +0530
Message-ID: <1531902683-18478-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/1] gstvpe: Update SRCREV with fixes
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
X-List-Received-Date: Wed, 18 Jul 2018 08:31:35 -0000
Content-Type: text/plain

This update fixes two issues with gstvpe
1) crash issue with trick-play
2) memory-leak issue

Ramprasad N (1):
  gstvpe: Update SRCREV for bug-fixes

 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


