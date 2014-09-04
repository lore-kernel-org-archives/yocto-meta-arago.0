Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D8EA252A72
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 15:21:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84FLifJ006177
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:21:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FLilR019995
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 10:21:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 10:21:43 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84FLfTZ019403;
	Thu, 4 Sep 2014 10:21:42 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 Sep 2014 20:51:35 +0530
Message-ID: <1409844098-16836-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Subject: [for dora] [PATCH 0/3] Wilink R8.4 enablement for dra7xx
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
X-List-Received-Date: Thu, 04 Sep 2014 15:21:45 -0000
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


