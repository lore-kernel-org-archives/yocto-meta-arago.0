Return-Path: <anandb@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id ACD6352A28
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 15:35:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZFvK033020
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560958515;
	bh=8z87aFDKAwtN51jHrDQh8ZUQJArCEOTdYOvWCXn6yP0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CvMab8Q0yIgrqBwsZBc/aVyLSPN98AFMNNmqnWDuz//qvTCY7HD0M9Q52Twb/ezAy
	PrFcytMa+QbnD3xDO4uJnpEpox6cEeLTlQfOypkZP0UviQUpXFEi9orax5Z+ftUliP
	OOx7JSylr8GUJOfdQnXWzwKIigsOgQVSJ9pbI6rw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JFZFF2026078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:15 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 10:35:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 10:35:15 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZAZJ117712; 
	Wed, 19 Jun 2019 10:35:14 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 21:05:07 +0530
Message-ID: <1560958508-141402-4-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560958508-141402-1-git-send-email-anandb@ti.com>
References: <1560958508-141402-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[thud] PATCH] kmscube: change dependencies for EGL / GLES2
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
X-List-Received-Date: Wed, 19 Jun 2019 15:35:58 -0000
Content-Type: text/plain

kmscube can run on any GPU that supports EGL and OpenGLES2 interfaces. Remove
the dependency on SGX.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index d041e8c..c19f550 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://git.ti.com"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=e760965096e52da8f3969dd53b6bf158"
 
-DEPENDS = "libdrm libgbm ti-sgx-ddk-um"
+DEPENDS = "libdrm libgbm virtual/egl virtual/libgles2"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r11"
+PR = "r12"
 SRCREV = "5f90636ae01b859a064b9136da4b759b41c1ee10"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
-- 
1.9.1


