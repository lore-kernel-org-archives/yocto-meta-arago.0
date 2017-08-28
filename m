Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by arago-project.org (Postfix) with ESMTPS id BC773529A4
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 11:21:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 63so154232pgc.1
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9nSWNISaOzwtsQMPgbkQUTDZwyVqKJTvp0C9vxBk+pk=;
	b=L2ErpJCqMa/H2h/c+5idmR+NW9t5fNpns8WSUBH5Hsu9Z8kfg1uapQmI3Tj7hsoqA8
	/JaNZ7+5Rfjz/tpjmLCB5D5wo5Df+m5vijKfzw17Sq9Vaajvau0Ov6GtQjpkLiZDFfen
	GDwJp+ov4SwlUyfwT0jk3D2j4NQH/9yG2TsdGcfg99zzYhsZVNcyZm5LGNyNV8I0gpyQ
	xSVff7g6aNkZCn4A/I18YZ9IdXF5taULh99mFe64xmOBvL/2zuR37CukC0LpCOjbJZCB
	+4yvpDCpiMg9imVxIIrsRdOjwVdPMx9EZv64gpnwwxv+IwU6xoeYvBLf093boDebFXRQ
	NeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9nSWNISaOzwtsQMPgbkQUTDZwyVqKJTvp0C9vxBk+pk=;
	b=IU6H4Ubp4eMKNI5bQPsaBvR0khyE5Nw0EHs0duBclvlSqbnPHYaiZIuUAfBzi4QJvk
	FxdACw59ohDhAEK750BiOVsyhI1wgV4bug7XGzegu5jfPA70LWiBIksChkLNPp/6ZMfz
	XaOAN9ZFXthj452InT7qkGjp4QORJa5pBdkZHiCe/KfCu+AAi4fmwO1ae9IKBPQ6DlBq
	7viTIgZZEkKUTiktTrq/fIJeIQ4TbrNiji9yWmuuGXeSy6d3B+J893Ht+09E1sU647iy
	0o2mC6zlncfrQ3k9JX7CdLN7Qf6ZlCA6CKASw+5p5Y+jz6xFRSILZQc/UoVaseqyebJt
	CG9g==
X-Gm-Message-State: AHYfb5hen/74C1CpFzgbVo/5AZ9BcaRd7gO4YYQgUq3ayCA6424j1+rh
	TaGcJZCc1uUDVFRo
X-Received: by 10.98.198.12 with SMTP id m12mr268185pfg.46.1503919283171;
	Mon, 28 Aug 2017 04:21:23 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-96.flip.co.nz.
	[103.224.128.96]) by smtp.gmail.com with ESMTPSA id
	k192sm308676pga.78.2017.08.28.04.21.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Aug 2017 04:21:22 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 28 Aug 2017 23:21:08 +1200
Message-Id: <1503919268-29717-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [master][PATCH] packagegroup-arago-qte: Add qtconnectivity module
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
X-List-Received-Date: Mon, 28 Aug 2017 11:21:26 -0000

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index 0b04b83..88ca23b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -46,6 +46,8 @@ QT5_ESSENTIALS = "\
     qtvirtualkeyboard-qmlplugins \
     qtwebengine-qmlplugins \
     liberation-fonts \
+    qtconnectivity \
+    qtconnectivity-qmlplugins \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


