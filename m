Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D7FCE52CB7
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7FF6640C88;
	Thu,  1 Apr 2021 21:24:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gNpodnboY4nj; Thu,  1 Apr 2021 21:24:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C1B740BA9;
	Thu,  1 Apr 2021 21:24:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3478D174557;
	Thu,  1 Apr 2021 17:24:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Apr 2021 17:23:30 -0400
Message-Id: <1617312217-14991-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 0/7] mainline fixes
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
X-List-Received-Date: Thu, 01 Apr 2021 21:23:53 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Set of fixes to enable building tisdk-base-image with ti-test against
mainline kernel/u-boot via ARAGO_BRAND=mainline

Denys Dmytriyenko (7):
  make-mod-scripts: pass CROSS_COMPILE to configure and build
  branding-mainline: remove gpu machine feature
  ti-test: combine main test and addons lists
  packagegroups: move generic tools to base packagegroup
  packagegroups: move benchmarks to test packagegroup
  ti-test: disable cmem, omapdrmtest, ti-ipc, llds for mainline brand
  tisdk-base-image: pull ti-test for mainline brand

 .../conf/distro/include/branding-mainline.inc      |   3 +
 .../recipes-core/images/tisdk-base-image.bb        |   3 +-
 .../packagegroups/packagegroup-arago-base.bb       |  14 ++-
 .../packagegroup-arago-tisdk-addons.bb             |  15 +--
 .../recipes-core/packagegroups/ti-test.bb          | 117 ++++++++++-----------
 .../make-mod-scripts/make-mod-scripts_1.0.bbappend |   1 +
 6 files changed, 74 insertions(+), 79 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend

-- 
2.7.4


