Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8F6D652A2B
	for <meta-arago@arago-project.org>;
	Fri, 17 Jan 2020 18:48:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00HIkEr0107867
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2020 12:46:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579286774;
	bh=Z4aj/5Uabux2MbWfWXdCxT+SuG16CarMCJNyG//rRH4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dTJVau5AHVJtkKEIsgHg2odA3jV7tSJFswb81B0xf9KJ9fKs597FJgpQOmpW356X4
	i5Q3YIZ3SOeOyiXkZQ5ayeRvEwMln8VvTHwF2HybcC8lCqc8TEbYzQ1Xp1wU+MrCFw
	YMrhXzvCnYcmhmmAgQE3g4IpxYlcxNoiykqZMoX0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00HIkEnK082488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 17 Jan 2020 12:46:14 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 17 Jan 2020 12:46:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 17 Jan 2020 12:46:14 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HIkDrB085509;
	Fri, 17 Jan 2020 12:46:13 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Jan 2020 13:27:12 -0500
Message-ID: <1579285632-13770-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579285632-13770-1-git-send-email-j-stiffler@ti.com>
References: <1579285632-13770-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 2/2] packagegroups: opencl: install offline-compiled examples by default
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
X-List-Received-Date: Fri, 17 Jan 2020 18:48:02 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index dfd8555..d19098e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -9,13 +9,10 @@ inherit packagegroup
 PACKAGES =+ "${PN}-extra"
 
 MAIN_PKGS = " \
-    opencl-examples \
+    opencl-examples-offline-compile \
 "
 
 EXTRA_PKGS = " \
-    opencl-staticdev \
-    opencl-examples-dev \
-    openmpacc-examples-dev \
     python-pyopencl \
 "
 
@@ -26,7 +23,6 @@ EXTRA_PKGS_append_k2hk = " \
 
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
-    opencl-examples \
     kaldi \
     ti-fftw-examples \
 "
-- 
2.7.4


