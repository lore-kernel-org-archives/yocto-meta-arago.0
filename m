Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 16CEE52A39
	for <meta-arago@arago-project.org>;
	Mon,  1 Apr 2013 16:25:36 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31GPXvZ011012
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 11:25:34 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31GPW9k024319
	for <meta-arago@arago-project.org>; Mon, 1 Apr 2013 21:55:33 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 1 Apr 2013 21:55:32 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31GPTU0024449;
	Mon, 1 Apr 2013 21:55:31 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Apr 2013 11:25:24 -0500
Message-ID: <1364833527-8440-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/3] Transition to TI staging trees
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
X-List-Received-Date: Mon, 01 Apr 2013 16:25:36 -0000
Content-Type: text/plain

All,

The following patches make the default kernel and bootloader the
TI staging trees which are the integration of all outstanding
patches currently developed and being upstreamed by TI.

As part of this transition there are some components that do
not yet support the later kernel (v3.8) in this case.  These
patches disable those components from the SDKs until they can
be updated to work with the latest kernel.

Chase Maupin (3):
  tisdk-connectivity: move ti-wifi-utils
  tisdk-connectivity: remove drivers and firmware for ti33x
  arago-prefs: make the ti staging kernel and bootloader default

 .../conf/distro/include/arago-prefs.inc            |    8 +++-----
 ...ckagegroup-arago-tisdk-connectivity-sdk-host.bb |    3 +--
 .../packagegroup-arago-tisdk-connectivity.bb       |    5 ++---
 3 files changed, 6 insertions(+), 10 deletions(-)


