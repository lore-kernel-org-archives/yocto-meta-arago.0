Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 2D1D952CB2
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 02:57:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1462wH59107176;
	Wed, 5 May 2021 21:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620269897;
	bh=6iSgmE5KLnwZm72gaVVtqPRWjvq77BepzLrCy4dbHbg=;
	h=From:To:CC:Subject:Date;
	b=sx72oUx4A62iLgKabECRJ0Io6DaS31ve94gUXRX+itzGQUJ7/5Vc7LfxQ5lPpyVU5
	QIUjoA0bjxsas1tobPl3n6YnilQfXNyDeYTmxnGP1XcN7Sy91iLHL6TzQv9PhgO/0s
	eyjliUMb/+iwjLHTa9DPw0XGtBRteRCS1jXG8YSU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1462wHYw102214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 21:58:17 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 21:58:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 21:58:17 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1462wHsA081853;
	Wed, 5 May 2021 21:58:17 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	1462wHR8003287; Wed, 5 May 2021 21:58:17 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 21:58:06 -0500
Message-ID: <20210506025812.25256-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [dunfell/master][PATCH 0/6] Install qt based demos on machine feature check
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
X-List-Received-Date: Thu, 06 May 2021 02:57:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following demo packages are qt based and have a dependency on it, so they
have to be installed conditionally on the machine feature gpu presence. This
series add those changes to ensure dependencies are populated correctly for
different sdk images.

  - pdm-anomaly-detection
  - matrix-analytics-pdm-anomaly-detection
  - dual-camera-demo
  - matrix-gui-apps-dual-camera
  - image-gallery
  - matrix-gui-apps-image-gallery
  - evse-hmi
  - matrix-hmi-demo-evse
  - matrix-hmi-demo-mmwavegesture
  - matrix-hmi-demo-protection-relays

Gowtham Tammana (6):
  ti-demos: Add feature check for pdm demos
  packagegroup-arago-tisdk*: add feature check for pdm-anomaly-detection
  packagegroup-arago-tisdk*: Add feature depenendency for
    dual-camera-demo
  packagegroups-arago-tisdk*: image-gallery: Add machine feature
    conditional
  tisdk-core-bundle: Conditionally install the hmi demos
  packagegroup-arago-tisdk-hmi*: Install them conditionally

 .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 12 +++--
 ...kagegroup-arago-tisdk-addons-sdk-target.bb | 13 +++--
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  4 +-
 .../packagegroup-arago-tisdk-hmi.bb           |  4 +-
 .../packagegroup-arago-tisdk-matrix.bb        | 51 +++++++++++--------
 ...gegroup-arago-tisdk-multimedia-sdk-host.bb | 11 ++--
 .../packagegroup-arago-tisdk-multimedia.bb    | 11 ++--
 .../recipes-core/packagegroups/ti-demos.bb    | 10 ++--
 9 files changed, 73 insertions(+), 45 deletions(-)

-- 
2.31.1


