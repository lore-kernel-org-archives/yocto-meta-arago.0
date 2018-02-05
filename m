Return-Path: <gaurav@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E288052986
	for <meta-arago@arago-project.org>;
	Mon,  5 Feb 2018 21:30:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w15LUMr2001250
	for <meta-arago@arago-project.org>; Mon, 5 Feb 2018 15:30:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517866222;
	bh=lPQfcK2hwEp0MzferpTtWzRzJqkqyAZIM0IlfiehwT0=;
	h=From:To:CC:Subject:Date;
	b=Tjzr1KCKPQPqjuAxuGyYb+sSvoTUkDOx/8R54LuEjBr5BXohgqCY+Bls4FhvmNM8B
	b4yA6kM4Lt339w4TQMflSeKK31lBOql9tPbq/nVWpLyPqbCzLDBlT63L5ZX4ug4fbj
	WrLfv0buPc6dFfhUhRgKDRtugZiwrmXfD2ZmWK6w=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w15LUMrT010317
	for <meta-arago@arago-project.org>; Mon, 5 Feb 2018 15:30:22 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Feb 2018 15:30:22 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Feb 2018 15:30:22 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w15LUMuT008114;
	Mon, 5 Feb 2018 15:30:22 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Feb 2018 15:30:19 -0600
Message-ID: <20180205213019.82013-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] ocl: trigger opencl-examples rebuild when opencl-monitor changes
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
X-List-Received-Date: Mon, 05 Feb 2018 21:30:30 -0000
Content-Type: text/plain

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 recipes-ti/ocl/opencl-examples_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ti/ocl/opencl-examples_git.bbappend b/recipes-ti/ocl/opencl-examples_git.bbappend
index 4df65c2..b78b10c 100644
--- a/recipes-ti/ocl/opencl-examples_git.bbappend
+++ b/recipes-ti/ocl/opencl-examples_git.bbappend
@@ -1 +1,4 @@
 require ocl-1.1.14.inc
+
+PR_append = ".tisdk0"
+DEPENDS += " opencl-monitor"
-- 
2.14.1


