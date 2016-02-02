Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 20F4452A78
	for <meta-arago@arago-project.org>;
	Tue,  2 Feb 2016 13:42:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u12Dg8Bm021868
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg87c006458
	for <meta-arago@arago-project.org>; Tue, 2 Feb 2016 07:42:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u12Dg8S1012817;
	Tue, 2 Feb 2016 07:42:08 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aQbDb-0005Fz-OC; Tue, 02 Feb 2016 08:42:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Feb 2016 08:41:57 -0500
Message-ID: <1454420524-20173-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Update ipsecmgr and add back keystone LLDs
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
X-List-Received-Date: Tue, 02 Feb 2016 13:42:09 -0000
Content-Type: text/plain

* Update ipsecmgr-mod to the 4.1 kernel
* Fully integrate ipsecmgr into the SDK, including sources and
  top-level makefile target
* Add back keystone LLDs which were disabled during migration to
  4.1 kernel
* Add LLD test packages to the filesystem

Jacob Stiffler (7):
  ipsecmgr: Bump SRCREV to port to 4.1 kernel
  packagegroup-arago-base-tisdk-server-extra: Re-enable keystone LLDs
  packagegroup-arago-test-addons: Re-enable keystone LLDs and tests
  tisdk-server-rootfs-image: Add test packagegroups
  arago-source-ipk: Enable ipsecmgr-mod-src
  packagegroup-arago-tisdk-addons-sdk-host: Add ipsecmgr-mod-src to SDK
  ti-tisdk-makefile: Add ipsecmgr-mod target

 .../conf/distro/arago-source-ipk.conf              |  3 +
 .../images/tisdk-server-rootfs-image.bb            |  2 +
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 46 +++++++-----
 .../packagegroup-arago-test-addons.bb              | 84 ++++++++++++++--------
 .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  3 +-
 .../ti-tisdk-makefile/Makefile_ipsecmgr-mod        | 28 ++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +-
 .../recipes-support/ipsecmgr/ipsecmgr-mod_git.bb   |  4 +-
 .../recipes-support/ipsecmgr/ipsecmgr.inc          |  2 +-
 .../recipes-support/ipsecmgr/ipsecmgr_git.bb       |  2 +
 10 files changed, 125 insertions(+), 53 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_ipsecmgr-mod

-- 
1.9.1


