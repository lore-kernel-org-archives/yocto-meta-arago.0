Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75192C35FF9
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.39073.1741790742377058425
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L75/dQXB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfDG1525228
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=2K4T8GEhiwMte+xVitRcwRZw2uIFAPCdiZEY8P0ILcc=;
	h=From:To:Subject:Date;
	b=L75/dQXBFI+3A7zPbJj4dSZjVh0LOr7IcI8MfqOfMMKT5jjXO1zXzOl6TkFrt+RZP
	 HZD1XCb5Hetj0ip/qRM/yPut1rl+pkOgPIU/e8xXMjaIbj3wwe5ZlxcM6LCWc2+oA6
	 WI/DQLJGsbTam19W8oqAOtrNxUCYCDiV83lR+l6Y=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfsC013968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjeHR074612;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003lQ-20; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 00/10] Wrap bbappends in a
Date: Wed, 12 Mar 2025 09:45:30 -0500
Message-ID: <20250312144540.14210-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15997

We are moving to make the meta-arago layers Yocto Project Compatible.

https://www.yoctoproject.org/development/yocto-project-compatible-layers/

We have been cleaning up the layer according to the yocto-check-layer
tool.  This series address the idea that simply adding a layer into a
build (but not referencing anything from that layer), should not change
the builds in any way.  The main source for violating this check is
having a "naked" bbappend file that just blindly makes changes to a
recipe from another layer.

To address this we are wrapping our bbappends behind a guard.  We move
the contents of the bbappend into a .inc file, and change the bbappend
to only load that .inc if we are building something related to the
layer.  In some cases is that is basing it off of building Arago as the
distro, in others it is based on if we are build a TI SOC from meta-ti.

Ryan Eatmon (10):
  irqbalance: Wrap the bbappend in a compliant manner
  pm-qa: Wrap the bbappend in a compliant manner
  piglit: Wrap the bbappend in a compliant manner
  mtd-utils: Wrap the bbappend in a compliant manner
  v4l-utils: Wrap the bbappend in a compliant manner
  gstreamer1.0-plugins-good: Wrap the bbappend in a compliant manner
  wayland-protocols: Wrap the bbappend in a compliant manner
  glfw: Wrap the bbappend in a compliant manner
  open62541: Wrap the bbappend in a compliant manner
  open62541: Fix Upstream-Status typo in patch

 .../{pm-qa_%.bbappend => pm-qa-arago.inc}     |  5 +-
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend   | 10 ++--
 ...ance_git.bbappend => irqbalance-arago.inc} |  0
 .../irqbalance/irqbalance_git.bbappend        |  8 ++--
 ...en62541_%.bbappend => open62541-arago.inc} |  8 ++--
 ...Lists-do-not-install-git-directories.patch |  2 +-
 .../open62541/open62541_%.bbappend            | 42 ++---------------
 .../glfw/{glfw_%.bbappend => glfw-arago.inc}  |  0
 .../recipes-graphics/glfw/glfw_%.bbappend     | 10 ++--
 ...%.bbappend => wayland-protocols-arago.inc} |  2 +-
 .../wayland/wayland-protocols_%.bbappend      | 15 ++----
 ... gstreamer1.0-plugins-good_1.24-arago.inc} |  2 +-
 .../gstreamer1.0-plugins-good_1.24.%.bbappend | 12 ++---
 ...l-utils_%.bbappend => v4l-utils-arago.inc} |  2 +-
 .../v4l2apps/v4l-utils_%.bbappend             |  9 ++--
 .../recipes-core/packagegroups/ti-test.bb     |  5 +-
 ...{mtd-utils_%.bbappend => mtd-utils-ti.inc} |  0
 .../recipes-devtools/mtd/mtd-utils_%.bbappend | 47 ++-----------------
 .../{piglit_%.bbappend => piglit-ti.inc}      |  0
 .../recipes-graphics/piglit/piglit_%.bbappend | 32 ++-----------
 20 files changed, 44 insertions(+), 167 deletions(-)
 copy meta-arago-distro/recipes-devtools/pm-qa/{pm-qa_%.bbappend => pm-qa-arago.inc} (62%)
 copy meta-arago-distro/recipes-extended/irqbalance/{irqbalance_git.bbappend => irqbalance-arago.inc} (100%)
 copy meta-arago-extras/recipes-connectivity/open62541/{open62541_%.bbappend => open62541-arago.inc} (83%)
 copy meta-arago-extras/recipes-graphics/glfw/{glfw_%.bbappend => glfw-arago.inc} (100%)
 copy meta-arago-extras/recipes-graphics/wayland/{wayland-protocols_%.bbappend => wayland-protocols-arago.inc} (85%)
 copy meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.%.bbappend => gstreamer1.0-plugins-good_1.24-arago.inc} (83%)
 copy meta-arago-extras/recipes-multimedia/v4l2apps/{v4l-utils_%.bbappend => v4l-utils-arago.inc} (69%)
 copy meta-arago-test/recipes-devtools/mtd/{mtd-utils_%.bbappend => mtd-utils-ti.inc} (100%)
 copy meta-arago-test/recipes-graphics/piglit/{piglit_%.bbappend => piglit-ti.inc} (100%)

-- 
2.17.1


