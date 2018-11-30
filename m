Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3C83B529C8
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2018 22:37:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAUMb4na119213
	for <meta-arago@arago-project.org>; Fri, 30 Nov 2018 16:37:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543617424;
	bh=ZY9TnH2D16R3EI/RwdZ7Ah8Zy817l5H64QPez4Kps7M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cDKBwpsoszpgtI7lt4VAQDrrJQAO7DYAm5gdUtRezMOduJBZh2GiSP93D65VPjHXB
	Ksj5jUDp2GVp/1g4VQiX2AA4OzSQrPxG9s2mV7iqykY3PCdKR72mum0T5kKeOoYJ/z
	rJBCdGZ0SLHiu1T8MXbfNPSq30d2RbBevwIcPdx0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAUMb4tw039449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Nov 2018 16:37:04 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 30 Nov 2018 16:37:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 30 Nov 2018 16:37:03 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAUMb3x9031825;
	Fri, 30 Nov 2018 16:37:03 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gSrPD-0004b5-QZ; Fri, 30 Nov 2018 16:37:03 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Nov 2018 16:36:49 -0600
Message-ID: <20181130223649.17624-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181130223649.17624-1-manisha.agrawal@ti.com>
References: <20181130223649.17624-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 3/3] qtbase_% : Add gif to the packageconfig
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
X-List-Received-Date: Fri, 30 Nov 2018 22:37:16 -0000
Content-Type: text/plain

gif file playback is needed by the qtquick based mmwavegesture-hmi demo application.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 571261ed..23fb52f0 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,6 +4,8 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
+PACKAGECONFIG += "gif"
+
 PR_append = ".arago13"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
-- 
2.13.0


