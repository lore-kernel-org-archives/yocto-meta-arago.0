Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A09D052A22
	for <meta-arago@arago-project.org>;
	Mon, 23 Nov 2015 17:40:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tANHefZi009802
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHeeo6001370
	for <meta-arago@arago-project.org>; Mon, 23 Nov 2015 11:40:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Nov 2015 11:40:40 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANHeem3010388;
	Mon, 23 Nov 2015 11:40:40 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1a0v6W-0005J4-0h; Mon, 23 Nov 2015 12:40:40 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Nov 2015 12:40:32 -0500
Message-ID: <1448300436-20360-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Update keystone devkit
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
X-List-Received-Date: Mon, 23 Nov 2015 17:40:47 -0000
Content-Type: text/plain

Update keystone devkit to be on par with sitara devkits.

This addresses LCPD-5347.

Jacob Stiffler (4):
  tisdk-image.bbclass: Remove wildcard from search for devkit
  meta-toolchain-arago-tisdk: Split common content into inc file
  meta-toolchain-arago-tisdk-server: tisdk devkit without QT
  arago-core-tisdk-image: use meta-toolchain-arago-tisdk-server for
    keystone

 meta-arago-distro/classes/tisdk-image.bbclass                    | 2 +-
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc | 4 ++--
 .../recipes-core/meta/meta-toolchain-arago-tisdk-server.bb       | 6 ++++++
 .../recipes-core/meta/meta-toolchain-arago-tisdk.bb              | 9 ++-------
 .../recipes-core/meta/meta-toolchain-arago-tisdk.inc             | 8 ++++++++
 5 files changed, 19 insertions(+), 10 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk-server.bb
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.inc

-- 
1.9.1


