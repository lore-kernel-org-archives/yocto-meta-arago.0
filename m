Return-Path: <>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id B8A2152993
	for <meta-arago@arago-project.org>;
	Mon, 27 Jan 2020 16:54:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RGqv37004298
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 10:52:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580143977;
	bh=zUnuEwKLEAbGKv3Z4r61l5UZlUSIA8+W62+ZtXT+t0U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vb2oS+Cm788mcAmpUXBI9MD0vOWw1eCB6QWkyiq4O/8ASaDMaPo0QmXWqE0nfFVIW
	PudbK2GD07aLc2NSH//3qMXW4fdvB24Uj2Jk81b3qDFOiunJYy3gTPv+pYWLyrnfYk
	9KDPHL665JFPGWmf0hHeoCIz7paN95x1EEQxuTyQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RGqvBx082429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 27 Jan 2020 10:52:57 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 27 Jan 2020 10:52:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 27 Jan 2020 10:52:57 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RGqvYK113794;
	Mon, 27 Jan 2020 10:52:57 -0600
Received: from localhost ([10.250.70.160])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	00RGqv313002; Mon, 27 Jan 2020 10:52:57 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 27 Jan 2020 11:52:55 -0500
Message-ID: <20200127165255.12314-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127165255.12314-1-afd@ti.com>
References: <20200127165255.12314-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master][PATCH 2/2] weston-conf: Do not set WAYLAND_DISPLAY manually
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
X-List-Received-Date: Mon, 27 Jan 2020 16:54:49 -0000
Content-Type: text/plain

This environment variable indicates to weston what display to use.
Setting this to 'wayland-0' causes weston to attempt to use another
wayland session as the backend, instead of the native that we want.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 .../recipes-graphics/wayland/weston-conf/wayland_env.sh          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh b/meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh
index b8853371..50979b30 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/wayland_env.sh
@@ -4,7 +4,6 @@
 
 export XDG_CONFIG_HOME=/etc/
 export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
-export WAYLAND_DISPLAY=wayland-0
 export WS_CALUDEV_FILE=/etc/udev/rules.d/ws-calibrate.rules
 
 if ! test -d "${XDG_RUNTIME_DIR}"; then
-- 
2.17.1


