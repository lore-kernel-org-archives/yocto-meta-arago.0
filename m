Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4C265529AE
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2018 17:28:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHSq3U000909
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021332;
	bh=PxNsTHmov9BGvzDFiKwMFUjEEHyjxpZM8NE6depxB8k=;
	h=From:To:Subject:Date;
	b=h+IhSUWdK4UqHonvp7AQgYTUuAAzY2PLAN0bF9q1f+2GV4SaPsfKPrFo0LJ3V6iwv
	aY3QMfMYZKx+WtdTfaCt8UwTX0KeQ4Hwpee1XoHLH/y/r8985Ug2hHdSfwhO/nDRyD
	gyGXACyVAYjug4HKWzcxXLPNg27qaboaJJ7vPH5E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSqHf018912
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:28:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:28:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSpg5028108
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2018 13:28:45 -0400
Message-ID: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 0/4] RTOS Updates for 5.0 release
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
X-List-Received-Date: Thu, 19 Jul 2018 17:29:00 -0000
Content-Type: text/plain

Updates for RTOS components as a part of Processor SDK 5.0 release.
The below contains SRCREV updates for jailhouse & removing the redundant recipes for CSL & PM as the the meta-ti patches for the same have been submitted.

Mahesh Radhakrishnan (4):
  common-csl-ip: Removing redundant recipes after upstreaming them to
    meta-ti
  pm-lld-rtos: Removing after upstreaming to meta-ti
  jailhouse: SRCREV bump
  jailhouse-examples-rtos: SRCREV bump

 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc   | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 -
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 -
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend               | 9 ---------
 recipes-support/jailhouse/jailhouse-examples-rtos_git.bb  | 4 ++--
 recipes-support/jailhouse/jailhouse_git.bb                | 6 +++---
 6 files changed, 5 insertions(+), 21 deletions(-)
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
 delete mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

-- 
1.9.1


