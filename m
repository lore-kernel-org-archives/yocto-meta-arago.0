Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id EE19052A24
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 22:44:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8Mgl0b086042
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573252967;
	bh=MloCwwHUmw4ENVZAs5DIb+YmOY6ZHctldrB+bG5/9dk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Qdrli0hnpo+E4EM3+7jUDZQ6itW/j80/7P0bbHHrMwpeS1oW7jHizBeD6su3ireyD
	9itrt1kzvAF7dA4d8oFlu3QHDIt9B/9JbAXsepuDZTWprnduL6vg9eXo90Zeq3BUct
	YYNE3OWB3dGHwP+DnenxZqUBXpQNTyKU3S8D0aMA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8MglXH037252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 16:42:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 16:42:47 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8MgkmA115946
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 16:42:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 17:42:33 -0500
Message-ID: <20191108224236.50548-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108224236.50548-1-e-ruei1@ti.com>
References: <20191108224236.50548-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 1/4] Revert "glmark2: specify dependency on libgbm"
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
X-List-Received-Date: Fri, 08 Nov 2019 22:44:11 -0000
Content-Type: text/plain

This reverts commit a05eeecbf1f5a09a713b8059304b0842dfbd75d8.
Start to use 2017.07 because all required EGL 1.5 extensions are
supported by Mesa-based EGL now.
---
 meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
index bc83358c..d7744add 100644
--- a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
@@ -36,7 +36,7 @@ CXXFLAGS += "-std=c++11"
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
 PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
-PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm virtual/libgbm"
+PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm"
 PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
 PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
 
-- 
2.17.1


