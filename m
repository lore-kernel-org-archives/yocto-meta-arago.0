Return-Path: <anandb@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2E0555297E
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 13:06:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KD5vdQ024551
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 08:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561035957;
	bh=9wTnYnt9tN7/219AApAaydg4x/16JvS76Arsqrssu4w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xHXGWk8HhJCTeY4UEW9NKr4Xpw0RrpWe52nfHzycGgtbMtHnBjACuiwa8w9Q+gY2i
	O+66H9dnw6ARxcvY4X+n8Poy5WcTgh1WrCFCoX8rmRDM/WkmscWkK1iJEHv1bVIGux
	ue8pfP1OfbHc3sxivB7CfHoBwQOAUd4qW1g49MaQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KD5vq5074024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 08:05:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 08:05:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 08:05:57 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KD5tjX096448; 
	Thu, 20 Jun 2019 08:05:56 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 18:35:53 +0530
Message-ID: <1561035953-140100-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560958508-141402-2-git-send-email-anandb@ti.com>
References: <1560958508-141402-2-git-send-email-anandb@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] glmark2: specify dependency on libgbm
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
X-List-Received-Date: Thu, 20 Jun 2019 13:06:39 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
index d7744ad..bc83358 100644
--- a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
@@ -36,7 +36,7 @@ CXXFLAGS += "-std=c++11"
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
 PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
-PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm"
+PACKAGECONFIG[drm-gles2] = ",,virtual/libgles2 libdrm virtual/libgbm"
 PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
 PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
 
-- 
1.9.1


