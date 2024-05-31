Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767FAC41513
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22777.1717184735915740480
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ye3wgkEy;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYEr091678;
	Fri, 31 May 2024 14:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184734;
	bh=IHt/HraBxknF0jqN5sKF926AS2f5izBgOpmq8XZUW3M=;
	h=From:To:Subject:Date;
	b=ye3wgkEyUJYtDsOrEd686/U99Tw+h6+6658V95c0w2BBm4PdVpI6Nupl5mbMkv+Ms
	 CZs8ECde8aFuakvodtBNfRMeyqcADWPIkgFAU9ZWkVqH5tImg9+G3Qfb5tuPKut6Hf
	 O57lzvDx1/chA31aH7lY0rWplyhBKGH2JcYRD/pQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjY3J039342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:34 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:34 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYPZ055162;
	Fri, 31 May 2024 14:45:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8By-0006Ee-0G; Fri, 31 May 2024 14:45:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3 0/3] Updates to support UNPACKDIR
Date: Fri, 31 May 2024 14:45:30 -0500
Message-ID: <20240531194533.23925-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15347

These are the patches needed to support the change to UNPACKDIR.  I am
not going to list what changed from v2 to v3 because it was pretty much
a full throw out and redo once things solidified, but I still wanted to
call this v3 since it is my third attempt.

Ryan Eatmon (3):
  recipes: Update to UNPACKDIR for files going into WORKDIR
  recipes: Switch away from S = WORKDIR
  websocketd: Add required GO_SRCURI_DESTSUFFIX

 .../recipes-core/matrix/matrix-gui_2.0.bb     | 14 +++++-----
 .../matrix/matrix-lighttpd-config.bb          |  5 ++--
 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  |  3 ++-
 .../bt-enable/bt-enable.bb                    |  3 ++-
 .../initscript-telnetd/initscript-telnetd.bb  |  3 ++-
 .../systemd-telnetd/systemd-telnetd.bb        |  5 ++--
 .../arago-gpl-notice/arago-gpl-notice.bb      |  5 ++--
 .../busybox/softap-udhcpd-config_1.0.bb       |  3 ++-
 .../recipes-core/psplash/psplash_git.bbappend |  2 +-
 .../recipes-core/systemd/systemd_%.bbappend   | 26 +++++++++----------
 .../recipes-core/thermal-init/thermal-init.bb |  2 +-
 .../recipes-core/udev/eudev_%.bbappend        |  4 +--
 .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  4 +--
 .../recipes-qt/qt5/qtbase_%.bbappend          |  2 +-
 .../strongswan/strongswan_%.bbappend          |  2 +-
 .../tisdk-readme/tisdk-readme.bb              |  3 ++-
 .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bb    |  3 ++-
 .../recipes-core/llvm/llvm-common.bb          |  4 +--
 .../opkg/opkg-bash-completion.bb              |  2 +-
 .../websocketd/websocketd_0.4.1.bb            |  2 +-
 .../tslib/ts-calibrate-init_1.0.bb            |  5 ++--
 .../netopeer2-server/netopeer2-server_git.bb  |  4 +--
 .../nw-configurator/nw-configurator.bb        |  5 ++--
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    |  4 +--
 24 files changed, 63 insertions(+), 52 deletions(-)

-- 
2.17.1


