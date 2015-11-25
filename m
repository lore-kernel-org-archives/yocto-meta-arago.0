Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 608F652A96
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 23:08:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN84Zi012553
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN83HR026878
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:08:03 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPN83pc018422	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 17:08:03 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 18:07:54 -0500
Message-ID: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Enable non-SGX build for AM3/AM4
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
X-List-Received-Date: Wed, 25 Nov 2015 23:08:06 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enhance meta-arago (and meta-ti) recipes to enable SGX/software rendering
graphics support based on whether or not SGX is included at Machine Feature
list.

Eric Ruei (5):
  arago.conf: Configure Weston based on the availability of SGX
  branding-processor-sdk:Update ti33x feature based on the availability
    of SGX
  tisdk-rootfs-image: Include packagegroup-arago-tisdk-graphics
    unconditionally
  qt5/qtbase: Define GLES_EXTRA_DEPS based on the availability of SGX
  ti-tisdk-makefile: Define PVR_NULLDRM based on the availability of SGX

 meta-arago-distro/conf/distro/arago.conf                              | 4 ++--
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc      | 4 ++--
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb           | 2 +-
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend                    | 4 ++--
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

-- 
1.9.1


