Return-Path: <x0038811@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8B35B52A4A
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 07:48:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N7mD19030701
	for <meta-arago@arago-project.org>; Thu, 23 Aug 2018 02:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535010493;
	bh=av3nvxloOSbC92Mm62NCPPWizo98N0O8+tHn0KitHwE=;
	h=From:To:CC:Subject:Date;
	b=ZoOqK3VB/DYwE6gdr4ziCH/pY+ER8TIuCwC4aZS+/5NkkL+aQBWC8nGg/JxBkj5A6
	cMltHQ2dCfXj4l0K3dk4pDlXOdyOtO+gFQfD6HRX1PYAhC6iC7PqFS1nDTTLHZMG0l
	/pUsLq4s0X9txmHVSN+hcXh5KwH6+7U72fHxI4Ug=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N7mDIE013847
	for <meta-arago@arago-project.org>; Thu, 23 Aug 2018 02:48:13 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 02:48:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 02:48:13 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N7mBPQ026238;
	Thu, 23 Aug 2018 02:48:12 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Aug 2018 13:18:08 +0530
Message-ID: <1535010489-14848-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/1] example-applications: Update SRCREV
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
X-List-Received-Date: Thu, 23 Aug 2018 07:48:21 -0000
Content-Type: text/plain

This update creates a new application to demo glReadPixels
in wayland-client

Ramprasad N (1):
  example-applications: Update SRCREV

 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


