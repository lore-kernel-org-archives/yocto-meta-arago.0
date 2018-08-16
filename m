Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 71FB452A49
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2018 20:46:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7GKkX3i095795
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:46:33 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GKkX3g007550
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:46:33 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 16 Aug 2018 15:46:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 16 Aug 2018 15:46:33 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GKkXVE028251
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 15:46:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Aug 2018 16:46:26 -0400
Message-ID: <1534452389-38475-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/3] Cleanup k3 multimedia demos
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
X-List-Received-Date: Thu, 16 Aug 2018 20:46:41 -0000
Content-Type: text/plain

Cleanup k3 multimedia demos

Eric Ruei (3):
  matrix-gui-apps: bump SRCREV to pick up multimedia k3 support
  packagegroup-arago-tisdk-matrix: remove incompatible multimedia demo
    for k3
  packagegroup-arago-tisdk-multimedia-sdk: add barcode-roi demo for k3

 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 3 +--
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb     | 4 +++-
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb   | 3 ++-
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc         | 4 ++--
 4 files changed, 8 insertions(+), 6 deletions(-)

-- 
1.9.1


