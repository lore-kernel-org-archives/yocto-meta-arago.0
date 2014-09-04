Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E833552A72
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 15:34:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84FYI0h007784
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:34:18 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FYIFm031857
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:34:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:34:17 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FYFka029950;
	Thu, 4 Sep 2014 10:34:16 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 21:04:11 +0530
Message-ID: <1409844854-17247-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Subject: [for master] [PATCH 0/3] Wilink R8.4 enablement for dra7xx
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
X-List-Received-Date: Thu, 04 Sep 2014 15:34:19 -0000
Content-Type: text/plain

The connectivity packagegroup and bt-firmware recipes were
missing some support for omap-a15 based targets. 

This has been validated on the dra7xx target and the 
patches have been reviewed with ECS team.

Karthik Ramanan (3):
  tisdk-connectivity: Add support for omap-a15 based targets
  bt-firmware: Add support for omap-a15 based targets
  bt-firmware: Override Makefile to handle UNKNOWN platform

 .../packagegroup-arago-tisdk-connectivity.bb       |  9 ++++-
 ...-Remove-platform-check-and-install-defaul.patch | 41 ++++++++++++++++++++++
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     | 11 +++---
 3 files changed, 55 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check-and-install-defaul.patch

-- 
2.0.1


