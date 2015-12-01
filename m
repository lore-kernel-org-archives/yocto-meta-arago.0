Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7B7C052A5A
	for <meta-arago@arago-project.org>;
	Tue,  1 Dec 2015 15:30:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1FUZut021345
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1FUZ05029297
	for <meta-arago@arago-project.org>; Tue, 1 Dec 2015 09:30:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:30:34 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FUY6q003898	for <meta-arago@arago-project.org>;
	Tue, 1 Dec 2015 09:30:34 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Dec 2015 10:30:13 -0500
Message-ID: <1448983818-21402-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/5] Enable non-SGX build for AM3/AM4
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
X-List-Received-Date: Tue, 01 Dec 2015 15:30:42 -0000
Content-Type: text/plain

Enhance meta-ti (and meta-arago) recipes to enable SGX/software rendering 
graphics support based on whether SGX is included at Machine Feature list.

Major changes since V1:
- ti-tisdk-makefile: Remove omapdrm-pvr related make instructions if
                     SGX is not available

Eric Ruei (5):
  arago.conf: Configure Weston based on the availability of SGX
  branding-processor-sdk:Update ti33x feature based on the availability
    of SGX
  tisdk-rootfs-image: Include packagegroup-arago-tisdk-graphics
    unconditionally
  qt5/qtbase: Define GLES_EXTRA_DEPS based on the availability of SGX
  ti-tisdk-makefile: Include omapdrm-pvr related make instructions only
    if SGX is available

 meta-arago-distro/conf/distro/arago.conf                          | 4 ++--
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc  | 4 ++--
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb       | 2 +-
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend                | 4 ++--
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb      | 8 ++++----
 5 files changed, 11 insertions(+), 11 deletions(-)

-- 
1.9.1


