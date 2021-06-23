Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 17E2E52B93
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 02:35:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15N2Zd3H081842;
	Tue, 22 Jun 2021 21:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624415739;
	bh=b/louXHXpziyXwYQxe/dWU6XfCxuj3NTiJz1yTC7l7o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b4TYmmlRBjQdMB6Y0bDA9imGHqa5dSn+fGWfNJwPryRs8TUWxd7YZ3mZoLq/Jsxdc
	WnQpG4G1dwV5KZ9Yty0XDg57aupTJ34fap++N8U4c2LgAEturmqngOLCjIewjIKiMP
	9HgIqEbaHwPQCqNtNNpQmzE+kDXwLXf0tM3+wmH0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15N2ZdLu061921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 21:35:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15N2ZcXd126415;
	Tue, 22 Jun 2021 21:35:39 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Tue, 22 Jun 2021 21:35:36 -0500
Message-ID: <20210623023538.32735-2-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623023538.32735-1-nm@ti.com>
References: <20210623023538.32735-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH 1/3] sample-files: Add a URL redirection gitconfig sample file
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
X-List-Received-Date: Wed, 23 Jun 2021 02:35:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As we move git repositories over to newer locations, there is
a definite need to redirect older url usage to newer locations.

Lets start with a basic configuration for the core repositories.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 sample-files/gitconfig.sample | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 sample-files/gitconfig.sample

diff --git a/sample-files/gitconfig.sample b/sample-files/gitconfig.sample
new file mode 100644
index 000000000000..2d06bdcd80b9
--- /dev/null
+++ b/sample-files/gitconfig.sample
@@ -0,0 +1,16 @@
+# Sample git config URL redirection
+# Copy this information to ~/.gitconfig or equivalent
+# See https://git-scm.com/docs/git-config for further information
+# To debug, use GIT_CURL_VERBOSE=1 GIT_TRACE=1
+
+[url "git://git.yoctoproject.org/meta-arago"]
+	insteadOf = git://arago-project.org/git/meta-arago
+	insteadOf = http://arago-project.org/git/meta-arago
+
+[url "git://git.yoctoproject.org/meta-ti"]
+	insteadOf = git://arago-project.org/git/meta-ti
+	insteadOf = http://arago-project.org/git/meta-ti
+
+[url "git://git.ti.com/arago-project/oe-layersetup"]
+	insteadOf = git://arago-project.org/git/projects/oe-layersetup
+	insteadOf = http://arago-project.org/git/projects/oe-layersetup
-- 
2.32.0


