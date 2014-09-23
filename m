Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 42949529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:53:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFrmt3018416
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:48 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFrmqR017663
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:53:48 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:53:47 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NFrk2F024814;	Tue, 23 Sep 2014 10:53:47 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Sep 2014 21:20:21 +0530
Message-ID: <1411487426-31949-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master 0/5] GFX/MM patches from meta-glsdk layer
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
X-List-Received-Date: Tue, 23 Sep 2014 15:53:49 -0000
Content-Type: text/plain

This patch set contains the first set of patches upstreamed to 
meta-arago from meta-glsdk.

Each of these patches can be independently applied in any order.

Karthik Ramanan (5):
  gst-plugins-vpe: Bug fixes and feature additions
  gst-plugins-ducati: Support encoder and bug fix updates
  libdce: Single planar encode support
  example-applications: Adding repository of GLSDK example applications
  omapdrmtest: Added new tests and bug fixes.

 .../example-applications/example-applications.bb   |   15 +++++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |    6 +++---
 .../gst-plugins-ti/gst-plugins-ducati_git.bb       |    4 ++--
 .../gst-plugins-ti/gst-plugins-vpe_git.bb          |    4 ++--
 .../recipes-multimedia/libdce/libdce_git.bb        |    4 ++--
 5 files changed, 24 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/example-applications/example-applications.bb

-- 
1.7.9.5


