Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0FBF552986
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 23:33:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARNXS4B022733
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:33:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511825608;
	bh=AOgE+0TLUWLJs1XQ9A8Q72eLxOsdREtgWl7GYUa+a4U=;
	h=From:To:CC:Subject:Date;
	b=Lv/q+/C8dTiUiVYisd7NUsKzYYrnqmgb+YnW2BI0poNFgHFDock/Z3DgSQ/aWOzEJ
	J59M8KP4YfLUQ6lxu122otaFxmFgsrk1X/5b5riXgC9M2/rRHACjPVzWrsVxBR2bfZ
	fffo3iM9nneR1bktxDAiIr+ajJmZJ8MQPNfL0P7k=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARNXMgg019073
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:33:22 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 17:33:22 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 27 Nov 2017 17:33:22 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARNXMTu002011;
	Mon, 27 Nov 2017 17:33:22 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Nov 2017 18:33:15 -0500
Message-ID: <1511825598-8552-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 0/3] Package CMEM for AM4
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
X-List-Received-Date: Mon, 27 Nov 2017 23:33:38 -0000
Content-Type: text/plain

Hongmei Gou (3):
  packagegroup-arago-tisdk-addons*: add cmem and cmem-mod for AM4
  packagegroup-arago-test-addons: add cmem-test for AM4
  ti-tisdk-makefile: add cmem-mod for AM4

 .../recipes-core/packagegroups/packagegroup-arago-test-addons.bb    | 6 +++++-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 3 ++-
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 3 ++-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb        | 3 ++-
 5 files changed, 16 insertions(+), 5 deletions(-)

-- 
1.9.1


