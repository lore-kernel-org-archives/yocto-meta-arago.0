Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EF36C529CC
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 22:34:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LMYGqE004898
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506033256;
	bh=9yQYDv8x+rdSSPFGRB90KpcmjoPMldfLgk6x3yMIK7Q=;
	h=From:To:CC:Subject:Date;
	b=gCJFYtsn+SknTVvBg8xR1irIsG95EOsYSZGJen7a4Cbr1nIpCyD11iZJJ+VR6dQON
	4jlVJw1v0iexBqtsysbU0O7FsOcOwexYvKVlruHmIq7qBZs6WV2mv5kQLrtjDz0+Yv
	hV8gHhNGbjOagYAwoFP/TOD1L47VvBN33JRLxba0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYBZ2023886
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 17:34:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 17:34:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 17:34:11 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LMYBom020956;
	Thu, 21 Sep 2017 17:34:11 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Sep 2017 18:34:01 -0400
Message-ID: <1506033246-18916-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH v2 0/5] tiovx: Add TIOVX (OpenVX), host side
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
X-List-Received-Date: Thu, 21 Sep 2017 22:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* TIOVX-SYS-IFACE includes API between TIOVX framework and IPC implementation, and DSP firmware (includes kernels and DSP-side of TIOVX framework)
* TIOVX is TI’s implementation of OpenVX Khronos Standard. TIOVX allows users to create vision and compute applications using OpenVX API and can be executed on TI SoCs.
  TIOVX also provides optimized OpenVX kernels for C66x DSP. An extension API allows users to integrate their own natively developed custom kernels and call them using OpenVX APIs.
* TIOVX-APP includes sample TIOVX applications (e.g. conformance tests) and IPC implementation


Djordje Senicic (5):
  tiovx-sys-iface: Add interface header files between TIOVX library and
    IPC implementation
  tiovx-lib-host:Add recipe for TI OpenVX library, host side
  tiovx-app-host:Add recipe for TI OpenVX IPC HOST implementation and
    sample application for running OpenVX conformance tests.
  packagegroup-arago-tisdk-addons-sdk-target: add tiovx to devkit
  packagegroup-arago-tisdk-addons: add tiovx-app

 ...agegroup-arago-tisdk-addons-sdk-target.bbappend |   6 +
 .../packagegroup-arago-tisdk-addons.bbappend       |   2 +
 recipes-ti/includes/tisdk-paths.inc                |   3 +
 ...hs-for-Yocto-build-and-add-RTOS-build-var.patch | 133 +++++++++++++++++++++
 recipes-ti/tiovx/tiovx-app-host.bb                 |  33 +++++
 recipes-ti/tiovx/tiovx-lib-host.bb                 |  41 +++++++
 recipes-ti/tiovx/tiovx-sys-iface.bb                |  32 +++++
 recipes-ti/tiovx/tiovx-sys.inc                     |   5 +
 8 files changed, 255 insertions(+)
 create mode 100644 recipes-ti/tiovx/files/0001-Fix-paths-for-Yocto-build-and-add-RTOS-build-var.patch
 create mode 100644 recipes-ti/tiovx/tiovx-app-host.bb
 create mode 100644 recipes-ti/tiovx/tiovx-lib-host.bb
 create mode 100644 recipes-ti/tiovx/tiovx-sys-iface.bb
 create mode 100644 recipes-ti/tiovx/tiovx-sys.inc

-- 
1.9.1


