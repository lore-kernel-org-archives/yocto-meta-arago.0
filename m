Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A4D3052A19
	for <meta-arago@arago-project.org>;
	Wed,  4 Nov 2015 20:00:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4K0KGb028790
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:20 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4K0K4t025622
	for <meta-arago@arago-project.org>; Wed, 4 Nov 2015 14:00:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 14:00:20 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4K0JUp001906;	Wed, 4 Nov 2015 14:00:19 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Nov 2015 15:00:10 -0500
Message-ID: <1446667217-21466-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Enable hardware mode wayland for AM4, and update qtbase and SGX demos
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
X-List-Received-Date: Wed, 04 Nov 2015 20:00:20 -0000
Content-Type: text/plain

Enable hardware mode wayland for AM4, and update qtbase and SGX demos

Hongmei Gou (7):
  branding-processor-sdk: add back wayland DISTRO_FEATURES for ti43x
  arago.conf: enable hardware mode weston for ti43x
  qtbase: add wayland dependency for ti43x
  img-pvr-sdk: modify BRANCH and SRCREV to update the demos for ti43x
  kmscube: add support on ti43x
  matrix-gui-3d-demos: add kmscube for ti43x
  packagegroup-arago-tisdk-matrix: update the SGX demos for ti43x

 meta-arago-distro/conf/distro/arago.conf                     |  2 ++
 .../conf/distro/include/branding-processor-sdk.inc           |  3 +--
 .../packagegroups/packagegroup-arago-tisdk-matrix.bb         | 10 +++++++++-
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend           |  4 ++--
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb           |  6 +++++-
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb        | 12 ++++++------
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb  |  4 ++--
 7 files changed, 27 insertions(+), 14 deletions(-)

-- 
1.9.1


