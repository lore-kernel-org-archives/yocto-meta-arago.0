Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2C8B052AD8
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 22:02:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DM2GYw016387
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DM2GZH005571
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 17:02:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Jun 2014 17:02:16 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s5DM2Dfn009769;	Fri, 13 Jun 2014 17:02:14 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jun 2014 17:02:07 -0500
Message-ID: <1402696932-21888-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] Update default U-Boot to mainline version
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
X-List-Received-Date: Fri, 13 Jun 2014 22:02:17 -0000
Content-Type: text/plain

These patches will have the effect of making U-Boot mainline the
default for the current active platforms and future platforms
unless overridden on a per machine basis.

These patches depend on the u-boot_2014.07 patches submitted to the
meta-ti mailing list

Chase Maupin (5):
  branding-amsdk: set u-boot preferred provider
  branding-glsdk: set u-boot preferred provider
  arago-prefs: set default u-boot for keystone to u-boot-ti-staging
  arago-prefs: Use mainline u-boot by default
  u-boot: set mainline u-boot to AUTOREV

 .../conf/distro/include/arago-prefs.inc            |   12 ++++++++----
 .../conf/distro/include/branding-amsdk.inc         |    9 ++++++---
 .../conf/distro/include/branding-glsdk.inc         |    3 +++
 .../recipes-bsp/u-boot/u-boot_2014.07.bbappend     |    6 ++++++
 4 files changed, 23 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2014.07.bbappend

-- 
1.7.9.5


