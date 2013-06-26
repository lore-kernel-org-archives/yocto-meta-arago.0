Return-Path: <a0875592@swubn01>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D940652AAF
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 11:03:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QB3NcX012535
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 06:03:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QB3NbY028430
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 06:03:23 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 06:03:22 -0500
Received: from swubn01 (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5QB3Lbs008281;
	Wed, 26 Jun 2013 06:03:22 -0500
Received: from a0875592 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0875592@swubn01>)	id 1UrnVR-00031l-IH; Wed, 26 Jun 2013 16:33:21 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2013 16:33:15 +0530
Message-ID: <1372244597-11600-1-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Add GLSDK Branding
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
X-List-Received-Date: Wed, 26 Jun 2013 11:03:24 -0000
Content-Type: text/plain

* Create a GLSDK Branding configuration.
* Overlay arago information for the GLSDK kernel

Siddharth Heroor (2):
  meta-arago-distro: recipes-kernel - Overlay Arago info
  glsdk: add the initial GLSDK branding policy

 .../conf/distro/include/branding-glsdk.inc         |    4 ++++
 .../linux/linux-ti-glsdk_3.8.bbappend              |   17 +++++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-glsdk.inc
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-glsdk_3.8.bbappend

cc: Mrinmayee Hingolikar <mrinmayee@ti.com>

