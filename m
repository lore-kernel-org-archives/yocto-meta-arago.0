Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 90D4D52A24
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 20:35:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8KXiEK024370
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573245224;
	bh=TB4i2Z9NBBib/qGYemniGBTy7hIoBhPeR4pBmwKCyUQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=juc2vThXh9nc6o1g2wIfcio8Pqa3MXWf7RwhApaWWzG1KPFJmHEAumpx9Tt3Jotdb
	80lCtG6lCKqcpMgReLNiJBNRp66LTqtQCnmN7N5cE6TkmJnM45RTTR8gKx2yCWnEIo
	z9V2NX15SrgkzqwTedbkrU3eZrUg9p7oj4BH0Ejk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8KXiJr117881
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:44 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 14:33:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 14:33:27 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8KXhVO055122
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:43 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 15:33:32 -0500
Message-ID: <20191108203333.31914-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108203333.31914-1-e-ruei1@ti.com>
References: <20191108203333.31914-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 1/2] chromium-ozone-wayland: remove virtual/libgl from DEPENDS list
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
X-List-Received-Date: Fri, 08 Nov 2019 20:35:08 -0000
Content-Type: text/plain

virtual/libgl is not required for chromium-ozone-wayland build

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../chromium/chromium-ozone-wayland_%.bbappend               | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend

diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
new file mode 100644
index 00000000..4c21576d
--- /dev/null
+++ b/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+DEPENDS_remove = "virtual/libgl"
-- 
2.17.1


