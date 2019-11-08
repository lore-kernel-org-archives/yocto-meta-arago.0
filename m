Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 19828529FA
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 20:35:06 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8KXh9Z024362
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573245223;
	bh=DayH2K+q4f1C/lmXFutTxhzQlNcHETuIvcfuXOC3Wqw=;
	h=From:To:Subject:Date;
	b=jLl7kbegPBnZ1pvt7qIL58G/zgliIg2gEkhUgf+EnAP7NKc8LwgwJb/2A8vjvCZUS
	WM8hBFYezb3U5ntE9ma/wDZLDsmd1hEHNLy6gupocvZWZ/nN0yNECJcWPVTzMsWBvl
	u9Z5ewRgIfNdKx/CsN7M+yhXpuSHJ1BLPp5rWw2k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8KXhIS028444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:43 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 14:33:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 14:33:27 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8KXhVN055122
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:43 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 15:33:31 -0500
Message-ID: <20191108203333.31914-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 0/2] Enable Chromium-Ozone-Wayland 75.0
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
X-List-Received-Date: Fri, 08 Nov 2019 20:35:07 -0000
Content-Type: text/plain

Enable the latest 75.0 Chromium-Ozone-Wayland 75.0.3370.142 build
meta-browser: commit ID = 5f365ef0f842ba4651efe88787cf9c63bc8b6cb3
Need to set "ulimit -n 4096" 

Eric Ruei (2):
  chromium-ozone-wayland: remove virtual/libgl from DEPENDS list
  packagegroup-arago-tisdk-graphics: replace chromium-wayland with
    chromium-ozone-wayland

 .../chromium/chromium-ozone-wayland_%.bbappend              | 5 +++++
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb      | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend

-- 
2.17.1


