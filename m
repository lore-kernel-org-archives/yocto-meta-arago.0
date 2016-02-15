Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CA43D52A8B
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 17:19:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FHJZ5W001213
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZTM003738
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 11:19:35 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FHJZdp000789;
	Mon, 15 Feb 2016 11:19:35 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aVMoA-0000P3-Fy; Mon, 15 Feb 2016 12:19:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Feb 2016 12:19:26 -0500
Message-ID: <1455556771-1512-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] tisdk-server-extra-rootfs-image
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
X-List-Received-Date: Mon, 15 Feb 2016 17:19:38 -0000
Content-Type: text/plain

Create new rootfs image which is not constrained by the ubifs size limit.

Jacob Stiffler (5):
  packagegroup-arago-tisdk-addons: Add ${PN}-extra package
  tisdk-rootfs-image: Add addons-extra packagegroup
  tisdk-server-rootfs-image: Remove test-addons packagegroup
  tisdk-server-extra-rootfs-image: Create new server rootfs image
  arago-core-tisdk-image: Add tisdk-server-extra rootfs to keystone
    TARGET_IMAGES

 .../recipes-core/images/arago-core-tisdk-image.inc |  2 +-
 .../recipes-core/images/tisdk-rootfs-image.bb      |  1 +
 .../images/tisdk-server-extra-rootfs-image.bb      | 10 +++++
 .../images/tisdk-server-rootfs-image.bb            |  2 -
 .../packagegroup-arago-tisdk-addons.bb             | 46 ++++++++++++----------
 5 files changed, 38 insertions(+), 23 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb

-- 
1.9.1


