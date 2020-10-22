Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 829EA520DE
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2020 11:53:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MBoseK077869
	for <meta-arago@arago-project.org>; Thu, 22 Oct 2020 06:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603367454;
	bh=oK1MCOUqqNYdKIe0ODWlnT821f73XGnbW2vcgisCMzs=;
	h=From:To:CC:Subject:Date;
	b=U7GfHK3HhfJLN8y31sRnfXzw+VS37ARbSAycmJ4zezMK2/MJF/npWwhLKfqO9/Ul/
	tg59na4I1nKrc+Kup/WKXrAPfkX4mt2xwI9mtEJnESMhzXuxS6K1rZVXv1kS2VeTWV
	aa6yl0msM6uEAaBEYcDcRU75LOCtyEi3h5zGIons=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MBosKc035721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Oct 2020 06:50:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 22 Oct 2020 06:50:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 22 Oct 2020 06:50:54 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MBos9a117775;
	Thu, 22 Oct 2020 06:50:54 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.246] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	09MBosfT104174; Thu, 22 Oct 2020 06:50:54 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>, Dan
	Murphy <dmurphy@ti.com>
Date: Thu, 22 Oct 2020 06:50:52 -0500
Message-ID: <20201022115052.7711-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] cairo: enable gles2 support
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
X-List-Received-Date: Thu, 22 Oct 2020 11:53:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

add gles2 support for devices which can support it.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
new file mode 100644
index 00000000..3d67bb6a
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".arago1"
+
+PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl glesv2', '', d)}"
-- 
2.17.1


