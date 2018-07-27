Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 30ECD529B9
	for <meta-arago@arago-project.org>;
	Fri, 27 Jul 2018 16:09:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6RG94f7129565
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532707744;
	bh=PbgQUPEXjAA3PpoHA/I+CG5S+EyPtf71jvQhUOikNDg=;
	h=From:To:Subject:Date;
	b=yWCtZFvodLzDLlW/2rdFTSQxELeiFEFprfqfRwhQUQdTj3LTu9H6+HzPv0PuxC3hg
	v531ZxbIAw03qJ4jkg8pHzlnisEz+352T6LJtzrQmJQPBDnCSAfEASMsxSOOLFPIzZ
	bxbTO5P18rinXlvYB5NGFPyL/MzQOUZrg04uoTMU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG94qL011972
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:04 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 27 Jul 2018 11:09:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 27 Jul 2018 11:09:04 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6RG94Kl017026
	for <meta-arago@arago-project.org>; Fri, 27 Jul 2018 11:09:04 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jul 2018 12:08:54 -0400
Message-ID: <1532707738-28510-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/4] Enable graphics for k3 devices
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
X-List-Received-Date: Fri, 27 Jul 2018 16:09:13 -0000
Content-Type: text/plain

Enable graphics for k3 devices

Eric Ruei (4):
  kmscube: add k3 support
  img-pvr-sdk: add k3 support
  maxtrx-gui: enable k3 support
  packagegroup-arago: enable graphics for k3 devices

 .../packagegroup-arago-tisdk-matrix.bb             | 22 ++++++++++--
 .../packagegroup-arago-tisdk-multimedia.bb         |  3 +-
 .../packagegroup-arago-toolchain-tisdk-target.bb   |  4 +--
 .../recipes-core/matrix/matrix-gui-3d-demos_2.0.bb |  7 +++-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |  3 +-
 .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb               | 40 ++++++++++++----------
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |  4 +--
 7 files changed, 52 insertions(+), 31 deletions(-)

-- 
1.9.1


